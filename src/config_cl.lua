--- Copyright © 2024 Joshua Nelson

AnimConfig = {}
AnimLib = {}
AnimTags = {}
AnimUtil = {}
Propset = { Lookup = {}, }

AnimConfig.Flag = {
    Loop = (1<<0),
    HoldLastFrame = (1<<1),
    NotInterruptable = (1<<2),
    UpperBody = (1<<3),
    Secondary = (1<<4),
    AbortOnPedMove = (1<<5),
    Additive = (1<<6),
    OverridePhysics = (1<<7),
    ExtractInitialOffset = (1<<8),
    ExitAfterInterrupt = (1<<9),
    TagSyncIn = (1<<10),
    TagSyncOut = (1<<11),
    TagSyncContinuous = (1<<12),
    ForceStart = (1<<13),
    UseKinematicPhysics = (1<<14),
    UseMoverExtraction = (1<<15),
    DontSuppressLoco = (1<<16),
    EndsInDeadPose = (1<<17),
    ActivateRagdollOnCollision = (1<<18),
    DontExitOnDeath = (1<<19),
    AbortOnWeaponDamage = (1<<20),
    DisableForcedPhysicsUpdate = (1<<21),
    Gesture = (1<<22),
    SkipIfBlockedByPrioTask = (1<<23),
    UseAbsoluteMover = (1<<24),
    Bit25 = (1<<25),
    UpperBodyTags = (1<<26),
    ProcessAttachmentsOnStart = (1<<27),
    ExpandPedCapsuleFromSkel = (1<<28),
    BlendoutWRTLastFrame = (1<<29),
    DisablePhysicalActivation = (1<<30),
    DisableReleaseEvents = (1<<31),
    Bit32 = (1<<32),
    -- Combo Flags
    Move = (1<<3)|(1<<4), -- UpperBody, Secondary
    MoveLoop = (1<<0)|(1<<3)|(1<<4), -- UpperBody, Secondary, Loop
    MoveHigh = (1<<3)|(1<<4)|(1<<26), -- UpperBody, Secondary, UpperBodyTags
    MoveHighLoop = (1<<0)|(1<<3)|(1<<4)|(1<<26), -- UpperBody, Secondary, Loop, UpperBodyTags
}
AnimConfig.IkFlag = {
	AIK_DISABLE_LEG_IK = (1 << 0),
	AIK_DISABLE_ARM_IK = (1 << 1),
	AIK_DISABLE_HEAD_IK = (1 << 2),
	AIK_DISABLE_TORSO_IK = (1 << 3),
	AIK_DISABLE_TORSO_REACT_IK = (1 << 4),
	AIK_USE_LEG_ALLOW_TAGS = (1 << 5),
	AIK_USE_LEG_BLOCK_TAGS = (1 << 6),
	AIK_USE_ARM_ALLOW_TAGS = (1 << 7),
	AIK_USE_ARM_BLOCK_TAGS = (1 << 8),
	AIK_PROCESS_WEAPON_HAND_GRIP = (1 << 9),
	AIK_USE_FP_ARM_LEFT = (1 << 10),
	AIK_USE_FP_ARM_RIGHT = (1 << 11),
	AIK_0x88FF50BE = (1 << 12),
	AIK_DISABLE_TORSO_VEHICLE_IK = (1 << 13),
	AIK_DISABLE_PRONE_IK = (1 << 14),
	AIK_UPPERBODY = (1 << 15),
	AIK_UPPERBODY_TAGS = (1 << 16),
	AIK_0xFCDC149B = (1 << 17),
	AIK_0x5465E64A = (1 << 18),
	AIK_DISABLE_LEG_POSTURE_IK = (1 << 19),
	AIK_0x32939A0E = (1 << 20),
	AIK_0xFADADF24 = (1 << 21),
	AIK_0x3CC5DD38 = (1 << 22),
	AIK_0xB819088C = (1 << 23),
	AIK_0xA82D04F8 = (1 << 24),
	AIK_0xF9E28A5F = (1 << 25),
	AIK_0x983AE6C1 = (1 << 26),
	AIK_0x5B5D2BEF = (1 << 27),
	AIK_0xA4F64B54 = (1 << 28),
	AIK_DISABLE_TWO_BONE_IK = (1 << 29),
	AIK_0x0C1380EC = (1 << 30),
}
-- This should probably be in farming config
AnimConfig.PitchforkScoopAmount = -1/11 -- Max amount is 1.0, so should take 11-12 scoops to empty a bale
AnimConfig.WaterSources = {
    [`p_waterpump01x`] = true,
    [`p_wellpumpnbx01x`] = true,
    [`p_barrelladle1x_culture`] = true,
    [`p_barrelladle1x_hobo`] = true,
    [`p_barrelladle1x_military`] = true,
    [`p_barrelladle1x_savage`] = true,
    [`p_barrelladle1x_survivor`] = true,
    [`p_barrel_wash01x`] = true,
    [`p_barrel_ladle01x`] = true,
    [`s_gen_barrelhalf02x`] = true,
    [`p_barrelhalf02x`] = true,
}
