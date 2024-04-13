var ValidKeys = {}
var SubmenuKeys = {}
var AnimKeys = {}
var HudTree = {}

function SendClientMessage(endpoint, data) {
    fetch(`https://${GetParentResourceName()}/${endpoint}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(data),
    }).then(resp => resp.json());
}

window.onload = function() {
    window.addEventListener('message', function(msg) {
        // console.log(msg);
        switch(msg.data.type) {
            case "show":
                InitializeTree(msg.data.optionTree);
                Open();
                break;
            case "hide":
                Close();
                break;
        }
    })
}

$(document).ready(function() {
    $(document).keydown(function(event) {
        switch(event.key) {
        case "Escape": //ESC
            // Explicitly handle Escape as exit UI
            SendClientMessage('exit', { });
            Close();
            break;
        default:
            HandleKey(event.key)
            break;
        };
    });
});

InitializeTree = function(optionTree) {
    ValidKeys = {}
    SubmenuKeys = {}
    AnimKeys = {}
    HudTree = optionTree

    $('#animOpts').html("");
    $('#subTrees').html("");
    $('#footer').html("");
    $("#subTreesSpacer").hide();
    $("#animOptsSpacer").hide();

    // console.log("tree", optionTree)
    if (optionTree.submenu) {
        for (idx in optionTree.submenu) {
            AppendSubOption(idx, optionTree.submenu[idx])
        }
    }

    if (optionTree.anims) {
        for (idx in optionTree.anims) {
            AppendAnimOption(idx, optionTree.anims[idx]);
        }
    }
}

AppendAnimOption = function(index, value) {
    AnimKeys[value.key] = index;
    if (value.name == "Exit") {
        const html = '<div class="row"> <div class="column footervalue">Cancel</div> <div class="column key">C</div> </div>'
        $("#footer").append(html);
    } else {
        $("#animOptsSpacer").show();
        const html = '<div class="row"> <div class="column value">'+value.name+'</div> <div class="column key">'+value.key+'</div> </div>';
        $("#animOpts").append(html);
    }
}

AppendSubOption = function(index, value) {
    $("#subTreesSpacer").show();
    SubmenuKeys[value.key] = index;
    const html = '<div class="row"> <div class="column value"><img class="chev" src="img/chev_r.png" />'+value.name+'</div> <div class="column key">'+value.key+'</div> </div>';

    $("#subTrees").append(html);
}

HandleKey = function(key) {
    if (SubmenuKeys[key]) {
        let idx = SubmenuKeys[key]
        // console.log(idx, HudTree)
        $("#header").html(HudTree.submenu[idx].name)
        InitializeTree(HudTree.submenu[idx])
    } else if (AnimKeys[key]) {
        let idx = AnimKeys[key]
        SendClientMessage('anim', {
            animStateName: HudTree.anims[idx].id,
            animLibName: HudTree.anims[idx].animLibName
        });
        Close();
    } else {
        SendClientMessage('exit', { key: key });
        Close();
    }
}

Open = function() {
    $("#header").html("Actions")
    $("#animation-display").show();
}

Close = function() {
    $("#animation-display").hide();
}
