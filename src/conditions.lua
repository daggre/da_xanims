--- Copyright © 2024 Joshua Nelson

local AnimalModels = {
    Cat = {
        [`a_c_cat_01`] = true,
    },
    Coyote = {
        [`a_c_coyote_01`] = true,
        [`mp_a_c_coyote_01`] = true,
    },
    Dog = {
        [`a_c_coyote_01`] = true,
        [`a_c_wolf`] = true,
        [`a_c_wolf_small`] = true,
        [`a_c_wolf_medium`] = true,
        [`a_c_dogamericanfoxhound_01`] = true,
        [`a_c_dogaustraliansheperd_01`] = true,
        [`a_c_dogbluetickcoonhound_01`] = true,
        [`a_c_dogcatahoulacur_01`] = true,
        [`a_c_dogchesbayretriever_01`] = true,
        [`a_c_dogcollie_01`] = true,
        [`a_c_doghobo_01`] = true,
        [`a_c_doghound_01`] = true,
        [`a_c_doghusky_01`] = true,
        [`a_c_doglab_01`] = true,
        [`a_c_doglion_01`] = true,
        [`a_c_dogpoodle_01`] = true,
        [`a_c_dogrufus_01`] = true,
        [`a_c_dogstreet_01`] = true,
        [`mp_a_c_dogamericanfoxhound_01`] = true,

    },
    Wolf = {
        [`a_c_wolf`] = true,
        [`a_c_wolf_small`] = true,
        [`a_c_wolf_medium`] = true,
    },
    Horse = {
        [`a_c_horse_americanpaint_greyovero`] = true,
        [`a_c_horse_americanpaint_overo`] = true,
        [`a_c_horse_americanpaint_splashedwhite`] = true,
        [`a_c_horse_americanpaint_tobiano`] = true,
        [`a_c_horse_americanstandardbred_black`] = true,
        [`a_c_horse_americanstandardbred_buckskin`] = true,
        [`a_c_horse_americanstandardbred_lightbuckskin`] = true,
        [`a_c_horse_americanstandardbred_palominodapple`] = true,
        [`a_c_horse_americanstandardbred_silvertailbuckskin`] = true,
        [`a_c_horse_andalusian_darkbay`] = true,
        [`a_c_horse_andalusian_perlino`] = true,
        [`a_c_horse_andalusian_rosegray`] = true,
        [`a_c_horse_appaloosa_blacksnowflake`] = true,
        [`a_c_horse_appaloosa_blanket`] = true,
        [`a_c_horse_appaloosa_brownleopard`] = true,
        [`a_c_horse_appaloosa_fewspotted_pc`] = true,
        [`a_c_horse_appaloosa_leopard`] = true,
        [`a_c_horse_appaloosa_leopardblanket`] = true,
        [`a_c_horse_arabian_black`] = true,
        [`a_c_horse_arabian_grey`] = true,
        [`a_c_horse_arabian_redchestnut`] = true,
        [`a_c_horse_arabian_redchestnut_pc`] = true,
        [`a_c_horse_arabian_rosegreybay`] = true,
        [`a_c_horse_arabian_warpedbrindle_pc`] = true,
        [`a_c_horse_arabian_white`] = true,
        [`a_c_horse_ardennes_bayroan`] = true,
        [`a_c_horse_ardennes_irongreyroan`] = true,
        [`a_c_horse_ardennes_strawberryroan`] = true,
        [`a_c_horse_belgian_blondchestnut`] = true,
        [`a_c_horse_belgian_mealychestnut`] = true,
        [`a_c_horse_breton_grullodun`] = true,
        [`a_c_horse_breton_mealydapplebay`] = true,
        [`a_c_horse_breton_redroan`] = true,
        [`a_c_horse_breton_sealbrown`] = true,
        [`a_c_horse_breton_sorrel`] = true,
        [`a_c_horse_breton_steelgrey`] = true,
        [`a_c_horse_buell_warvets`] = true,
        [`a_c_horse_criollo_baybrindle`] = true,
        [`a_c_horse_criollo_bayframeovero`] = true,
        [`a_c_horse_criollo_blueroanovero`] = true,
        [`a_c_horse_criollo_dun`] = true,
        [`a_c_horse_criollo_marblesabino`] = true,
        [`a_c_horse_criollo_sorrelovero`] = true,
        [`a_c_horse_dutchwarmblood_chocolateroan`] = true,
        [`a_c_horse_dutchwarmblood_sealbrown`] = true,
        [`a_c_horse_dutchwarmblood_sootybuckskin`] = true,
        [`a_c_horse_eagleflies`] = true,
        [`a_c_horse_gang_bill`] = true,
        [`a_c_horse_gang_charles`] = true,
        [`a_c_horse_gang_charles_endlesssummer`] = true,
        [`a_c_horse_gang_dutch`] = true,
        [`a_c_horse_gang_hosea`] = true,
        [`a_c_horse_gang_javier`] = true,
        [`a_c_horse_gang_john`] = true,
        [`a_c_horse_gang_karen`] = true,
        [`a_c_horse_gang_kieran`] = true,
        [`a_c_horse_gang_lenny`] = true,
        [`a_c_horse_gang_micah`] = true,
        [`a_c_horse_gang_sadie`] = true,
        [`a_c_horse_gang_sadie_endlesssummer`] = true,
        [`a_c_horse_gang_sean`] = true,
        [`a_c_horse_gang_trelawney`] = true,
        [`a_c_horse_gang_uncle`] = true,
        [`a_c_horse_gang_uncle_endlesssummer`] = true,
        [`a_c_horse_gypsycob_palominoblagdon`] = true,
        [`a_c_horse_gypsycob_piebald`] = true,
        [`a_c_horse_gypsycob_skewbald`] = true,
        [`a_c_horse_gypsycob_splashedbay`] = true,
        [`a_c_horse_gypsycob_splashedpiebald`] = true,
        [`a_c_horse_gypsycob_whiteblagdon`] = true,
        [`a_c_horse_hungarianhalfbred_darkdapplegrey`] = true,
        [`a_c_horse_hungarianhalfbred_flaxenchestnut`] = true,
        [`a_c_horse_hungarianhalfbred_liverchestnut`] = true,
        [`a_c_horse_hungarianhalfbred_piebaldtobiano`] = true,
        [`a_c_horse_john_endlesssummer`] = true,
        [`a_c_horse_kentuckysaddle_black`] = true,
        [`a_c_horse_kentuckysaddle_buttermilkbuckskin_pc`] = true,
        [`a_c_horse_kentuckysaddle_chestnutpinto`] = true,
        [`a_c_horse_kentuckysaddle_grey`] = true,
        [`a_c_horse_kentuckysaddle_silverbay`] = true,
        [`a_c_horse_kladruber_black`] = true,
        [`a_c_horse_kladruber_cremello`] = true,
        [`a_c_horse_kladruber_dapplerosegrey`] = true,
        [`a_c_horse_kladruber_grey`] = true,
        [`a_c_horse_kladruber_silver`] = true,
        [`a_c_horse_kladruber_white`] = true,
        [`a_c_horse_missourifoxtrotter_amberchampagne`] = true,
        [`a_c_horse_missourifoxtrotter_blacktovero`] = true,
        [`a_c_horse_missourifoxtrotter_blueroan`] = true,
        [`a_c_horse_missourifoxtrotter_buckskinbrindle`] = true,
        [`a_c_horse_missourifoxtrotter_dapplegrey`] = true,
        [`a_c_horse_missourifoxtrotter_sablechampagne`] = true,
        [`a_c_horse_missourifoxtrotter_silverdapplepinto`] = true,
        [`a_c_horse_morgan_bay`] = true,
        [`a_c_horse_morgan_bayroan`] = true,
        [`a_c_horse_morgan_flaxenchestnut`] = true,
        [`a_c_horse_morgan_liverchestnut_pc`] = true,
        [`a_c_horse_morgan_palomino`] = true,
        [`a_c_horse_mp_mangy_backup`] = true,
        [`a_c_horse_murfreebrood_mange_01`] = true,
        [`a_c_horse_murfreebrood_mange_02`] = true,
        [`a_c_horse_murfreebrood_mange_03`] = true,
        [`a_c_horse_mustang_blackovero`] = true,
        [`a_c_horse_mustang_buckskin`] = true,
        [`a_c_horse_mustang_chestnuttovero`] = true,
        [`a_c_horse_mustang_goldendun`] = true,
        [`a_c_horse_mustang_grullodun`] = true,
        [`a_c_horse_mustang_reddunovero`] = true,
        [`a_c_horse_mustang_tigerstripedbay`] = true,
        [`a_c_horse_mustang_wildbay`] = true,
        [`a_c_horse_nokota_blueroan`] = true,
        [`a_c_horse_nokota_reversedappleroan`] = true,
        [`a_c_horse_nokota_whiteroan`] = true,
        [`a_c_horse_norfolkroadster_black`] = true,
        [`a_c_horse_norfolkroadster_dappledbuckskin`] = true,
        [`a_c_horse_norfolkroadster_piebaldroan`] = true,
        [`a_c_horse_norfolkroadster_rosegrey`] = true,
        [`a_c_horse_norfolkroadster_speckledgrey`] = true,
        [`a_c_horse_norfolkroadster_spottedtricolor`] = true,
        [`a_c_horse_shire_darkbay`] = true,
        [`a_c_horse_shire_lightgrey`] = true,
        [`a_c_horse_shire_ravenblack`] = true,
        [`a_c_horse_suffolkpunch_redchestnut`] = true,
        [`a_c_horse_suffolkpunch_sorrel`] = true,
        [`a_c_horse_tennesseewalker_blackrabicano`] = true,
        [`a_c_horse_tennesseewalker_chestnut`] = true,
        [`a_c_horse_tennesseewalker_dapplebay`] = true,
        [`a_c_horse_tennesseewalker_flaxenroan`] = true,
        [`a_c_horse_tennesseewalker_goldpalomino_pc`] = true,
        [`a_c_horse_tennesseewalker_mahoganybay`] = true,
        [`a_c_horse_tennesseewalker_redroan`] = true,
        [`a_c_horse_thoroughbred_blackchestnut`] = true,
        [`a_c_horse_thoroughbred_bloodbay`] = true,
        [`a_c_horse_thoroughbred_brindle`] = true,
        [`a_c_horse_thoroughbred_dapplegrey`] = true,
        [`a_c_horse_thoroughbred_reversedappleblack`] = true,
        [`a_c_horse_turkoman_black`] = true,
        [`a_c_horse_turkoman_chestnut`] = true,
        [`a_c_horse_turkoman_darkbay`] = true,
        [`a_c_horse_turkoman_gold`] = true,
        [`a_c_horse_turkoman_grey`] = true,
        [`a_c_horse_turkoman_perlino`] = true,
        [`a_c_horse_turkoman_silver`] = true,
        [`a_c_horse_winter02_01`] = true,
        [`a_c_horsemule_01`] = true,
        [`a_c_horsemulepainted_01`] = true,
    },
}
local WeaponModels = {
    Knives = {
        [`weapon_melee_knife`] = true,
        [`weapon_melee_knife_jawbone`] = true,
        [`weapon_melee_knife_trader`] = true,
        [`weapon_melee_knife_civil_war`] = true,
        [`weapon_melee_knife_horror`] = true,
        [`weapon_melee_knife_rustic`] = true,
    },
    Revolvers = {
        [`weapon_revolver_cattleman`] = true,
        [`weapon_revolver_cattleman_mexican`] = true,
        [`weapon_revolver_schofield`] = true,
        [`weapon_revolver_doubleaction`] = true,
        [`weapon_revolver_doubleaction_gambler`] = true,
        [`weapon_revolver_lemat`] = true,
        [`weapon_revolver_navy`] = true,
        [`weapon_revolver_navy_crossover`] = true,
    },
    Pistols = {
        [`weapon_pistol_volcanic`] = true,
        [`weapon_pistol_semiauto`] = true,
        [`weapon_pistol_mauser`] = true,
        [`weapon_pistol_mk2`] = true,
        [`weapon_pistol_m1899`] = true,
    },
    Sidearms = {
        [`weapon_revolver_cattleman`] = true,
        [`weapon_revolver_cattleman_mexican`] = true,
        [`weapon_revolver_schofield`] = true,
        [`weapon_revolver_doubleaction`] = true,
        [`weapon_revolver_doubleaction_gambler`] = true,
        [`weapon_revolver_lemat`] = true,
        [`weapon_revolver_navy`] = true,
        [`weapon_revolver_navy_crossover`] = true,
        [`weapon_pistol_volcanic`] = true,
        [`weapon_pistol_semiauto`] = true,
        [`weapon_pistol_mauser`] = true,
        [`weapon_pistol_mk2`] = true,
        [`weapon_pistol_m1899`] = true,
        [`weapon_shotgun_sawedoff`] = true,
    },
    Longarms = {
        [`weapon_repeater_carbine`] = true,
        [`weapon_repeater_evans`] = true,
        [`weapon_repeater_henry`] = true,
        [`weapon_repeater_winchester`] = true,
        [`weapon_rifle_boltaction`] = true,
        [`weapon_rifle_springfield`] = true,
        [`weapon_rifle_varmint`] = true,
        [`weapon_rifle_elephant`] = true,
        [`weapon_sniperrifle_carcano`] = true,
        [`weapon_sniperrifle_rollingblock`] = true,
        [`weapon_shotgun_doublebarrel`] = true,
        [`weapon_shotgun_doublebarrel_exotic`] = true,
        [`weapon_shotgun_repeating`] = true,
    },
}
local InventoryItems = {
    apple = {},
    pear = {},
    bread = {},
    cannabis = {},
    cigar = {},
    cigarette = {},
    rolledcigarette = {},
    canteen = {},
    finetobacco = {},
    goldpan = {},
    matchbook = {},
    pitchfork = {},
    pipe = {},
    pipetobacco = {},
    rake = {},
    shovel = {},
    spade = {},
    nails = {},
    splitrail = {},
    oyster = {},
    clam = {},
    guitar = {},
    banjo = {},
    attach_back_guitar = {},
    cola = {},
    gingerale = {},
    sarsparilla = {},
    absinthe = {},
    beer = {},
    bourbon = {},
    brandy = {},
    bumbo = {},
    champagnebottle = {},
    cognac = {},
    gin = {},
    mead = {},
    rum = {},
    scotch = {},
    spicedrum = {},
    tequila = {},
    vodka = {},
    whiskey = {},
    winebottle = {},
    absintheshot = {},
    bourbonshot = {},
    brandyshot = {},
    cognacshot = {},
    ginshot = {},
    rumshot = {},
    scotchshot = {},
    tequilashot = {},
    vodkashot = {},
    whiskeyshot = {},

}

local GetAllConditions = function(data)
    local chk = {}

    -- Conditions -- Must evaluate to true or false, not nil
    chk.isDead = IsEntityDead(data.entity) == 1
    chk.isMale = IsPedMale(data.entity) == 1
    chk.inWater = IsEntityInWater(data.entity) == 1
    chk.inSnow = not chk.inWater and data.interact.weather.snow ~= nil
    chk.isSwimming = IsPedSwimming(data.entity) == 1
    chk.onMount = IsPedOnMount(data.entity) == 1
    chk.isRunning = IsPedRunning(data.entity) == 1
    chk.isSprinting = IsPedSprinting(data.entity) == 1
    chk.isMountSprinting = IsPedSprinting(data.mount) == 1
    chk.isAnimal = Citizen.InvokeNative(0x9A100F1CF4546629, data.entity) == 1
    chk.isChicken = chk.isAnimal and data.model == `a_c_chicken_01`
    chk.isEagle = chk.isAnimal and data.model == `a_c_eagle_01`
    chk.isHawk = chk.isAnimal and data.model == `a_c_hawk_01`
    chk.isOwl = chk.isAnimal and data.model == `a_c_owl_01`
    chk.isRaptor = chk.isHawk or chk.isEagle or chk.isOwl
    chk.isCoyote = chk.isAnimal and AnimalModels.Coyote[data.model]
    chk.isDog = chk.isAnimal and AnimalModels.Dog[data.model]
    chk.isRaccoon = chk.isAnimal and data.model == `a_c_raccoon_01`
    chk.isHorse = chk.isAnimal and AnimalModels.Horse[data.model]
    chk.isWolf = chk.isAnimal and AnimalModels.Wolf[data.model]
    chk.isAiming = IsPlayerFreeAiming(data.entity) == 1
    chk.hasPrimaryWeapon = data.hasWeapZero and data.weapHashZero ~= `weapon_unarmed`
    chk.hasSecondaryWeapon = data.hasWeapOne and data.weapHashOne ~= `weapon_unarmed`
    chk.hasWeapon = chk.hasPrimaryWeapon or chk.hasSecondaryWeapon
    chk.hasPrimaryKnife = chk.hasPrimaryWeapon and WeaponModels.Knives[data.weapHashZero] ~= nil
    chk.hasPrimaryHammer = chk.hasPrimaryWeapon and data.weapHashZero == `weapon_melee_hammer`
    chk.hasPrimaryRevolver = chk.hasPrimaryWeapon and WeaponModels.Revolvers[data.weapHashZero] ~= nil
    chk.hasPrimaryPistol = chk.hasPrimaryWeapon and WeaponModels.Pistols[data.weapHashZero] ~= nil
    chk.hasPrimaryShortarm = chk.hasPrimaryWeapon and (chk.hasPrimaryRevolver or chk.hasPrimaryPistol)
    chk.hasPrimaryLongarm = chk.hasPrimaryWeapon and WeaponModels.Longarms[data.weapHashZero] ~= nil
    chk.hasAttachPointRightHip = WeaponModels.Sidearms[data.weapHashTwo] ~= nil
    chk.isInClearedVeg = API.checkDepends("da_farming") and AnimUtil.IsInClearedVeg() or false
    chk.canFarmHandpick = not chk.isInClearedVeg and data.interact.farm.farmHandpick
    chk.canFarmKneel = not chk.isInClearedVeg and data.interact.farm.farmKneel ~= nil
    chk.canFarmRoot = not chk.isInClearedVeg and data.interact.farm.farmRoot ~= nil
    chk.canFarmShell = not chk.isInClearedVeg and data.interact.farm.farmShell ~= nil
    chk.canFarmHandSpade = not chk.isInClearedVeg and data.interact.farm.farmHandSpade ~= nil
    chk.canFarmRake = not chk.isInClearedVeg and data.interact.farm.farmRake ~= nil
    chk.canFarmShovel = not chk.isInClearedVeg and data.interact.farm.farmShovel ~= nil
    chk.canFarmTree = not chk.isInClearedVeg and data.interact.farm.farmTree ~= nil
    chk.interactPitchfork = chk.inAnimalStall
    chk.isValidTurnIn = API.checkDepends("da_farming") and AnimUtil.IsValidTurnIn() or false
    chk.pickupPitchfork = data.interact.object.Pitchfork
    chk.pickupRake = data.interact.object.Rake ~= nil
    chk.pickupShovel = data.interact.object.Shovel ~= nil
    chk.pickupSpade = data.interact.object.Spade ~= nil
    chk.pickupBale = data.interact.object.Bale ~= nil
    chk.pickupSack = data.interact.object.Sack ~= nil
    chk.pickupCrate = data.interact.object.Crate ~= nil
    chk.turnInBale = data.interact.turnIn.Bale ~= nil
    chk.turnInSack = data.interact.turnIn.Sack ~= nil
    chk.turnInCrate = data.interact.turnIn.Crate ~= nil
    chk.turnInCropType = chk.isValidTurnIn and AnimUtil.CanTurnInCrop("turnIn")
    chk.turnIn = chk.isValidTurnIn and (chk.turnInBale or chk.turnInSack or chk.turnInCrate or chk.turnInCropType)
    chk.wagonTurnInBale = data.interact.wagonTurnIn.Bale
    chk.wagonTurnInSack = data.interact.wagonTurnIn.Sack
    chk.wagonTurnInCrate = data.interact.wagonTurnIn.Crate
    chk.wagonTurnInCropType = chk.isValidTurnIn and AnimUtil.CanTurnInCrop("wagonTurnIn")
    chk.wagonTurnIn = chk.isValidTurnIn and (chk.wagonTurnInBale or chk.wagonTurnInSack or chk.wagonTurnInCrate or chk.wagonTurnInCropType)
    chk.farmKneel = data.interact.farm.Kneel ~= nil
    chk.farmHandSpade = data.interact.farm.HandSpade ~= nil
    chk.farmHandpick = data.interact.farm.Handpick ~= nil
    chk.farmTree = data.interact.farm.Tree ~= nil
    chk.farmRake = data.interact.farm.Rake ~= nil
    chk.farmShell = data.interact.farm.Shell ~= nil
    chk.farmShovel = data.interact.farm.Shovel ~= nil
    chk.farmRoot = data.interact.farm.Root ~= nil
    chk.inAnimalStall = data.interact.zone.AnimalStall ~= nil
    chk.inPaddock = data.interact.zone.Paddock ~= nil
    chk.interactTrough = data.interact.object.HayTrough ~= nil
    chk.interactWaterTrough = data.interact.object.WaterTrough ~= nil
    chk.interactTallFence = data.interact.object.TallFence ~= nil
    chk.interactShortFence = data.interact.object.ShortFence ~= nil
    chk.inspectFence = chk.interactTallFence or chk.interactShortFence
    chk.interactWaterPump = data.interact.object.WaterPump ~= nil
    chk.interactWheelbarrow = data.interact.object.Wheelbarrow ~= nil
    chk.pickupBucket = data.interact.object.Bucket ~= nil
    chk.bucketIsFull = chk.pickupBucket and AnimUtil.BucketContainsWater()
    chk.hasPitchfork = data.items.pitchfork ~= nil or chk.pickupPitchfork
    chk.hasRake = data.items.rake ~= nil or chk.pickupRake
    chk.hasShovel = data.items.shovel ~= nil or chk.pickupShovel
    chk.hasSpade = data.items.spade ~= nil or chk.pickupSpade
    chk.hasCig = data.items.cigarette ~= nil
    chk.hasRolledCig = data.items.rolledcigarette ~= nil
    chk.hasCannabis = data.items.cannabis ~= nil
    chk.hasCigar = data.items.cigar ~= nil
    chk.hasCanteen = data.items.canteen ~= nil
    chk.hasOyster = data.items.oyster ~= nil
    chk.hasClam = data.items.clam ~= nil
    chk.hasApple = data.items.apple ~= nil
    chk.hasPear = data.items.pear ~= nil
    chk.hasBread = data.items.bread ~= nil
    chk.hasGuitar = data.items.guitar ~= nil or data.items.attach_back_guitar ~= nil
    chk.hasBanjo = data.items.banjo ~= nil
    chk.hasNails = data.items.nails ~= nil
    chk.hasSplitRail = data.items.splitrail ~= nil
    chk.hasGoldPan = data.items.goldpan ~= nil
    chk.hasAnyCig = chk.hasCig or chk.hasRolledCig or chk.hasCannabis
    chk.hasMatchbook = data.items.matchbook ~= nil
    chk.canteenNotFull = chk.hasCanteen and AnimUtil.ItemHasMetadata(data.items.canteen, {water = function(a) return not a or tonumber(a) < 100 end}, {water=0})
    chk.canteenHasWater = chk.hasCanteen and AnimUtil.ItemHasMetadata(data.items.canteen, {water = function(a) return a and tonumber(a) >= 20 end}, {water=0})
    chk.atWaterSource = chk.inWater or AnimUtil.AtWaterSource(data.entity)
    chk.canRepairFence = chk.hasNails and chk.hasSplitRail
    chk.fixFence = (chk.interactTallFence or chk.interactShortFence) and chk.canRepairFence
    chk.fixShortFence = chk.interactShortFence and chk.canRepairFence and chk.hasPrimaryHammer
    chk.fixTallFence = chk.interactTallFence and chk.canRepairFence and chk.hasPrimaryHammer
    chk.hasPipe = data.items.pipe ~= nil
    chk.hasPipeTobacco = data.items.pipetobacco ~= nil or data.items.finetobacco ~= nil
    chk.hasSmoke = (chk.hasAnyCig or chk.hasCigar or (chk.hasPipe and chk.hasPipeTobacco)) and chk.hasMatchbook
    chk.hasBeer = data.items.beer ~= nil
    chk.hasNonAlcoholBottle = data.items.cola ~= nil or data.items.gingerale ~= nil or data.items.sarsparilla ~= nil
    chk.hasLiquorBottle = (data.items.absinthe ~= nil or data.items.bourbon ~= nil or data.items.brandy ~= nil or data.items.bumbo ~= nil
        or data.items.cognac ~= nil or data.items.gin ~= nil or data.items.rum ~= nil or data.items.scotch ~= nil or data.items.spicedrum ~= nil
        or data.items.tequila ~= nil or data.items.vodka ~= nil or data.items.whiskey ~= nil)
    chk.hasWineBottle = data.items.champagnebottle ~= nil or data.items.mead ~= nil or data.items.winebottle ~= nil
    chk.hasShot = (data.items.absintheshot ~= nil or data.items.bourbonshot ~= nil or data.items.brandyshot ~= nil or data.items.cognacshot ~= nil
        or data.items.ginshot ~= nil or data.items.rumshot ~= nil or data.items.scotchshot ~= nil or data.items.tequilashot ~= nil
        or data.items.vodkashot ~= nil or data.items.whiskeyshot ~= nil)
    chk.hasAlcohol = chk.hasBeer or chk.hasLiquorBottle or chk.hasWineBottle or chk.hasShot
    chk.hasBottle = chk.hasBeer or chk.hasNonAlcoholBottle or chk.hasLiquorBottle or chk.hasWineBottle

    return chk
end

local GetItems = function()
    local itemsData = {}
    local items = API.hasItems(InventoryItems)
    if not items then return itemsData; end

    for itemIndex, itemData in pairs(items) do
        if next(itemData) ~= nil then
            itemsData[itemIndex] = itemData
        end
    end

    return itemsData
end

local GetInteractData = function()
    -- TODO: Convert zones in da_lib

    -- return da.Zone.Collect(function(zoneData, collectedData)
    --     local interactType = zoneData.metadata and zoneData.metadata.interactType
    --     local typeSpecific = zoneData.metadata and zoneData.metadata.interactTypeSpecific
    --     assert(interactType ~= nil and collectedData[interactType], ("Interact type %s not found in collected data: %s"):format(interactType, log.format(zoneData)))
    --     assert(interactType == nil or typeSpecific ~= nil, ("Interact type %s requires a type specific value: %s"):format(interactType, log.format(zoneData)))
    --
    --     if interactType ~= nil then
    --         collectedData[interactType][typeSpecific] = true
    --     end
    --
    --     return collectedData
    -- end, { farm = {}, object = {}, turnIn = {}, wagonTurnIn = {}, weather = {}, zone = {}, })
    return { farm = {}, object = {}, turnIn = {}, wagonTurnIn = {}, weather = {}, zone = {}, }
end

local GetConditionData = function(entity)
    local data = {}

    data.entity = entity or PlayerPedId()
    data.model = GetEntityModel(data.entity)
    data.mount = GetMount(data.entity)
    data.hasWeapZero, data.weapHashZero = GetCurrentPedWeapon(data.entity, true, 0)
    data.hasWeapOne, data.weapHashOne = GetCurrentPedWeapon(data.entity, true, 1)
    _, data.weapHashTwo = GetCurrentPedWeapon(data.entity, true, 2)
    data.items = GetItems()
    data.interact = GetInteractData()

    return data
end

Conditions = {}
Conditions.Cache = {}
Conditions.Default = {
    isAnimal = false,
    isSwimming = false,
    isAiming = false,
    hasPrimaryWeapon = false,
    hasSecondaryWeapon = false,
    hasWeapon = false,
    onMount = false,
    isSprinting = false,
    isMountSprinting = false,
}

Conditions.BatchCache = function(entity)
    Conditions.Cache = GetAllConditions(GetConditionData(entity))
    return true
end
Conditions.Check = function(conditionList, debug)
    if not conditionList then return true; end
    local allConditions = {}

    for condition, state in pairs(Conditions.Default) do
        allConditions[condition] = state
    end
    for condition, state in pairs(conditionList) do
        allConditions[condition] = state
    end

    for condition, state in pairs(allConditions) do
        if debug then log.debug(("Condition: %s is %s (%s)"):format(condition, Conditions.Cache[condition], state)); end
        if state ~= allow then
            if Conditions.Cache[condition] ~= state then
                return false
            end
        end
    end
    return true
end
