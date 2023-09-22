	.include "asm/macros.inc"
	.include "overlay_29_023498A0.inc"

	.text

	arm_func_start GenerateMissionEggMonster
GenerateMissionEggMonster: ; 0x023498A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	str r0, [sp]
	ldrb r0, [r0, #0x16]
	cmp r0, #5
	bne _02349A54
	bl GetRandomSpawnMonsterID
	mov sb, r0
	bl IsCastform
	cmp r0, #0
	mov r0, sb
	beq _023498E4
	bl GetMonsterGenderVeneer
	cmp r0, #1
	ldreq sb, _02349A5C ; =0x0000017B
	ldrne sb, _02349A60 ; =0x000003D3
	b _02349904
_023498E4:
	bl IsCherrim
	cmp r0, #0
	beq _02349904
	mov r0, sb
	bl GetMonsterGenderVeneer
	cmp r0, #1
	moveq sb, #0x1cc
	ldrne sb, _02349A64 ; =0x00000424
_02349904:
	ldr r0, _02349A68 ; =0x000001C1
	sub r0, r0, #2
	str r0, [sp, #8]
	ldr r0, _02349A6C ; =0x00000418
	sub r0, r0, #1
	str r0, [sp, #4]
	ldr r0, _02349A68 ; =0x000001C1
	add r7, r0, #0x10
	ldr r0, _02349A6C ; =0x00000418
	add r6, r0, #0x10
	add r5, r0, #0x11
	ldr r0, _02349A68 ; =0x000001C1
	add r4, r0, #1
	add fp, r0, #2
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, _02349A68 ; =0x000001C1
	add r8, r0, #6
_0234994C:
	cmp sb, r8
	ldreq r0, _02349A6C ; =0x00000418
	addeq sl, r0, #6
	beq _02349A44
	cmp sb, #0x1d0
	ldreq r0, _02349A68 ; =0x000001C1
	addeq sl, r0, #0xd
	beq _02349A44
	cmp sb, r7
	ldreq r0, _02349A68 ; =0x000001C1
	addeq sl, r0, #0xe
	beq _02349A44
	cmp sb, r6
	ldreq r0, _02349A6C ; =0x00000418
	addeq sl, r0, #0xe
	beq _02349A44
	cmp sb, r5
	ldreq r0, _02349A6C ; =0x00000418
	addeq sl, r0, #0xf
	beq _02349A44
	cmp sb, r4
	ldreq sl, [sp, #4]
	beq _02349A44
	cmp sb, fp
	ldreq sl, _02349A6C ; =0x00000418
	beq _02349A44
	cmp sb, #0x1c4
	ldreq r0, _02349A68 ; =0x000001C1
	addeq sl, r0, #0x258
	beq _02349A44
	ldr r0, [sp, #0xc]
	cmp sb, r0
	bne _023499F4
	mov r0, #3
	bl DungeonRandInt
	cmp r0, #0
	ldreq sl, [sp, #8]
	beq _02349A44
	cmp r0, #1
	moveq sl, #0x1c0
	ldrne sl, _02349A68 ; =0x000001C1
	b _02349A44
_023499F4:
	mov r0, sb
	bl GetMonsterPreEvolution
	mov sl, r0
	add r0, sp, #0x10
	mov r1, sb
	bl GetEvoParameters
	ldrh r0, [sp, #0x16]
	cmp r0, #0xa
	bne _02349A28
	mov r0, sl
	bl FemaleToMaleForm
	mov sl, r0
	b _02349A3C
_02349A28:
	cmp r0, #0xb
	bne _02349A3C
	mov r0, sl
	bl GetSecondFormIfValid
	mov sl, r0
_02349A3C:
	cmp sl, #0
	beq _02349A4C
_02349A44:
	mov sb, sl
	b _0234994C
_02349A4C:
	ldr r0, [sp]
	strh sb, [r0, #0x18]
_02349A54:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02349A5C: .word 0x0000017B
_02349A60: .word 0x000003D3
_02349A64: .word 0x00000424
_02349A68: .word 0x000001C1
_02349A6C: .word 0x00000418
	arm_func_end GenerateMissionEggMonster

	arm_func_start ov29_02349A70
ov29_02349A70: ; 0x02349A70
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, #0
	ldr r4, _02349AD0 ; =ov29_02353538
	b _02349AC0
_02349A80:
	ldr r0, [r4]
	add r0, r0, r5, lsl #2
	add r0, r0, #0x12000
	ldr r6, [r0, #0xb28]
	mov r0, r6
	bl EntityIsValid__0234987C
	cmp r0, #0
	beq _02349AB4
	ldr r0, [r6, #0xb4]
	bl IsExperienceLocked
	cmp r0, #0
	movne r0, r6
	ldmneia sp!, {r4, r5, r6, pc}
_02349AB4:
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	mov r5, r0, asr #0x10
_02349AC0:
	cmp r5, #4
	blt _02349A80
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_02349AD0: .word ov29_02353538
	arm_func_end ov29_02349A70

	arm_func_start ov29_02349AD4
ov29_02349AD4: ; 0x02349AD4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02349C80 ; =ov29_02353538
	mov r5, r0
	ldr r2, [r2]
	mov r4, r1
	ldrb r0, [r2, #0x760]
	add r1, r2, #0x760
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r1, #3]
	bl GetAcceptedMission
	ldrb r1, [r0]
	cmp r1, #5
	bne _02349C78
	ldrb r1, [r0, #1]
	cmp r1, #0
	cmpne r1, #7
	cmpne r1, #2
	cmpne r1, #1
	cmpne r1, #8
	bne _02349B3C
	ldrsh r1, [r0, #0x10]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349B3C:
	cmp r1, #6
	cmpne r1, #4
	bne _02349B5C
	ldrsh r1, [r0, #0x14]
	cmp r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349B5C:
	cmp r1, #9
	bne _02349B90
	ldrsh r1, [r0, #0x10]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r5, #0
	ldreqsh r1, [r0, #0x14]
	cmpeq r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349B90:
	cmp r1, #3
	bne _02349BE8
	ldrb r1, [r0, #2]
	cmp r1, #0
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r1, #1
	bne _02349BC8
	ldrsh r1, [r0, #0x14]
	cmp r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349BC8:
	cmp r1, #2
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r1, #3
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349BE8:
	cmp r1, #4
	bne _02349C04
	ldrsh r1, [r0, #0x14]
	cmp r4, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349C04:
	cmp r1, #5
	moveq r1, #7
	streqb r1, [r0]
	beq _02349C60
	cmp r1, #0xa
	bne _02349C30
	ldrsh r1, [r0, #0x10]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349C30:
	cmp r1, #0xb
	bne _02349C4C
	ldrsh r1, [r0, #0xe]
	cmp r5, r1
	moveq r1, #7
	streqb r1, [r0]
	b _02349C60
_02349C4C:
	cmp r1, #0xc
	ldreqsh r1, [r0, #0x14]
	cmpeq r4, r1
	moveq r1, #7
	streqb r1, [r0]
_02349C60:
	ldrb r1, [r0]
	cmp r1, #7
	ldreqb r1, [r0, #0x16]
	cmpeq r1, #5
	bne _02349C78
	bl GenerateMissionEggMonster
_02349C78:
	bl ov29_022E8244
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_02349C80: .word ov29_02353538
	arm_func_end ov29_02349AD4

	arm_func_start ov29_02349C84
ov29_02349C84: ; 0x02349C84
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xa0
	bl IsDestinationFloor
	cmp r0, #0
	moveq r0, #0
	beq _0234A1F8
	bl GetMissionDestination
	ldr r1, _0234A200 ; =ov29_023537C8
	mov r2, #0
	mov r4, r0
	str r2, [r1]
	bl GetTargetMonsterNotFoundFlag
	cmp r0, #0
	beq _02349CD4
	bl ov29_022EAC8C
	ldr r1, _0234A204 ; =0x00000E11
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349CD4:
	ldrb r0, [r4, #1]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0234A1D4
_02349CE4: ; jump table
	b _02349D20 ; case 0
	b _02349D20 ; case 1
	b _02349D20 ; case 2
	b _02349D38 ; case 3
	b _02349D20 ; case 4
	b _02349E6C ; case 5
	b _02349D20 ; case 6
	b _02349D20 ; case 7
	b _02349D20 ; case 8
	b _0234A1A4 ; case 9
	b _0234A134 ; case 10
	b _02349F1C ; case 11
	b _0234A120 ; case 12
	b _0234A1D4 ; case 13
	b _0234A1D4 ; case 14
_02349D20:
	bl ov29_022EAC8C
	ldr r1, _0234A208 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349D38:
	ldrb r0, [r4, #2]
	cmp r0, #3
	beq _0234A1D4
	bl ov29_022EAC8C
	ldr r1, _0234A208 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrb r0, [r4, #2]
	cmp r0, #2
	bne _02349DC8
	bl ov29_023491B8
	mov r1, r0
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0234A20C ; =0x00000E34
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrsh r5, [r4, #0xa]
	add r0, sp, #0x10
	mov r2, #0
	mov r1, r5
	bl InitPortraitDungeon
	mov r1, r5
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A210 ; =0x00000E35
	add r0, sp, #0x10
	mov r2, #1
	bl DisplayMessage
	ldrsh r0, [r4, #0xa]
	mov r1, #0
	bl ov29_02348888
	b _0234A1D4
_02349DC8:
	cmp r0, #0
	bne _0234A1D4
	bl ov29_023491B8
	mov r5, r0
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, #0
	mov r1, #0xe30
	mov r2, #1
	bl DisplayMessage
	ldrsh r4, [r4, #0xa]
	add r0, sp, #0
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A214 ; =0x00000E31
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A218 ; =0x00000E32
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r0, [r5, #0xb4]
	mov r1, #0
	ldrsh r0, [r0, #2]
	bl ov29_02348888
	ldr r2, _0234A21C ; =ov29_02353538
	ldr r3, _0234A220 ; =0x00000E33
	ldr r2, [r2]
	mov r0, r5
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	b _0234A1D4
_02349E6C:
	bl ov29_022EAC8C
	ldr r1, _0234A208 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	bl ov29_023491B8
	mov r5, r0
	mov r0, #1
	mov r1, r5
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, #0
	mov r1, #0xe30
	mov r2, #1
	bl DisplayMessage
	ldrsh r4, [r4, #0xa]
	add r0, sp, #0x20
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A214 ; =0x00000E31
	add r0, sp, #0x20
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A218 ; =0x00000E32
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r0, [r5, #0xb4]
	mov r1, #0
	ldrsh r0, [r0, #2]
	bl ov29_02348888
	ldr r2, _0234A21C ; =ov29_02353538
	ldr r3, _0234A220 ; =0x00000E33
	ldr r2, [r2]
	mov r0, r5
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	b _0234A1D4
_02349F1C:
	mov r0, #4
	bl ov29_022FBBEC
	add r0, r0, #4
	bl ov29_022FA3D4
	mov r0, #1
	bl ov29_022EAF34
	bl GetMissionTargetEnemy
	mov r1, r0
	mov r0, #1
	bl ov29_0234B0CC
	mov r0, #0
	ldr r1, _0234A224 ; =0x00000E0A
	mov r2, #1
	bl DisplayMessage
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _02349FA4
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x80
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x80
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A228 ; =0x00000E0B
	add r0, sp, #0x80
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349FA4:
	cmp r0, #1
	bne _02349FF0
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x70
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x70
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A22C ; =0x00000E0C
	add r0, sp, #0x70
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_02349FF0:
	cmp r0, #2
	bne _0234A03C
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x60
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x60
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A230 ; =0x00000E0D
	add r0, sp, #0x60
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A03C:
	cmp r0, #3
	bne _0234A088
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x50
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x50
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A234 ; =0x00000E0E
	add r0, sp, #0x50
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A088:
	cmp r0, #4
	bne _0234A0D4
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x40
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x40
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A238 ; =0x00000E0F
	add r0, sp, #0x40
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A0D4:
	cmp r0, #5
	bne _0234A1D4
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x30
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	add r0, sp, #0x30
	mov r1, #0x12
	bl SetPortraitLayout
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	add r0, sp, #0x30
	mov r1, #0xe10
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A120:
	ldr r1, _0234A23C ; =0x00000E09
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A1D4
_0234A134:
	ldrb r0, [r4, #2]
	cmp r0, #5
	bne _0234A148
	bl ov29_0234AE40
	b _0234A1D4
_0234A148:
	cmp r0, #7
	bne _0234A198
	mov r0, #1
	bl ov29_0234ADCC
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0x90
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A240 ; =0x00000E07
	add r0, sp, #0x90
	mov r2, #1
	bl DisplayMessage
	mov r0, #2
	bl ov29_022EAF34
	b _0234A1D4
_0234A198:
	mov r0, #0
	bl ov29_0234ADCC
	b _0234A1D4
_0234A1A4:
	ldrb r0, [r4, #2]
	cmp r0, #2
	bne _0234A1B8
	bl ov29_0234AE40
	b _0234A1D4
_0234A1B8:
	cmp r0, #1
	bne _0234A1CC
	mov r0, #3
	bl ov29_0234ADCC
	b _0234A1D4
_0234A1CC:
	mov r0, #0
	bl ov29_0234ADCC
_0234A1D4:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldr r0, _0234A200 ; =ov29_023537C8
	ldr r0, [r0]
	cmp r0, #0
	beq _0234A1F4
	blx r0
_0234A1F4:
	mov r0, #1
_0234A1F8:
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234A200: .word ov29_023537C8
_0234A204: .word 0x00000E11
_0234A208: .word 0x00000E04
_0234A20C: .word 0x00000E34
_0234A210: .word 0x00000E35
_0234A214: .word 0x00000E31
_0234A218: .word 0x00000E32
_0234A21C: .word ov29_02353538
_0234A220: .word 0x00000E33
_0234A224: .word 0x00000E0A
_0234A228: .word 0x00000E0B
_0234A22C: .word 0x00000E0C
_0234A230: .word 0x00000E0D
_0234A234: .word 0x00000E0E
_0234A238: .word 0x00000E0F
_0234A23C: .word 0x00000E09
_0234A240: .word 0x00000E07
	arm_func_end ov29_02349C84

	arm_func_start ov29_0234A244
ov29_0234A244: ; 0x0234A244
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ov29_023491B8
	movs r4, r0
	bne _0234A26C
	ldr r1, _0234A2C8 ; =0x00000E2D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldmia sp!, {r3, r4, r5, pc}
_0234A26C:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r4
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A2A0
	ldr r1, _0234A2CC ; =0x00000E2F
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldmia sp!, {r3, r4, r5, pc}
_0234A2A0:
	mov r0, r5
	mov r1, r4
	bl CanSeeTarget
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, _0234A2D0 ; =0x00000E2C
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234A2C8: .word 0x00000E2D
_0234A2CC: .word 0x00000E2F
_0234A2D0: .word 0x00000E2C
	arm_func_end ov29_0234A244

	arm_func_start ov29_0234A2D4
ov29_0234A2D4: ; 0x0234A2D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sl, r0
	ldr sb, [sl, #0xb4]
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, sl
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, sl
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A32C
	ldr r1, _0234A5B0 ; =0x00000E27
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A5A8
_0234A32C:
	mov r0, #7
	bl IsCurrentMissionType
	cmp r0, #0
	mov r0, #0
	mov r3, #1
	beq _0234A504
	ldr r1, _0234A5B4 ; =0x00000E21
	mov r2, r0
	str r0, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _0234A5A8
	mov r7, #0
	mov fp, r7
	mov r6, #1
	ldr r5, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	mov r4, #6
	b _0234A3D8
_0234A374:
	mul r0, r7, r4
	ldr r1, [r5]
	ldr r1, [r1, #0x384]
	ldrb r2, [r1, r0]
	add r8, r1, r0
	tst r2, #1
	movne r0, r6
	moveq r0, fp
	tst r0, #0xff
	beq _0234A3D4
	ldrb r0, [r8]
	tst r0, #2
	bne _0234A3D4
	tst r0, #0x10
	beq _0234A3C4
	tst r2, #8
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0234A3D4
_0234A3C4:
	bl GetItemToDeliver
	ldrsh r1, [r8, #4]
	cmp r1, r0
	beq _0234A3E0
_0234A3D4:
	add r7, r7, #1
_0234A3D8:
	cmp r7, #0x32
	blt _0234A374
_0234A3E0:
	cmp r7, #0x32
	bne _0234A40C
	bl GetItemToDeliver
	mov r1, r0
	mov r0, #0
	bl ov29_02344B9C
	ldr r1, _0234A5BC ; =0x00000E26
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A5A8
_0234A40C:
	mov r0, #6
	ldr r1, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	mul r4, r7, r0
	ldr r0, [r1]
	ldr r0, [r0, #0x384]
	add r0, r0, r4
	ldrb r1, [r0, #1]
	cmp r1, #0
	beq _0234A47C
	ldr r0, _0234A5C0 ; =ov29_02353538
	sub r1, r1, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x12000
	ldr r1, [r0, #0xb28]
	cmp r1, #0
	moveq r0, #0
	beq _0234A468
	ldr r0, [r1]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
_0234A468:
	cmp r0, #0
	beq _0234A47C
	ldr r0, [r1, #0xb4]
	add r0, r0, #0x62
	bl ItemZInit
_0234A47C:
	ldr r0, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	ldr r0, [r0]
	ldr r0, [r0, #0x384]
	add r0, r0, r4
	bl ItemZInit
	bl RemoveEmptyItemsInBagWrapper
	ldr r1, _0234A5C4 ; =0x00000E1D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A5B8 ; =BAG_ITEMS_PTR_MIRROR
	mov r0, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x384]
	add r1, r1, r4
	bl ov29_02344B44
	ldrsh r4, [sb, #4]
	add r0, sp, #0x14
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A5C8 ; =0x00000E1E
	add r0, sp, #0x14
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A5CC ; =0x00000E1F
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r4, _0234A5D0 ; =0x00000E44
	b _0234A570
_0234A504:
	mov r2, r0
	mov r1, #0xe20
	str r0, [sp]
	bl YesNoMenu
	cmp r0, #1
	bne _0234A5A8
	ldr r1, _0234A5D4 ; =0x00000E1A
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrsh r4, [sb, #4]
	add r0, sp, #4
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A5D8 ; =0x00000E1B
	add r0, sp, #4
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A5DC ; =0x00000E1C
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r4, _0234A5E0 ; =0x00000E23
_0234A570:
	ldrsh r0, [sb, #2]
	mov r1, #0
	bl ov29_02348888
	ldr r1, _0234A5C0 ; =ov29_02353538
	mov r0, sl
	ldr r1, [r1]
	mov r3, r4
	add r1, r1, #0x348
	add r2, r1, #0x400
	mov r1, #0
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234A5A8:
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234A5B0: .word 0x00000E27
_0234A5B4: .word 0x00000E21
_0234A5B8: .word BAG_ITEMS_PTR_MIRROR
_0234A5BC: .word 0x00000E26
_0234A5C0: .word ov29_02353538
_0234A5C4: .word 0x00000E1D
_0234A5C8: .word 0x00000E1E
_0234A5CC: .word 0x00000E1F
_0234A5D0: .word 0x00000E44
_0234A5D4: .word 0x00000E1A
_0234A5D8: .word 0x00000E1B
_0234A5DC: .word 0x00000E1C
_0234A5E0: .word 0x00000E23
	arm_func_end ov29_0234A2D4

	arm_func_start ov29_0234A5E4
ov29_0234A5E4: ; 0x0234A5E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	ldr r6, [r7, #0xb4]
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r7
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A63C
	ldr r1, _0234A740 ; =0x00000E2E
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A738
_0234A63C:
	bl ov29_023491B8
	movs r4, r0
	bne _0234A65C
	ldr r1, _0234A744 ; =0x00000E2D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A738
_0234A65C:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	mov r0, r4
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A690
	ldr r1, _0234A748 ; =0x00000E2F
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234A738
_0234A690:
	mov r0, r7
	mov r1, r4
	bl CanSeeTarget
	cmp r0, #0
	mov r0, #0
	mov r2, #1
	bne _0234A6B8
	ldr r1, _0234A74C ; =0x00000E2C
	bl DisplayMessage2
	b _0234A738
_0234A6B8:
	ldr r1, _0234A750 ; =0x00000E28
	bl DisplayMessage
	ldrsh r5, [r6, #4]
	add r0, sp, #0
	mov r2, #0
	mov r1, r5
	bl InitPortraitDungeon
	mov r1, r5
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A754 ; =0x00000E29
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234A758 ; =0x00000E2A
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldrsh r0, [r6, #2]
	mov r1, #0
	bl ov29_02348888
	ldr r2, _0234A75C ; =ov29_02353538
	ldr r3, _0234A760 ; =0x00000E2B
	ldr r2, [r2]
	mov r0, r4
	add r2, r2, #0x348
	mov r1, r7
	add r2, r2, #0x400
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234A738:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234A740: .word 0x00000E2E
_0234A744: .word 0x00000E2D
_0234A748: .word 0x00000E2F
_0234A74C: .word 0x00000E2C
_0234A750: .word 0x00000E28
_0234A754: .word 0x00000E29
_0234A758: .word 0x00000E2A
_0234A75C: .word ov29_02353538
_0234A760: .word 0x00000E2B
	arm_func_end ov29_0234A5E4

	arm_func_start ov29_0234A764
ov29_0234A764: ; 0x0234A764
	stmdb sp!, {r3, lr}
	bl GetLeader
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl GetForcedLossReason
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234A764

	arm_func_start ov29_0234A790
ov29_0234A790: ; 0x0234A790
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	bl ov29_0234A764
	cmp r0, #0
	bne _0234A8A4
	mov r0, #0xa
	mov r1, #4
	bl IsCurrentMissionTypeExact
	movs r4, r0
	mov r5, #0
	beq _0234A7CC
	bl ov29_023491B8
	movs r5, r0
	beq _0234A8A4
_0234A7CC:
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r7
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A8AC ; =0x00000E14
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	bl ov29_0234AEE8
	cmp r4, #0
	beq _0234A84C
	ldr r1, [r5, #0xb4]
	mov r0, #1
	ldrsh r1, [r1, #2]
	bl ov29_0234B0CC
	ldr r1, [r5, #0xb4]
	add r0, sp, #0
	ldrsh r6, [r1, #2]
	mov r2, #0
	mov r1, r6
	bl InitPortraitDungeon
	mov r1, r6
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A8B0 ; =0x00000E18
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
_0234A84C:
	mov r1, r7
	mov r0, #1
	bl ov29_0234B0CC
	mov r0, r7
	mov r1, #0
	bl ov29_02348888
	cmp r4, #0
	beq _0234A890
	ldr r0, _0234A8B4 ; =ov29_02353538
	ldr r3, _0234A8B8 ; =0x00000E44
	ldr r1, [r0]
	mov r0, r5
	add r1, r1, #0x348
	add r2, r1, #0x400
	mov r1, #0
	bl ov29_0234AF34
	b _0234A898
_0234A890:
	ldr r0, _0234A8B8 ; =0x00000E44
	bl ov29_02348A18
_0234A898:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234A8A4:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234A8AC: .word 0x00000E14
_0234A8B0: .word 0x00000E18
_0234A8B4: .word ov29_02353538
_0234A8B8: .word 0x00000E44
	arm_func_end ov29_0234A790

	arm_func_start ov29_0234A8BC
ov29_0234A8BC: ; 0x0234A8BC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_0234A764
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	bl IsDestinationFloorWithHiddenOutlaw
	cmp r0, #0
	beq _0234A928
	bl ov29_023496B0
	cmp r0, #0
	beq _0234A918
	bl GetItemToRetrieve
	mov r1, r0
	mov r0, #0
	bl ov29_02344B9C
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A978 ; =0x00000E16
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	b _0234A958
_0234A918:
	mov r0, r4
	mov r1, #0
	bl ov29_02348888
	ldmia sp!, {r4, pc}
_0234A928:
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234A97C ; =0x00000E15
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
_0234A958:
	bl ov29_0234AEE8
	mov r0, r4
	mov r1, #0
	bl ov29_02348888
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234A978: .word 0x00000E16
_0234A97C: .word 0x00000E15
	arm_func_end ov29_0234A8BC

	arm_func_start ov29_0234A980
ov29_0234A980: ; 0x0234A980
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	bl ov29_023491B8
	movs r5, r0
	beq _0234AA78
	bl ov29_023009CC
	cmp r0, #0
	bne _0234A9DC
	mov r0, r5
	bl ov29_022E550C
	mov r0, r5
	mov r1, r5
	mov r2, #0
	mov r3, #1
	bl EndNegativeStatusConditionWrapper
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0234AA80 ; =0x00000E39
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
_0234A9DC:
	mov r1, r5
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	ldr r1, _0234AA84 ; =0x00000E36
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, [r5, #0xb4]
	add r0, sp, #0
	ldrsh r4, [r1, #4]
	mov r2, #0
	mov r1, r4
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234AA88 ; =0x00000E37
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234AA8C ; =0x00000E38
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	mov r0, #0
	mov r1, r0
	bl ov29_02348888
	ldr r2, _0234AA90 ; =ov29_02353538
	ldr r3, _0234AA94 ; =0x00000E3A
	ldr r2, [r2]
	mov r0, r5
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234AA78:
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234AA80: .word 0x00000E39
_0234AA84: .word 0x00000E36
_0234AA88: .word 0x00000E37
_0234AA8C: .word 0x00000E38
_0234AA90: .word ov29_02353538
_0234AA94: .word 0x00000E3A
	arm_func_end ov29_0234A980

	arm_func_start ov29_0234AA98
ov29_0234AA98: ; 0x0234AA98
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r6, r0
	bl ov29_023491B8
	movs r4, r0
	bne _0234AAC4
	ldr r1, _0234AB9C ; =0x00000E2D
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	b _0234AB94
_0234AAC4:
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	mov r2, #0
	bl SubstitutePlaceholderStringTags
	bl GetSpecialTargetItem
	mov r1, r0
	mov r0, #1
	bl ov29_0234B084
	ldr r1, _0234ABA0 ; =0x00000E3F
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, [r4, #0xb4]
	add r0, sp, #0
	ldrsh r5, [r1, #4]
	mov r2, #0
	mov r1, r5
	bl InitPortraitDungeon
	mov r1, r5
	mov r0, #1
	bl ov29_0234B0CC
	add r0, sp, #0
	mov r1, #0xe40
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234ABA4 ; =0x00000E41
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	add r0, r6, #4
	mov r1, #1
	bl RemoveGroundItem
	bl GetSpecialTargetItem
	mov r1, r0
	mov r0, #0
	bl ov29_02348888
	ldr r2, _0234ABA8 ; =ov29_02353538
	ldr r3, _0234ABAC ; =0x00000E42
	ldr r2, [r2]
	mov r0, r4
	add r2, r2, #0x348
	mov r1, #0
	add r2, r2, #0x400
	bl ov29_0234AF34
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234AB94:
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234AB9C: .word 0x00000E2D
_0234ABA0: .word 0x00000E3F
_0234ABA4: .word 0x00000E41
_0234ABA8: .word ov29_02353538
_0234ABAC: .word 0x00000E42
	arm_func_end ov29_0234AA98

	arm_func_start ov29_0234ABB0
ov29_0234ABB0: ; 0x0234ABB0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_0234A764
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	bl GetLeader
	mov r1, r0
	mov r0, #0
	mov r2, r0
	bl SubstitutePlaceholderStringTags
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234AC80 ; =0x00000E13
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	bl IsJirachiChallengeFloor
	cmp r0, #0
	bne _0234AC40
	ldr r0, _0234AC84 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	bne _0234AC38
	bl ov29_022EAEFC
	cmp r0, #0
	beq _0234AC38
	ldr r0, _0234AC84 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd6]
	bl MusicTableIdxToMusicId
	bl ChangeDungeonMusic
_0234AC38:
	mov r0, #0
	bl ov29_022EAF34
_0234AC40:
	mov r0, r4
	mov r1, #0
	bl ov29_02348888
	bl IsJirachiChallengeFloor
	cmp r0, #0
	beq _0234AC68
	mov r0, #2
	mov r1, #1
	bl ov29_022E09E8
	b _0234AC70
_0234AC68:
	ldr r0, _0234AC88 ; =0x00000E43
	bl ov29_02348A18
_0234AC70:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234AC80: .word 0x00000E13
_0234AC84: .word ov29_02353538
_0234AC88: .word 0x00000E43
	arm_func_end ov29_0234ABB0

	arm_func_start ov29_0234AC8C
ov29_0234AC8C: ; 0x0234AC8C
	stmdb sp!, {r3, r4, r5, lr}
	bl GetSpecialTargetItem
	mov r1, r0
	mov r0, #0
	bl ov29_02348888
	bl ov29_0234D630
	bl ov29_0234B034
	mov r1, r0
	mov r0, #1
	str r0, [sp]
	mov r2, #0
	ldr r0, _0234AD08 ; =0x00000E12
	mov r3, r2
	bl ov29_0234D70C
	mov r0, #9
	bl ov29_022EACE4
	mov r5, #0x62
	mov r4, #9
	b _0234ACE0
_0234ACD8:
	mov r0, r5
	bl AdvanceFrame
_0234ACE0:
	mov r0, r4
	bl sub_02017C10
	cmp r0, #0
	bne _0234ACD8
	bl ov29_0234D838
	mov r0, #0
	bl ov29_0234D8A0
	ldr r0, _0234AD0C ; =0x00000E43
	bl ov29_02348A18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234AD08: .word 0x00000E12
_0234AD0C: .word 0x00000E43
	arm_func_end ov29_0234AC8C

	arm_func_start ov29_0234AD10
ov29_0234AD10: ; 0x0234AD10
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl IsDestinationFloorWithFleeingOutlaw
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	moveq r0, #0
	beq _0234AD44
	ldr r0, [r4]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
_0234AD44:
	cmp r0, #0
	ldrne r1, [r4, #0xb4]
	ldrneb r0, [r1, #6]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #0xbc]
	cmp r0, #3
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl ov29_02300B04
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r4, #4]
	ldrsh r1, [r4, #6]
	bl PositionIsOnStairs
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0xb4]
	ldr r1, _0234ADC4 ; =0x0000025B
	ldrsh r5, [r0, #2]
	mov r0, r4
	mov r2, #0
	bl HandleFaint
	mov r1, r5
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234ADC8 ; =0x00000E19
	mov r0, #0
	mov r2, #1
	bl LogMessageById
	bl ov29_0234AEE8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234ADC4: .word 0x0000025B
_0234ADC8: .word 0x00000E19
	arm_func_end ov29_0234AD10

	arm_func_start ov29_0234ADCC
ov29_0234ADCC: ; 0x0234ADCC
	stmdb sp!, {r3, lr}
	cmp r0, #3
	bne _0234ADF0
	bl ov29_022EAC8C
	ldr r1, _0234AE38 ; =0x00000E04
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldmia sp!, {r3, pc}
_0234ADF0:
	cmp r0, #2
	bne _0234AE0C
	mov r0, #3
	bl ov29_022FBBEC
	add r0, r0, #4
	bl ov29_022FA3D4
	b _0234AE1C
_0234AE0C:
	mov r0, #1
	bl ov29_022FBBEC
	add r0, r0, #4
	bl ov29_022FA3D4
_0234AE1C:
	mov r0, #1
	bl ov29_022EAF34
	ldr r1, _0234AE3C ; =0x00000E05
	mov r0, #0
	mov r2, #1
	bl DisplayMessage
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234AE38: .word 0x00000E04
_0234AE3C: .word 0x00000E05
	arm_func_end ov29_0234ADCC

	arm_func_start ov29_0234AE40
ov29_0234AE40: ; 0x0234AE40
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r0, #2
	bl ov29_0234ADCC
	bl GetMissionTargetEnemy
	mov r4, r0
	add r0, sp, #0
	mov r1, r4
	mov r2, #0
	bl InitPortraitDungeon
	mov r1, r4
	mov r0, #1
	bl ov29_0234B0CC
	ldr r1, _0234AE98 ; =0x00000E06
	add r0, sp, #0
	mov r2, #1
	bl DisplayMessage
	ldr r1, _0234AE9C ; =ov29_0234AEA4
	ldr r0, _0234AEA0 ; =ov29_023537C8
	str r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234AE98: .word 0x00000E06
_0234AE9C: .word ov29_0234AEA4
_0234AEA0: .word ov29_023537C8
	arm_func_end ov29_0234AE40

	arm_func_start ov29_0234AEA4
ov29_0234AEA4: ; 0x0234AEA4
	stmdb sp!, {r4, lr}
	mov r0, #3
	bl ov29_022FBBEC
	mov r4, r0
	bl ShouldMonsterHeadToStairs
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0xbb
	bl ov29_022FBA54
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0xbb
	mov r2, #0
	bl ov29_0231AF24
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234AEA4

	arm_func_start ov29_0234AEE8
ov29_0234AEE8: ; 0x0234AEE8
	stmdb sp!, {r3, lr}
	ldr r0, _0234AF30 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x790]
	cmp r0, #0
	bne _0234AF24
	bl ov29_022EAEFC
	cmp r0, #0
	beq _0234AF24
	ldr r0, _0234AF30 ; =ov29_02353538
	ldr r0, [r0]
	add r0, r0, #0x4000
	ldrsh r0, [r0, #0xd6]
	bl MusicTableIdxToMusicId
	bl ChangeDungeonMusic
_0234AF24:
	mov r0, #0
	bl ov29_022EAF34
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234AF30: .word ov29_02353538
	arm_func_end ov29_0234AEE8

	arm_func_start ov29_0234AF34
ov29_0234AF34: ; 0x0234AF34
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb ip, [r2]
	ldr r2, [r6, #0xb4]
	mov r5, r1
	mov r4, r3
	strb ip, [r2, #0x48]
	bl ov29_022E68F0
	cmp r5, #0
	beq _0234AF64
	mov r0, r5
	bl ov29_022E68F0
_0234AF64:
	ldr r1, _0234AFA0 ; =0x0000025B
	mov r0, r6
	mov r2, #0
	bl HandleFaint
	cmp r5, #0
	beq _0234AF8C
	ldr r1, _0234AFA0 ; =0x0000025B
	mov r0, r5
	mov r2, #0
	bl HandleFaint
_0234AF8C:
	mov r0, #1
	bl AnimationDelayOrSomething
	mov r0, r4
	bl ov29_02348A18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234AFA0: .word 0x0000025B
	arm_func_end ov29_0234AF34

	arm_func_start ov29_0234AFA4
ov29_0234AFA4: ; 0x0234AFA4
	stmdb sp!, {r3, lr}
	mov r0, #0xcf0
	mov r1, #0
	bl MemAlloc
	ldr r2, _0234AFCC ; =ov29_023537CC
	mov r1, #0xcf0
	str r0, [r2, #4]
	bl MemZero
	bl ov29_0234B130
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234AFCC: .word ov29_023537CC
	arm_func_end ov29_0234AFA4

	arm_func_start ov29_0234AFD0
ov29_0234AFD0: ; 0x0234AFD0
	stmdb sp!, {r3, lr}
	ldr r0, _0234AFF8 ; =ov29_023537CC
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl MemFree
	ldr r0, _0234AFF8 ; =ov29_023537CC
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234AFF8: .word ov29_023537CC
	arm_func_end ov29_0234AFD0

	arm_func_start ov29_0234AFFC
ov29_0234AFFC: ; 0x0234AFFC
	ldr r1, _0234B00C ; =ov29_023537CC
	ldr r1, [r1, #4]
	strb r0, [r1, #0xced]
	bx lr
	.align 2, 0
_0234B00C: .word ov29_023537CC
	arm_func_end ov29_0234AFFC

	arm_func_start ov29_0234B010
ov29_0234B010: ; 0x0234B010
	ldr r1, _0234B020 ; =ov29_023537CC
	ldr r1, [r1, #4]
	strb r0, [r1, #0xcee]
	bx lr
	.align 2, 0
_0234B020: .word ov29_023537CC
	arm_func_end ov29_0234B010

	arm_func_start ov29_0234B024
ov29_0234B024: ; 0x0234B024
	ldr r1, _0234B030 ; =ov29_023537CC
	strb r0, [r1]
	bx lr
	.align 2, 0
_0234B030: .word ov29_023537CC
	arm_func_end ov29_0234B024

	arm_func_start ov29_0234B034
ov29_0234B034: ; 0x0234B034
	ldr r0, _0234B048 ; =ov29_023537CC
	ldr r0, [r0, #4]
	add r0, r0, #0x9c
	add r0, r0, #0xc00
	bx lr
	.align 2, 0
_0234B048: .word ov29_023537CC
	arm_func_end ov29_0234B034

	arm_func_start ov29_0234B04C
ov29_0234B04C: ; 0x0234B04C
	ldr r0, _0234B064 ; =ov29_023537CC
	ldr ip, _0234B068 ; =InitPreprocessorArgs
	ldr r0, [r0, #4]
	add r0, r0, #0x9c
	add r0, r0, #0xc00
	bx ip
	.align 2, 0
_0234B064: .word ov29_023537CC
_0234B068: .word InitPreprocessorArgs
	arm_func_end ov29_0234B04C

	arm_func_start ov29_0234B06C
ov29_0234B06C: ; 0x0234B06C
	ldr r2, _0234B080 ; =ov29_023537CC
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xc9c]
	bx lr
	.align 2, 0
_0234B080: .word ov29_023537CC
	arm_func_end ov29_0234B06C

	arm_func_start ov29_0234B084
ov29_0234B084: ; 0x0234B084
	ldr r2, _0234B098 ; =ov29_023537CC
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xcac]
	bx lr
	.align 2, 0
_0234B098: .word ov29_023537CC
	arm_func_end ov29_0234B084

	arm_func_start ov29_0234B09C
ov29_0234B09C: ; 0x0234B09C
	ldr r2, _0234B0B0 ; =ov29_023537CC
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xcc0]
	bx lr
	.align 2, 0
_0234B0B0: .word ov29_023537CC
	arm_func_end ov29_0234B09C

	arm_func_start ov29_0234B0B4
ov29_0234B0B4: ; 0x0234B0B4
	ldr r2, _0234B0C8 ; =ov29_023537CC
	ldr r2, [r2, #4]
	add r0, r2, r0, lsl #2
	str r1, [r0, #0xcd4]
	bx lr
	.align 2, 0
_0234B0C8: .word ov29_023537CC
	arm_func_end ov29_0234B0B4

	arm_func_start ov29_0234B0CC
ov29_0234B0CC: ; 0x0234B0CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl sub_02024FB8
	mov r1, r4
	mov r2, #0x4e
	mov r4, r0
	bl GetName
	ldr r0, _0234B100 ; =ov29_023537CC
	ldr r0, [r0, #4]
	add r0, r0, r5, lsl #2
	str r4, [r0, #0xcd4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234B100: .word ov29_023537CC
	arm_func_end ov29_0234B0CC

	arm_func_start ov29_0234B104
ov29_0234B104: ; 0x0234B104
	ldr r1, _0234B114 ; =ov29_023537CC
	ldr r1, [r1, #4]
	str r0, [r1, #0xce8]
	bx lr
	.align 2, 0
_0234B114: .word ov29_023537CC
	arm_func_end ov29_0234B104

	arm_func_start ov29_0234B118
ov29_0234B118: ; 0x0234B118
	ldr r1, _0234B12C ; =ov29_023537CC
	orr r2, r0, #0x30000
	ldr r0, [r1, #4]
	str r2, [r0, #0xce8]
	bx lr
	.align 2, 0
_0234B12C: .word ov29_023537CC
	arm_func_end ov29_0234B118

	arm_func_start ov29_0234B130
ov29_0234B130: ; 0x0234B130
	stmdb sp!, {r3, lr}
	mov r3, #0
	ldr r1, _0234B1A0 ; =ov29_023537CC
	mov r0, r3
_0234B140:
	ldr r2, [r1, #4]
	add r2, r2, r3
	add r3, r3, #1
	strb r0, [r2, #0xc80]
	cmp r3, #0xa
	blt _0234B140
	ldr r1, _0234B1A0 ; =ov29_023537CC
	mvn ip, #1
	ldr r3, [r1, #4]
	mov r2, #1
	strb ip, [r3, #0xcec]
	ldr r3, [r1, #4]
	strb r0, [r3, #0xcee]
	ldr r3, [r1, #4]
	strb r0, [r3, #0xced]
	str r0, [r1, #8]
	strb r2, [r1]
	bl ov29_0234B1A4
	ldr r0, _0234B1A0 ; =ov29_023537CC
	ldr r0, [r0, #4]
	add r0, r0, #0x9c
	add r0, r0, #0xc00
	bl InitPreprocessorArgs
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B1A0: .word ov29_023537CC
	arm_func_end ov29_0234B130

	arm_func_start ov29_0234B1A4
ov29_0234B1A4: ; 0x0234B1A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov29_022E9FC0
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov ip, #0
	ldr r2, _0234B24C ; =ov29_023537CC
	mov r0, ip
_0234B1C4:
	ldr r3, [r2, #4]
	add r1, ip, ip, lsl #2
	add ip, ip, #1
	strb r0, [r3, r1, lsl #6]
	cmp ip, #0xa
	blt _0234B1C4
	ldr r2, _0234B24C ; =ov29_023537CC
	mov r3, #4
	ldr r1, [r2, #4]
	strb r0, [r1, #0xc8b]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x8c]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x8e]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r0, [r1, #0x90]
	ldr r1, [r2, #4]
	add r1, r1, #0xc00
	strh r3, [r1, #0x92]
	ldr r1, [r2, #4]
	str r0, [r1, #0xc98]
	bl ov29_0234B768
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	mov r0, #0xb
	bl AdvanceFrame
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234B24C: .word ov29_023537CC
	arm_func_end ov29_0234B1A4

	arm_func_start LogMessageByIdWithPopupCheckParticipants
LogMessageByIdWithPopupCheckParticipants: ; 0x0234B250
	stmdb sp!, {r3, lr}
	ldr ip, _0234B290 ; =ov29_023537CC
	cmp r1, #0
	ldr ip, [ip, #4]
	ldrsh lr, [sp, #8]
	add r3, ip, r3, lsl #2
	cmpne r0, #0
	str lr, [r3, #0xcac]
	beq _0234B27C
	bl LogMessageByIdWithPopupCheckUserTarget
	ldmia sp!, {r3, pc}
_0234B27C:
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, r2
	bl LogMessageByIdWithPopupCheckUser
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B290: .word ov29_023537CC
	arm_func_end LogMessageByIdWithPopupCheckParticipants

	arm_func_start ov29_0234B294
ov29_0234B294: ; 0x0234B294
	ldr ip, _0234B2A0 ; =ov29_0234BA18
	mov r0, #0x50
	bx ip
	.align 2, 0
_0234B2A0: .word ov29_0234BA18
	arm_func_end ov29_0234B294

	arm_func_start LogMessageByIdWithPopupCheckUser
LogMessageByIdWithPopupCheckUser: ; 0x0234B2A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r5
	bl StringFromMessageId
	mov r1, r0
	mov r0, r6
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end LogMessageByIdWithPopupCheckUser

	arm_func_start LogMessageWithPopupCheckUser
LogMessageWithPopupCheckUser: ; 0x0234B2E4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r6, r0
	mov r5, r1
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end LogMessageWithPopupCheckUser

	arm_func_start LogMessageByIdQuiet
LogMessageByIdQuiet: ; 0x0234B31C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromMessageId
	mov r1, r0
	mov r0, r4
	mov r2, #0
	bl LogMessage
	ldmia sp!, {r4, pc}
	arm_func_end LogMessageByIdQuiet

	arm_func_start LogMessageQuiet
LogMessageQuiet: ; 0x0234B340
	ldr ip, _0234B34C ; =LogMessage
	mov r2, #0
	bx ip
	.align 2, 0
_0234B34C: .word LogMessage
	arm_func_end LogMessageQuiet

	arm_func_start LogMessageByIdWithPopupCheckUserTarget
LogMessageByIdWithPopupCheckUserTarget: ; 0x0234B350
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromMessageId
	mov r1, r0
	mov r0, r7
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdWithPopupCheckUserTarget

	arm_func_start LogMessageWithPopupCheckUserTarget
LogMessageWithPopupCheckUserTarget: ; 0x0234B3A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r5
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageWithPopupCheckUserTarget

	arm_func_start LogMessageByIdQuietCheckUserTarget
LogMessageByIdQuietCheckUserTarget: ; 0x0234B3F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromMessageId
	mov r1, r0
	mov r0, r7
	mov r2, #0
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdQuietCheckUserTarget

	arm_func_start LogMessageByIdWithPopupCheckUserUnknown
LogMessageByIdWithPopupCheckUserUnknown: ; 0x0234B444
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, #0
	mov r7, r0
	mov r5, r2
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r4, #1
	mov r0, r6
	bl ov29_022E2CA0
	cmp r0, #0
	movne r4, #1
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl StringFromMessageId
	mov r1, r0
	mov r0, r7
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end LogMessageByIdWithPopupCheckUserUnknown

	arm_func_start LogMessageByIdWithPopup
LogMessageByIdWithPopup: ; 0x0234B498
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl StringFromMessageId
	mov r1, r0
	mov r0, r4
	mov r2, #1
	bl LogMessage
	ldmia sp!, {r4, pc}
	arm_func_end LogMessageByIdWithPopup

	arm_func_start LogMessageWithPopup
LogMessageWithPopup: ; 0x0234B4BC
	ldr ip, _0234B4C8 ; =LogMessage
	mov r2, #1
	bx ip
	.align 2, 0
_0234B4C8: .word LogMessage
	arm_func_end LogMessageWithPopup

	arm_func_start ov29_0234B4CC
ov29_0234B4CC: ; 0x0234B4CC
	ldr r1, _0234B4DC ; =ov29_023537CC
	ldr r1, [r1, #4]
	strb r0, [r1, #0xc8a]
	bx lr
	.align 2, 0
_0234B4DC: .word ov29_023537CC
	arm_func_end ov29_0234B4CC

	arm_func_start ov29_0234B4E0
ov29_0234B4E0: ; 0x0234B4E0
	ldr r0, _0234B4F0 ; =ov29_023537CC
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0xc8b]
	bx lr
	.align 2, 0
_0234B4F0: .word ov29_023537CC
	arm_func_end ov29_0234B4E0

	arm_func_start ov29_0234B4F4
ov29_0234B4F4: ; 0x0234B4F4
	ldr r0, _0234B504 ; =ov29_023537CC
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc98]
	bx lr
	.align 2, 0
_0234B504: .word ov29_023537CC
	arm_func_end ov29_0234B4F4

	arm_func_start LogMessage
LogMessage: ; 0x0234B508
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x284
	ldr r4, _0234B708 ; =ov29_023537CC
	mov fp, r2
	ldr r3, [r4, #4]
	ldrb r2, [r3, #0xced]
	cmp r2, #0
	ldreqb r2, [r3, #0xcee]
	cmpeq r2, #0
	bne _0234B700
	ldr r3, _0234B70C ; =ov29_02353538
	mov r7, #0
	ldr r2, [r3]
	mvn r5, #0
	add r2, r2, #0x100
	strh r5, [r2, #0xd8]
	ldr r2, [r3]
	mov r3, #0x400
	add r2, r2, #0x100
	strh r5, [r2, #0xda]
	ldr r2, [r4, #8]
	mov r8, r7
	cmp r2, r0
	movne sl, #1
	ldreqb sl, [r4]
	ldr r2, _0234B708 ; =ov29_023537CC
	mov r6, #1
	str r0, [r2, #8]
	strb r7, [r2]
	ldr r2, [r2, #4]
	add r0, sp, #0x144
	add r2, r2, #0x9c
	add r4, r2, #0xc00
	mov r2, r1
	mov r1, #0x140
	str r4, [sp]
	bl PreprocessString
	ldr r4, _0234B708 ; =ov29_023537CC
	add r5, sp, #0x144
_0234B5A4:
	ldr r0, [r4, #4]
	add r1, r0, #0xc00
	ldrsh sb, [r1, #0x8c]
	add r1, r0, #0xc00
	ldrsh r2, [r1, #0x8e]
	add r3, sb, #1
	cmp r3, #0xa
	moveq r3, #0
	cmp r3, r2
	bne _0234B5D8
	mov r0, #0
	bl AdvanceFrame
	b _0234B5A4
_0234B5D8:
	ldrb r2, [r5, r8]
	cmp r2, #0
	beq _0234B6D4
	add r0, r0, sb
	strb sl, [r0, #0xc80]
	ldr r1, [r4, #4]
	add r0, sp, #4
	add r1, r1, #0x9c
	add r1, r1, #0xc00
	str r1, [sp]
	mov r1, #0x140
	add r2, r5, r8
	mov r3, #0x440
	bl PreprocessString
	add r8, r8, r0
	ldrb sb, [r5, r8]
	mov r2, #0
	add r1, sp, #4
	strb r2, [r1, r0]
	cmp sb, #0
	beq _0234B660
	ldr r1, _0234B710 ; =ov29_02353214
	add r0, r5, r8
	mov r2, #3
	bl strncmp
	cmp r0, #0
	bne _0234B654
	ldr r0, _0234B710 ; =ov29_02353214
	bl strlen
	add r8, r8, r0
	b _0234B660
_0234B654:
	cmp sb, #0xd
	cmpne sb, #0xa
	addeq r8, r8, #1
_0234B660:
	add r0, sp, #4
	mov r1, sl
	mov r2, r6
	bl ov29_0234BB44
	mov sl, #0
	cmp fp, #0
	mov r6, sl
	beq _0234B5A4
	ldr sb, [r4, #4]
	mov r2, #0x140
	add r0, sb, #0xc00
	ldrsh r3, [r0, #0x8c]
	mov r0, r2
	add r1, sp, #4
	smlabb r0, r3, r0, sb
	mov r7, #1
	bl strncpy
	ldr r0, [r4, #4]
	add r0, r0, #0xc00
	ldrsh r1, [r0, #0x8c]
	add r1, r1, #1
	strh r1, [r0, #0x8c]
	ldr r0, [r4, #4]
	add r1, r0, #0xc00
	ldrsh r0, [r1, #0x8c]
	cmp r0, #0xa
	moveq r0, sl
	streqh r0, [r1, #0x8c]
	b _0234B5A4
_0234B6D4:
	cmp r7, #0
	beq _0234B700
	ldr r0, _0234B708 ; =ov29_023537CC
	mov r2, #0xf0
	strh r2, [r1, #0x90]
	ldr r1, [r0, #4]
	ldr r0, [r1, #0xc98]
	cmp r0, #0
	moveq r0, #1
	streq r0, [r1, #0xc98]
	bl ov29_022F2FE4
_0234B700:
	add sp, sp, #0x284
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234B708: .word ov29_023537CC
_0234B70C: .word ov29_02353538
_0234B710: .word ov29_02353214
	arm_func_end LogMessage

	arm_func_start LogMessageById
LogMessageById: ; 0x0234B714
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	mov r0, r1
	bl StringFromMessageId
	mov r1, r0
	mov r0, r5
	mov r2, r4
	bl LogMessage
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end LogMessageById

	arm_func_start ov29_0234B73C
ov29_0234B73C: ; 0x0234B73C
	ldr r0, _0234B764 ; =ov29_023537CC
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_0234B764: .word ov29_023537CC
	arm_func_end ov29_0234B73C

	arm_func_start ov29_0234B768
ov29_0234B768: ; 0x0234B768
	stmdb sp!, {r3, lr}
	ldr r0, _0234B7E8 ; =ov29_023537CC
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_0202836C
	ldr r0, _0234B7E8 ; =ov29_023537CC
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	bl sub_02030214
	ldr r0, _0234B7E8 ; =ov29_023537CC
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	bl sub_02030044
	ldr r0, _0234B7E8 ; =ov29_023537CC
	mvn r3, #1
	ldr r1, [r0, #4]
	mov r2, #0
	strb r3, [r1, #0xcec]
	ldr r1, [r0, #4]
	mov r0, #1
	str r2, [r1, #0xc98]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B7E8: .word ov29_023537CC
	arm_func_end ov29_0234B768

	arm_func_start ov29_0234B7EC
ov29_0234B7EC: ; 0x0234B7EC
	stmdb sp!, {r3, lr}
	ldr r0, _0234B850 ; =ov29_023537CC
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r1, #1
	moveq r1, #0
	tst r1, #0xff
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _0234B850 ; =ov29_023537CC
	ldr r1, [r1, #4]
	add r1, r1, #0xc00
	ldrsh r2, [r1, #0x8c]
	ldrsh r1, [r1, #0x8e]
	cmp r2, r1
	bne _0234B848
	bl sub_020301F4
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_0234B848:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234B850: .word ov29_023537CC
	arm_func_end ov29_0234B7EC

	arm_func_start ov29_0234B854
ov29_0234B854: ; 0x0234B854
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0234BA14 ; =ov29_023537CC
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #0xced]
	cmp r0, #0
	movne r0, #0
	strne r0, [r1, #0xc98]
	ldr r0, _0234BA14 ; =ov29_023537CC
	ldr r4, [r0, #4]
	ldr r0, [r4, #0xc98]
	cmp r0, #0
	beq _0234B9C8
	cmp r0, #1
	beq _0234B8A0
	cmp r0, #2
	beq _0234B908
	b _0234B9C8
_0234B8A0:
	bl ov10_022BFD20
	cmp r0, #0
	bne _0234B9C8
	bl sub_02001808
	cmp r0, #0x3000
	blt _0234B9C8
	ldr r0, _0234BA14 ; =ov29_023537CC
	mvn r1, #1
	ldr r0, [r0, #4]
	add r0, r0, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	tst r0, #0xff
	bne _0234B900
	mov r0, #0
	bl sub_0202FFB0
	ldr r1, _0234BA14 ; =ov29_023537CC
	mov r2, #0
	ldr r3, [r1, #4]
	strb r0, [r3, #0xcec]
	ldr r0, [r1, #4]
	str r2, [r0, #0xce8]
_0234B900:
	mov r0, #2
	str r0, [r4, #0xc98]
_0234B908:
	ldr r0, _0234BA14 ; =ov29_023537CC
	mvn r2, #1
	ldr r1, [r0, #4]
	add r0, r1, #0xc00
	ldrsb r0, [r0, #0xec]
	cmp r0, r2
	movne r2, #1
	moveq r2, #0
	tst r2, #0xff
	moveq r0, #1
	beq _0234B9BC
	ldr r3, _0234BA14 ; =ov29_023537CC
	mov r2, #0x140
	ldr r5, [r3, #4]
	add r3, r5, #0xc00
	ldrsh ip, [r3, #0x8e]
	ldrsh r3, [r3, #0x8c]
	smulbb lr, ip, r2
	cmp r3, ip
	bne _0234B96C
	bl ov29_0234B7EC
	cmp r0, #0
	bne _0234B9B8
	mov r0, #1
	b _0234B9BC
_0234B96C:
	add r2, r5, ip
	ldrb ip, [r2, #0xc80]
	add r1, r1, #0x9c
	add r3, r1, #0xc00
	add r2, r5, lr
	mov r1, #0x400
	str ip, [sp]
	bl sub_0203010C
	cmp r0, #0
	moveq r0, #0
	beq _0234B9BC
	add r0, r5, #0xc00
	ldrsh r1, [r0, #0x8e]
	add r1, r1, #1
	strh r1, [r0, #0x8e]
	ldrsh r1, [r0, #0x8e]
	cmp r1, #0xa
	moveq r1, #0
	streqh r1, [r0, #0x8e]
_0234B9B8:
	mov r0, #0
_0234B9BC:
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0xc98]
_0234B9C8:
	ldrb r0, [r4, #0xc8a]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #0xc00
	ldrsh r1, [r0, #0x90]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	sub r1, r1, #1
	strh r1, [r0, #0x90]
	ldrsh r0, [r0, #0x90]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, #0
	str r0, [r4, #0xc98]
	bl ov29_0234B768
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234BA14: .word ov29_023537CC
	arm_func_end ov29_0234B854

	arm_func_start ov29_0234BA18
ov29_0234BA18: ; 0x0234BA18
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0234BA50 ; =ov29_023537CC
	mov r5, r0
	ldr r4, [r1, #4]
_0234BA28:
	ldr r0, [r4, #0xc98]
	cmp r0, #0
	bne _0234BA40
	bl ov29_0234B7EC
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_0234BA40:
	mov r0, r5
	bl AdvanceFrame
	b _0234BA28
_0234BA4C:
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234BA50: .word ov29_023537CC
	arm_func_end ov29_0234BA18

	arm_func_start ov29_0234BA54
ov29_0234BA54: ; 0x0234BA54
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0234BAB8 ; =ov29_023537CC
	mov r5, r0
	ldr r6, [r1, #4]
	bl ov29_0234BA18
	mov r4, #0
	add r6, r6, #0xc00
	ldr r7, _0234BABC ; =ov29_0237C694
	b _0234BAAC
_0234BA78:
	ldrsh r0, [r6, #0x90]
	cmp r0, #0xb4
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r7]
	and r0, r0, #3
	cmp r0, #3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r7, #2]
	tst r0, #0xf0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl AdvanceFrame
	add r4, r4, #1
_0234BAAC:
	cmp r4, #0xf0
	blt _0234BA78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234BAB8: .word ov29_023537CC
_0234BABC: .word ov29_0237C694
	arm_func_end ov29_0234BA54

	arm_func_start InitPortraitDungeon
InitPortraitDungeon: ; 0x0234BAC0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl InitPortraitBox
	strh r5, [r6]
	strb r4, [r6, #2]
	mov r2, #0
	strb r2, [r6, #3]
	mov r0, #2
	str r0, [r6, #4]
	mov r0, #9
	str r0, [r6, #8]
	strb r2, [r6, #0xc]
	strb r2, [r6, #0xd]
	mov r0, r6
	mov r1, #1
	strb r2, [r6, #0xe]
	bl AllowPortraitDefault
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end InitPortraitDungeon

	arm_func_start ov29_0234BB10
ov29_0234BB10: ; 0x0234BB10
	ldr ip, _0234BB1C ; =sub_02047FFC
	mov r0, #0
	bx ip
	.align 2, 0
_0234BB1C: .word sub_02047FFC
	arm_func_end ov29_0234BB10

	arm_func_start ov29_0234BB20
ov29_0234BB20: ; 0x0234BB20
	ldr ip, _0234BB28 ; =sub_0204804C
	bx ip
	.align 2, 0
_0234BB28: .word sub_0204804C
	arm_func_end ov29_0234BB20

	arm_func_start ov29_0234BB2C
ov29_0234BB2C: ; 0x0234BB2C
	ldr ip, _0234BB34 ; =sub_020480CC
	bx ip
	.align 2, 0
_0234BB34: .word sub_020480CC
	arm_func_end ov29_0234BB2C

	arm_func_start ov29_0234BB38
ov29_0234BB38: ; 0x0234BB38
	ldr ip, _0234BB40 ; =sub_02048134
	bx ip
	.align 2, 0
_0234BB40: .word sub_02048134
	arm_func_end ov29_0234BB38

	arm_func_start ov29_0234BB44
ov29_0234BB44: ; 0x0234BB44
	ldr ip, _0234BB4C ; =sub_02048150
	bx ip
	.align 2, 0
_0234BB4C: .word sub_02048150
	arm_func_end ov29_0234BB44

	arm_func_start ov29_0234BB50
ov29_0234BB50: ; 0x0234BB50
	ldr ip, _0234BB58 ; =sub_02048240
	bx ip
	.align 2, 0
_0234BB58: .word sub_02048240
	arm_func_end ov29_0234BB50

	arm_func_start OpenMessageLog
OpenMessageLog: ; 0x0234BB5C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	mov r0, #6
	mov r1, #0
	bl ov29_022EA428
	cmp r4, #0
	bne _0234BB84
	mov r0, #0
	bl ov29_0233A248
_0234BB84:
	mov r0, #0x62
	bl AdvanceFrame
	mov r0, #0x62
	bl AdvanceFrame
	bl sub_0204833C
	mov r4, #0x62
_0234BB9C:
	mov r0, r4
	bl AdvanceFrame
	bl sub_02048360
	movs r5, r0
	beq _0234BB9C
	mov r0, #0x62
	bl AdvanceFrame
	cmp r6, #0
	beq _0234BBCC
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234BBCC:
	cmp r5, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end OpenMessageLog

	arm_func_start ov29_0234BBDC
ov29_0234BBDC: ; 0x0234BBDC
	ldr ip, _0234BBE4 ; =ov29_022E0B60
	bx ip
	.align 2, 0
_0234BBE4: .word ov29_022E0B60
	arm_func_end ov29_0234BBDC

	arm_func_start ov29_0234BBE8
ov29_0234BBE8: ; 0x0234BBE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _0234BED4 ; =ov29_023537D8
	mov sl, #0
	ldr r6, [r0, #4]
	bl ov29_022DC61C
	ldrb r0, [r6, #0x14]
	cmp r0, #0
	beq _0234BC8C
	bl ov29_022DEBA4
	bl ov29_0234CB00
	bl ov29_0234CA68
	mov r5, r0
	bl ov29_0234CA7C
	mov r4, r0
	bl sub_0204AFF8
	mov r2, r0
	mov r1, r4
	mov r0, r5
	bl ov30_02382820
	b _0234BC3C
_0234BC38:
	bl ov29_022DDEF8
_0234BC3C:
	bl ov30_02382874
	cmp r0, #0
	bne _0234BC38
	bl ov30_0238298C
	mov r4, r0
	bl ov30_023829A0
	cmp r4, #0
	beq _0234BC68
	ldr r0, _0234BED8 ; =0x000F1208
	bl sub_02048DC4
	b _0234BC70
_0234BC68:
	ldr r0, _0234BEDC ; =0x000F1209
	bl sub_02048DC4
_0234BC70:
	bl ov29_022DEBB0
	cmp r4, #0
	bne _0234BC8C
	mov r0, #5
	str r0, [r6, #0xc0]
	mov sl, #1
	bl ov29_022DDEF8
_0234BC8C:
	mov sb, #1
	mov r8, #0
	mov r7, r8
	mov r6, sb
	mov r5, sb
	mov fp, r8
	ldr r4, _0234BED4 ; =ov29_023537D8
	b _0234BD70
_0234BCAC:
	bl ov29_022DDEF8
	ldrb r0, [r4]
	cmp r0, #0
	bne _0234BD70
	ldr r0, [r4, #4]
	ldr r0, [r0, #8]
	cmp r0, #1
	beq _0234BCD8
	cmp r0, #2
	moveq sl, #1
	b _0234BD70
_0234BCD8:
	mov r0, #0
	mov r1, r0
	bl sub_02051DD0
	mov r0, sb
	mov r1, r8
	bl sub_02051DD0
	mov r0, r7
	mov r1, r6
	bl sub_02051DD0
	mov r0, #1
	mov r1, r0
	bl sub_02051DD0
	mov r0, #0
	mov r1, r0
	bl sub_02051E60
	mov r0, r5
	mov r1, fp
	bl sub_02051E60
	mov r0, #0
	mov r1, #1
	bl sub_02051E60
	mov r0, #1
	mov r1, r0
	bl sub_02051E60
	mov r0, #0
	bl ov29_0234BEE0
	mov r0, #1
	bl ov29_0234BEE0
	mov r0, #0
	bl ov29_0234BF04
	mov r0, #1
	bl ov29_0234BF04
	bl GetDungeonPtrMaster
	mov r1, r0
	ldr r0, [r4, #4]
	add r0, r0, #0x10
	bl RunDungeon
	mov sl, #1
_0234BD70:
	cmp sl, #0
	beq _0234BCAC
	ldr r0, _0234BED4 ; =ov29_023537D8
	ldr r0, [r0, #4]
	adds r4, r0, #0x10
	beq _0234BEB8
	ldr r1, [r4, #0xb0]
	mvn r0, #1
	cmp r1, r0
	bne _0234BDA0
	add r0, r4, #0xb8
	bl sub_0205BAB0
_0234BDA0:
	ldr r1, [r4, #0xb0]
	cmp r1, #3
	mvnne r0, #1
	cmpne r1, r0
	bne _0234BEB8
	ldr r0, _0234BED4 ; =ov29_023537D8
	ldr r4, [r0, #4]
	bl ov29_022DE418
	mov r0, #0
	mov r1, r0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0
	bl sub_020091B0
	mov r0, #2
	mov r1, #0
	bl sub_02009194
	mov r0, #3
	mov r1, #0
	bl sub_02009194
	mov r0, #4
	mov r1, #0
	bl sub_020091B0
	mov r0, #1
	mov r1, #0x4000
	mov r2, #0
	bl ov29_0234C668
	mov r0, #0
	bl ov29_0234C738
	add r0, r4, #0xc4
	bl SetAdventureLogDungeonFloor
	bl sub_02017B70
	ldr r1, [r4, #0xc0]
	mvn r0, #1
	cmp r1, r0
	beq _0234BE40
	bl sub_0204AFF8
	cmp r0, #0
	movne r5, #1
	bne _0234BE44
_0234BE40:
	mov r5, #0
_0234BE44:
	bl ov29_0234CA68
	mov r4, r0
	bl ov29_0234CA7C
	mov r1, r0
	mov r0, r4
	mov r2, r5
	bl ov30_023829CC
	mov r0, #0x10
	bl ov29_022DDE00
	ldr r4, _0234BED4 ; =ov29_023537D8
	mov r1, #1
	ldr r0, [r4, #4]
	strb r1, [r0, #0x1bc]
	b _0234BE80
_0234BE7C:
	bl ov29_022DDEF8
_0234BE80:
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1bc]
	cmp r0, #0
	bne _0234BE7C
	bl ov30_02382C30
	bl ov29_0234CACC
	mov r0, #2
	bl ov29_022DDE00
	mov r0, #2
	mov r1, #0x4000
	mov r2, #0
	bl ov29_0234C668
	mov r0, #0
	bl ov29_0234C738
_0234BEB8:
	bl ov29_022DC65C
	ldr r0, _0234BED4 ; =ov29_023537D8
	mov r1, #1
	ldr r0, [r0, #4]
	strb r1, [r0, #0x1bd]
_0234BECC:
	bl ov29_022DDEF8
	b _0234BECC
	.align 2, 0
_0234BED4: .word ov29_023537D8
_0234BED8: .word 0x000F1208
_0234BEDC: .word 0x000F1209
	arm_func_end ov29_0234BBE8

	arm_func_start ov29_0234BEE0
ov29_0234BEE0: ; 0x0234BEE0
	ldr r2, _0234BEFC ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _0234BF00 ; =sub_0200B3D4
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_0234BEFC: .word ov29_0235352C
_0234BF00: .word sub_0200B3D4
	arm_func_end ov29_0234BEE0

	arm_func_start ov29_0234BF04
ov29_0234BF04: ; 0x0234BF04
	ldr r2, _0234BF20 ; =ov29_0235352C
	mov r1, #0xc
	ldr r2, [r2]
	ldr ip, _0234BF24 ; =sub_0200B330
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x24]
	bx ip
	.align 2, 0
_0234BF20: .word ov29_0235352C
_0234BF24: .word sub_0200B330
	arm_func_end ov29_0234BF04

	arm_func_start RunDungeonMode
RunDungeonMode: ; 0x0234BF28
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl sub_02017BEC
	bl sub_02028E2C
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl sub_020091F8
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, #1
	bl sub_020091F8
	bl ov29_022E0E8C
	bl sub_02027148
	mov r0, #0xf000
	mov r1, #0
	bl sub_0201D7E0
	mov r0, #0x1c0
	mov r1, #0
	bl MemAlloc
	ldr r2, _0234C1C8 ; =ov29_023537D8
	mov r1, #0x1c0
	str r0, [r2, #4]
	bl MemZero
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r2, #0
	ldr r1, [r0, #4]
	strb r2, [r1, #0x1bc]
	ldr r1, [r0, #4]
	str r4, [r1, #8]
	ldr r0, [r0, #4]
	str r4, [r0, #0xc]
	bl DungeonAlloc
	ldr r1, _0234C1C8 ; =ov29_023537D8
	ldr r1, [r1, #4]
	str r0, [r1, #4]
	bl DungeonZInit
	bl ov29_022DDFF0
	bl ov29_022DDFFC
	bl ov29_022DE300
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov ip, r5
	ldr r0, [r0, #4]
	mov r4, #0x1a
	add r6, r0, #0x10
_0234BFE8:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r6!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0234BFE8
	ldmia ip, {r0, r1, r2}
	stmia r6, {r0, r1, r2}
	bl ov29_0234C9FC
	ldr r0, _0234C1CC ; =ov29_0234BBDC
	bl sub_02006EC4
	bl sub_02017A68
	bl ov29_022E0CFC
	bl ov29_0234C4F8
	cmp r5, #0
	beq _0234C04C
	ldrsb r0, [r5, #0xe]
	cmp r0, #1
	mov r0, #0
	bne _0234C040
	bl ov29_0234C5EC
	mov r0, #1
	bl ov29_0234C584
	b _0234C04C
_0234C040:
	bl ov29_0234C584
	mov r0, #1
	bl ov29_0234C584
_0234C04C:
	bl ov29_022DDC00
	ldr r1, _0234C1C8 ; =ov29_023537D8
	mov r2, #1
	ldr r0, _0234C1D0 ; =ov29_0234C1D8
	strb r2, [r1]
	bl sub_0200383C
	mov r1, #0
	ldr r0, _0234C1D4 ; =ov29_0234BBE8
	mov r2, r1
	bl ov29_022DDD50
	ldr r4, _0234C1C8 ; =ov29_023537D8
	mov r6, #0
_0234C07C:
	bl sub_020038E8
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1bd]
	cmp r0, #0
	bne _0234C0C0
	bl sub_020039E4
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1bc]
	cmp r0, #0
	beq _0234C07C
_0234C0A4:
	bl ov30_02382A34
	cmp r0, #2
	cmpne r0, #3
	bne _0234C0A4
	ldr r0, [r4, #4]
	strb r6, [r0, #0x1bc]
	b _0234C07C
_0234C0C0:
	ldr r0, _0234C1D4 ; =ov29_0234BBE8
	bl ov29_022DDDA4
	mov r0, #0
	bl sub_0200383C
	bl sub_02034710
	bl ov29_0234CA2C
	cmp r5, #0
	beq _0234C108
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r4, #0x1a
	ldr r0, [r0, #4]
	add ip, r0, #0x10
_0234C0F0:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _0234C0F0
	ldmia ip, {r0, r1, r2}
	stmia r5, {r0, r1, r2}
_0234C108:
	bl ov29_022DE498
	bl ov29_022DE0A0
	bl ov29_0234C544
	mov r0, #0
	bl sub_02006EC4
	ldr r0, _0234C1C8 ; =ov29_023537D8
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0234C154
	bl DungeonFree
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r2, #0
	ldr r1, [r0, #4]
	str r2, [r1, #4]
	ldr r0, [r0, #4]
	bl MemFree
	ldr r0, _0234C1C8 ; =ov29_023537D8
	mov r1, #0
	str r1, [r0, #4]
_0234C154:
	bl sub_0201D804
	bl sub_0202715C
	bl ov29_022DDCA0
	bl sub_02017B70
	bl sub_02017BEC
	mov r0, #0
	sub r1, r0, #0x100
	bl sub_02008F3C
	mov r0, #1
	mvn r1, #0xff
	bl sub_02008F3C
	mov r0, #0
	bl sub_02009120
	mov r0, #1
	bl sub_02009120
	mov r0, #0
	bl sub_02009514
	mov r0, #1
	bl sub_02009514
	mov r0, #0
	bl sub_020091CC
	mov r0, #1
	bl sub_020091CC
	mov r0, #0
	bl sub_020093BC
	mov r0, #1
	bl sub_020093BC
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0234C1C8: .word ov29_023537D8
_0234C1CC: .word ov29_0234BBDC
_0234C1D0: .word ov29_0234C1D8
_0234C1D4: .word ov29_0234BBE8
	arm_func_end RunDungeonMode

	arm_func_start ov29_0234C1D8
ov29_0234C1D8: ; 0x0234C1D8
	stmdb sp!, {r4, lr}
	bl sub_0201BF64
	bl sub_02028E40
	bl sub_020038D8
	cmp r0, #0
	beq _0234C1F4
	bl sub_02003990
_0234C1F4:
	bl ov29_022E0A64
	bl ov29_022DDE24
	bl ov29_022E9F9C
	bl ov29_0234C9E4
	bl sub_02034A80
	bl ov29_022EA008
	ldr r0, _0234C2EC ; =ov29_02353538
	ldr r0, [r0]
	cmp r0, #0
	beq _0234C230
	add r0, r0, #0x224
	add r0, r0, #0x1a000
	bl ov10_022BF764
	bl ov29_022E6DD0
	b _0234C238
_0234C230:
	mov r0, #0
	bl ov10_022BF764
_0234C238:
	bl sub_02028848
	bl ov29_022DE868
	ldr r0, _0234C2F0 ; =ov29_023537D8
	ldr r0, [r0, #4]
	ldr r0, [r0]
	cmp r0, #0
	beq _0234C258
	blx r0
_0234C258:
	bl ov29_022DC670
	bl sub_0201F464
	ldr r0, _0234C2F0 ; =ov29_023537D8
	ldrb r0, [r0]
	cmp r0, #0
	bne _0234C274
	bl sub_0201DDFC
_0234C274:
	bl sub_02008F84
	bl ov29_022EAFB0
	bl sub_02017A80
	mov r0, #1
	bl sub_02028A64
	bl sub_0201BE28
	bl sub_0201BE5C
	bl sub_0201BE84
	bl sub_0204F9CC
	bl sub_02003A40
	ldr r1, _0234C2F0 ; =ov29_023537D8
	mov r4, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0234C2B8
	mov r0, #0
	bl sub_02008ED0
_0234C2B8:
	bl sub_020778D0
	bl sub_02008F88
	bl sub_0201DE10
	bl ov10_022BF7D4
	bl ov29_0233992C
	bl sub_02028E88
	bl ov29_022DE0CC
	bl sub_0201BF4C
	ldr r1, _0234C2F0 ; =ov29_023537D8
	mov r2, #0
	mov r0, r4
	strb r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234C2EC: .word ov29_02353538
_0234C2F0: .word ov29_023537D8
	arm_func_end ov29_0234C1D8

	arm_func_start ov29_0234C2F4
ov29_0234C2F4: ; 0x0234C2F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0x9c
	bl MemZero
	add r0, r5, #0x48
	strb r4, [r5, #0x88]
	bl InitRender3dElement64
	mov r0, #0x100
	strh r0, [r5, #0x4c]
	mov r0, #0xc0
	strh r0, [r5, #0x4e]
	mov r0, #1
	strh r0, [r5, #0x72]
	strb r0, [r5, #0x86]
	mov r0, #2
	strb r0, [r5, #0x84]
	mov r0, #0
	strb r0, [r5, #0x77]
	strb r0, [r5, #0x74]
	strb r0, [r5, #0x75]
	strb r0, [r5, #0x76]
	strb r0, [r5, #0x99]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234C2F4

	arm_func_start ov29_0234C354
ov29_0234C354: ; 0x0234C354
	stmdb sp!, {r3, lr}
	mov r3, #0
	str r3, [r0, #0x90]
	str r3, [r0, #0x8c]
	str r3, [r0, #0x94]
	strb r3, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C384
	ldr r0, [r0, #0x90]
	bl ov29_022E0F14
	ldmia sp!, {r3, pc}
_0234C384:
	ldrb r2, [r0, #0x99]
	cmp r2, #0
	strneb r3, [r0, #0x77]
	ldmneia sp!, {r3, pc}
	ldr r0, [r0, #0x90]
	bl ov29_022E0F14
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234C354

	arm_func_start ov29_0234C3A0
ov29_0234C3A0: ; 0x0234C3A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r1, [r4, #0x88]
	cmp r1, #1
	bne _0234C3C8
	ldr r0, [r4, #0x90]
	mov r0, r0, asr #0xc
	bl ov29_022E0F14
	ldr r0, [r4, #0x90]
	ldmia sp!, {r4, pc}
_0234C3C8:
	ldrb r0, [r4, #0x99]
	cmp r0, #0
	ldr r0, [r4, #0x90]
	beq _0234C3F8
	cmp r0, #0
	rsblt r0, r0, #0
	mov r0, r0, asr #0xc
	mov r0, r0, lsl #4
	cmp r0, #0x100
	moveq r0, #0xff
	strb r0, [r4, #0x77]
	ldmia sp!, {r4, pc}
_0234C3F8:
	mov r0, r0, asr #0xc
	bl ov29_022E0F14
	ldr r0, [r4, #0x90]
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234C3A0

	arm_func_start ov29_0234C408
ov29_0234C408: ; 0x0234C408
	stmdb sp!, {r3, lr}
	str r2, [r0, #0x8c]
	str r1, [r0, #0x94]
	mov r1, #1
	strb r1, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C464
	cmp r2, #5
	cmpne r2, #3
	moveq r1, #0
	streq r1, [r0, #0x90]
	beq _0234C45C
	cmp r2, #4
	moveq r1, #0x10000
	streq r1, [r0, #0x90]
	beq _0234C45C
	cmp r2, #2
	moveq r1, #0x10000
	rsbeq r1, r1, #0
	streq r1, [r0, #0x90]
_0234C45C:
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
_0234C464:
	cmp r2, #5
	bne _0234C488
	mov r1, #0
	str r1, [r0, #0x90]
	mov r1, #0xff
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
	b _0234C4F0
_0234C488:
	cmp r2, #3
	bne _0234C4A8
	mov r1, #0
	str r1, [r0, #0x90]
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
	b _0234C4F0
_0234C4A8:
	cmp r2, #4
	bne _0234C4CC
	mov r1, #0x10000
	str r1, [r0, #0x90]
	mov r1, #0xff
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
	b _0234C4F0
_0234C4CC:
	cmp r2, #2
	bne _0234C4F0
	mov r1, #0x10000
	rsb r1, r1, #0
	str r1, [r0, #0x90]
	mov r1, #0
	strb r1, [r0, #0x74]
	strb r1, [r0, #0x75]
	strb r1, [r0, #0x76]
_0234C4F0:
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234C408

	arm_func_start ov29_0234C4F8
ov29_0234C4F8: ; 0x0234C4F8
	stmdb sp!, {r3, lr}
	mov r0, #0x144
	mov r1, #0
	bl MemAlloc
	ldr r2, _0234C540 ; =ov29_023537E0
	mov r1, #0x144
	str r0, [r2]
	bl MemZero
	ldr r0, _0234C540 ; =ov29_023537E0
	mov r1, #0
	ldr r0, [r0]
	bl ov29_0234C2F4
	ldr r0, _0234C540 ; =ov29_023537E0
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x9c
	bl ov29_0234C2F4
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C540: .word ov29_023537E0
	arm_func_end ov29_0234C4F8

	arm_func_start ov29_0234C544
ov29_0234C544: ; 0x0234C544
	stmdb sp!, {r3, lr}
	ldr r0, _0234C580 ; =ov29_023537E0
	ldr r0, [r0]
	bl ov29_0234C354
	ldr r0, _0234C580 ; =ov29_023537E0
	ldr r0, [r0]
	add r0, r0, #0x9c
	bl ov29_0234C354
	ldr r0, _0234C580 ; =ov29_023537E0
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0234C580 ; =ov29_023537E0
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C580: .word ov29_023537E0
	arm_func_end ov29_0234C544

	arm_func_start ov29_0234C584
ov29_0234C584: ; 0x0234C584
	stmdb sp!, {r3, lr}
	ldr r1, _0234C5E8 ; =ov29_023537E0
	mov r2, #0x10000
	ldr r3, [r1]
	mov r1, #0x9c
	mla r0, r1, r0, r3
	rsb r2, r2, #0
	str r2, [r0, #0x90]
	mov r1, #1
	str r1, [r0, #0x8c]
	mov r2, #0
	str r2, [r0, #0x94]
	strb r1, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C5CC
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
_0234C5CC:
	ldrb r1, [r0, #0x99]
	cmp r1, #0
	strneb r2, [r0, #0x74]
	strneb r2, [r0, #0x75]
	strneb r2, [r0, #0x76]
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C5E8: .word ov29_023537E0
	arm_func_end ov29_0234C584

	arm_func_start ov29_0234C5EC
ov29_0234C5EC: ; 0x0234C5EC
	stmdb sp!, {r3, lr}
	ldr r2, _0234C650 ; =ov29_023537E0
	mov r1, #0x9c
	ldr r3, [r2]
	mov r2, #0x10000
	mla r0, r1, r0, r3
	str r2, [r0, #0x90]
	mov r2, #1
	str r2, [r0, #0x8c]
	mov r1, #0
	str r1, [r0, #0x94]
	strb r2, [r0, #0x98]
	ldrb r1, [r0, #0x88]
	cmp r1, #1
	bne _0234C630
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
_0234C630:
	ldrb r1, [r0, #0x99]
	cmp r1, #0
	movne r1, #0xff
	strneb r1, [r0, #0x74]
	strneb r1, [r0, #0x75]
	strneb r1, [r0, #0x76]
	bl ov29_0234C3A0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C650: .word ov29_023537E0
	arm_func_end ov29_0234C5EC

	arm_func_start ov29_0234C654
ov29_0234C654: ; 0x0234C654
	ldr r1, _0234C664 ; =ov29_023537E0
	ldr r1, [r1]
	strh r0, [r1, #0x72]
	bx lr
	.align 2, 0
_0234C664: .word ov29_023537E0
	arm_func_end ov29_0234C654

	arm_func_start ov29_0234C668
ov29_0234C668: ; 0x0234C668
	stmdb sp!, {r3, lr}
	ldr r3, _0234C708 ; =ov29_023537E0
	mov ip, #0
	ldr lr, [r3]
	add lr, lr, r2, lsl #2
	str r0, [lr, #0x138]
	ldr r0, [r3]
	add r0, r0, r2
	strb ip, [r0, #0x140]
	ldr ip, [r3]
	add r0, ip, r2, lsl #2
	ldr r0, [r0, #0x138]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0234C6E0
_0234C6A4: ; jump table
	b _0234C6E0 ; case 0
	b _0234C6C0 ; case 1
	b _0234C6C8 ; case 2
	b _0234C6C8 ; case 3
	b _0234C6D0 ; case 4
	b _0234C6D8 ; case 5
	b _0234C6D8 ; case 6
_0234C6C0:
	mov r3, #2
	b _0234C6E4
_0234C6C8:
	mov r3, #3
	b _0234C6E4
_0234C6D0:
	mov r3, #4
	b _0234C6E4
_0234C6D8:
	mov r3, #5
	b _0234C6E4
_0234C6E0:
	mov r3, #0
_0234C6E4:
	mov r0, #0x9c
	mla r0, r2, r0, ip
	cmp r3, #0
	bne _0234C6FC
	bl ov29_0234C354
	ldmia sp!, {r3, pc}
_0234C6FC:
	mov r2, r3
	bl ov29_0234C408
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234C708: .word ov29_023537E0
	arm_func_end ov29_0234C668

	arm_func_start ov29_0234C70C
ov29_0234C70C: ; 0x0234C70C
	ldr r2, _0234C734 ; =ov29_023537E0
	mov r1, #0x9c
	ldr r2, [r2]
	mla r1, r0, r1, r2
	ldr r0, [r1, #0x8c]
	cmp r0, #1
	cmpne r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	.align 2, 0
_0234C734: .word ov29_023537E0
	arm_func_end ov29_0234C70C

	arm_func_start ov29_0234C738
ov29_0234C738: ; 0x0234C738
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r0, #0x9c
	mul r4, r5, r0
	ldr r6, _0234C7D0 ; =ov29_023537E0
	mov r7, #5
_0234C750:
	ldr r1, [r6]
	add r0, r1, r5, lsl #2
	ldr r0, [r0, #0x138]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0234C7C0
_0234C768: ; jump table
	b _0234C7C0 ; case 0
	b _0234C784 ; case 1
	b _0234C784 ; case 2
	b _0234C79C ; case 3
	b _0234C784 ; case 4
	b _0234C784 ; case 5
	b _0234C79C ; case 6
_0234C784:
	add r0, r4, r1
	ldr r0, [r0, #0x8c]
	cmp r0, #1
	cmpne r0, #0
	bne _0234C7C0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0234C79C:
	add r0, r5, r1
	ldrb r0, [r0, #0x140]
	cmp r0, #1
	bne _0234C7C0
	add r0, r4, r1
	ldr r0, [r0, #0x8c]
	cmp r0, #1
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0234C7C0:
	mov r0, r7
	bl AdvanceFrame
	b _0234C750
_0234C7CC:
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0234C7D0: .word ov29_023537E0
	arm_func_end ov29_0234C738

	arm_func_start ov29_0234C7D4
ov29_0234C7D4: ; 0x0234C7D4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0234C9E0 ; =ov29_023537E0
	mov r5, r0
	ldr r4, [r1]
	add r0, r4, r5, lsl #2
	ldr r2, [r0, #0x138]
	cmp r2, #6
	addls pc, pc, r2, lsl #2
	b _0234C8B8
_0234C7F8: ; jump table
	b _0234C8B8 ; case 0
	b _0234C814 ; case 1
	b _0234C8B8 ; case 2
	b _0234C830 ; case 3
	b _0234C814 ; case 4
	b _0234C8B8 ; case 5
	b _0234C830 ; case 6
_0234C814:
	mov r0, #0x9c
	mla r0, r5, r0, r4
	ldr r1, [r0, #0x8c]
	cmp r1, #1
	bne _0234C8B8
	bl ov29_0234C354
	ldmia sp!, {r3, r4, r5, pc}
_0234C830:
	adds r0, r4, #0x140
	mov r0, #0x9c
	bne _0234C888
	mla r0, r5, r0, r4
	ldr r1, [r0, #0x8c]
	cmp r1, #1
	bne _0234C8B8
	cmp r2, #3
	ldr r1, [r0, #0x94]
	bne _0234C864
	mov r2, #2
	bl ov29_0234C408
	b _0234C86C
_0234C864:
	mov r2, #4
	bl ov29_0234C408
_0234C86C:
	ldr r0, _0234C9E0 ; =ov29_023537E0
	ldr r0, [r0]
	add r1, r0, #0x140
	ldrb r0, [r1, r5]
	add r0, r0, #1
	strb r0, [r1, r5]
	b _0234C8B8
_0234C888:
	mul r3, r5, r0
	add r0, r4, r3
	ldr r0, [r0, #0x8c]
	cmp r0, #1
	bne _0234C8B8
	add r0, r4, r5
	mov r2, #0
	strb r2, [r0, #0x140]
	ldr r0, [r1]
	add r0, r0, r3
	bl ov29_0234C354
	ldmia sp!, {r3, r4, r5, pc}
_0234C8B8:
	ldr r1, _0234C9E0 ; =ov29_023537E0
	mov r0, #0x9c
	ldr r1, [r1]
	mla r4, r5, r0, r1
	ldrb r0, [r4, #0x98]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0x88]
	cmp r0, #1
	bne _0234C8EC
	mov r0, r4
	bl ov29_0234C3A0
	b _0234C918
_0234C8EC:
	ldrb r0, [r4, #0x99]
	cmp r0, #0
	mov r0, r4
	beq _0234C914
	bl ov29_0234C3A0
	cmp r0, #0
	beq _0234C918
	add r0, r4, #0x48
	bl sub_0201F2A0
	b _0234C918
_0234C914:
	bl ov29_0234C3A0
_0234C918:
	ldr r0, [r4, #0x8c]
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
_0234C928: ; jump table
	ldmia sp!, {r3, r4, r5, pc} ; case 0
	ldmia sp!, {r3, r4, r5, pc} ; case 1
	b _0234C9BC ; case 2
	b _0234C968 ; case 3
	b _0234C994 ; case 4
	b _0234C940 ; case 5
_0234C940:
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	add r0, r1, r0
	str r0, [r4, #0x90]
	cmp r0, #0x10000
	movge r0, #0x10000
	strge r0, [r4, #0x90]
	movge r0, #1
	strge r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
_0234C968:
	ldr r2, [r4, #0x90]
	ldr r1, [r4, #0x94]
	mov r0, #0x10000
	sub r1, r2, r1
	rsb r0, r0, #0
	str r1, [r4, #0x90]
	cmp r1, r0
	strle r0, [r4, #0x90]
	movle r0, #1
	strle r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
_0234C994:
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	sub r0, r1, r0
	str r0, [r4, #0x90]
	cmp r0, #0
	movle r0, #0
	strle r0, [r4, #0x90]
	movle r0, #1
	strle r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
_0234C9BC:
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x94]
	adds r0, r1, r0
	str r0, [r4, #0x90]
	movpl r0, #0
	strpl r0, [r4, #0x90]
	movpl r0, #1
	strpl r0, [r4, #0x8c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234C9E0: .word ov29_023537E0
	arm_func_end ov29_0234C7D4

	arm_func_start ov29_0234C9E4
ov29_0234C9E4: ; 0x0234C9E4
	stmdb sp!, {r3, lr}
	mov r0, #0
	bl ov29_0234C7D4
	mov r0, #1
	bl ov29_0234C7D4
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234C9E4

	arm_func_start ov29_0234C9FC
ov29_0234C9FC: ; 0x0234C9FC
	stmdb sp!, {r3, lr}
	mov r0, #8
	mov r1, #0
	bl MemAlloc
	ldr r1, _0234CA28 ; =ov29_023537E4
	mov r2, #0
	str r0, [r1]
	str r2, [r0, #4]
	ldr r0, [r1]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CA28: .word ov29_023537E4
	arm_func_end ov29_0234C9FC

	arm_func_start ov29_0234CA2C
ov29_0234CA2C: ; 0x0234CA2C
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CA48
	mov r0, #0x21
	bl UnloadOverlay
_0234CA48:
	ldr r0, _0234CA64 ; =ov29_023537E4
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0234CA64 ; =ov29_023537E4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CA64: .word ov29_023537E4
	arm_func_end ov29_0234CA2C

	arm_func_start ov29_0234CA68
ov29_0234CA68: ; 0x0234CA68
	ldr r0, _0234CA78 ; =ov29_023537E4
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_0234CA78: .word ov29_023537E4
	arm_func_end ov29_0234CA68

	arm_func_start ov29_0234CA7C
ov29_0234CA7C: ; 0x0234CA7C
	mov r0, #0x5800
	bx lr
	arm_func_end ov29_0234CA7C

	arm_func_start ov29_0234CA84
ov29_0234CA84: ; 0x0234CA84
	stmdb sp!, {r3, lr}
	ldr r0, _0234CAC4 ; =ov29_023537E4
	mov r3, #1
	ldr r1, [r0]
	ldr r2, _0234CAC8 ; =ov29_0237D000
	str r3, [r1]
	ldr r1, [r0]
	mov r0, #0x21
	str r2, [r1, #4]
	bl LoadOverlay
	ldr r0, _0234CAC4 ; =ov29_023537E4
	mov r1, #0x5800
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov30_02382C68
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CAC4: .word ov29_023537E4
_0234CAC8: .word ov29_0237D000
	arm_func_end ov29_0234CA84

	arm_func_start ov29_0234CACC
ov29_0234CACC: ; 0x0234CACC
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CAE8
	mov r0, #0x21
	bl UnloadOverlay
_0234CAE8:
	ldr r0, _0234CAFC ; =ov29_023537E4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CAFC: .word ov29_023537E4
	arm_func_end ov29_0234CACC

	arm_func_start ov29_0234CB00
ov29_0234CB00: ; 0x0234CB00
	ldr r0, _0234CB28 ; =ov29_023537E4
	mov r3, #2
	ldr r1, [r0]
	ldr r2, _0234CB2C ; =ov29_0237D000
	str r3, [r1]
	ldr r1, [r0]
	ldr ip, _0234CB30 ; =LoadOverlay
	mov r0, #0x21
	str r2, [r1, #4]
	bx ip
	.align 2, 0
_0234CB28: .word ov29_023537E4
_0234CB2C: .word ov29_0237D000
_0234CB30: .word LoadOverlay
	arm_func_end ov29_0234CB00

	arm_func_start ov29_0234CB34
ov29_0234CB34: ; 0x0234CB34
	ldr r0, _0234CB4C ; =ov29_023537E4
	ldr ip, _0234CB50 ; =ov30_023842F4
	ldr r0, [r0]
	mov r1, #0x5800
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_0234CB4C: .word ov29_023537E4
_0234CB50: .word ov30_023842F4
	arm_func_end ov29_0234CB34

	arm_func_start ov29_0234CB54
ov29_0234CB54: ; 0x0234CB54
	stmdb sp!, {r3, lr}
	mov r0, #0x21
	bl OverlayIsLoaded
	cmp r0, #0
	beq _0234CB70
	mov r0, #0x21
	bl UnloadOverlay
_0234CB70:
	ldr r0, _0234CB84 ; =ov29_023537E4
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CB84: .word ov29_023537E4
	arm_func_end ov29_0234CB54

	arm_func_start ov29_0234CB88
ov29_0234CB88: ; 0x0234CB88
	stmdb sp!, {r3, lr}
	bl GetLeader
	ldr r2, _0234CC88 ; =ov29_02353538
	mvn r3, #0
	ldr r1, [r2]
	ldr r0, _0234CC8C ; =ov29_023532C0
	add r1, r1, #0x100
	strh r3, [r1, #0xd8]
	ldr r2, [r2]
	mov r1, #1
	add r2, r2, #0x100
	strh r3, [r2, #0xda]
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC90 ; =ov29_023532B8
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC94 ; =ov29_023532B0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC98 ; =ov29_02353240
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldreq r0, _0234CC88 ; =ov29_02353538
	ldreq r0, [r0]
	ldreqb r0, [r0, #0x748]
	cmpeq r0, #3
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CC9C ; =ov29_023532A0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA0 ; =ov29_02353298
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA4 ; =ov29_02353290
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCA8 ; =ov29_02353278
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCAC ; =ov29_02353238
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CCB0 ; =ov29_023532E0
	mov r1, #1
	bl DisplayDungeonTip
	cmp r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CC88: .word ov29_02353538
_0234CC8C: .word ov29_023532C0
_0234CC90: .word ov29_023532B8
_0234CC94: .word ov29_023532B0
_0234CC98: .word ov29_02353240
_0234CC9C: .word ov29_023532A0
_0234CCA0: .word ov29_02353298
_0234CCA4: .word ov29_02353290
_0234CCA8: .word ov29_02353278
_0234CCAC: .word ov29_02353238
_0234CCB0: .word ov29_023532E0
	arm_func_end ov29_0234CB88

	arm_func_start ov29_0234CCB4
ov29_0234CCB4: ; 0x0234CCB4
	stmdb sp!, {r4, lr}
	ldr r2, _0234CEA4 ; =ov29_02353538
	mvn r3, #0
	ldr r1, [r2]
	mov r4, r0
	add r1, r1, #0x100
	strh r3, [r1, #0xd8]
	ldr r1, [r2]
	add r1, r1, #0x100
	strh r3, [r1, #0xda]
	bl GetItemCategoryVeneer
	cmp r0, #3
	bne _0234CCF8
	ldr r0, _0234CEA8 ; =ov29_023532F0
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CCF8:
	cmp r4, #0x46
	bne _0234CD10
	ldr r0, _0234CEAC ; =ov29_023532F8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD10:
	cmp r4, #0x52
	bne _0234CD28
	ldr r0, _0234CEB0 ; =ov29_023532D8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD28:
	cmp r4, #0x57
	bne _0234CD40
	ldr r0, _0234CEB4 ; =ov29_023532C8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD40:
	cmp r4, #8
	bne _0234CD58
	ldr r0, _0234CEB8 ; =ov29_02353250
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD58:
	cmp r4, #0x51
	bne _0234CD70
	ldr r0, _0234CEBC ; =ov29_02353248
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD70:
	cmp r4, #0x54
	bne _0234CD88
	ldr r0, _0234CEC0 ; =ov29_02353270
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CD88:
	cmp r4, #0xb7
	bne _0234CDA0
	ldr r0, _0234CEC4 ; =ov29_02353280
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDA0:
	cmp r4, #0x63
	bne _0234CDB8
	ldr r0, _0234CEC8 ; =ov29_023532A8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDB8:
	cmp r4, #0x45
	bne _0234CDD0
	ldr r0, _0234CECC ; =ov29_02353300
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDD0:
	cmp r4, #0x5b
	bne _0234CDE8
	ldr r0, _0234CED0 ; =ov29_02353258
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CDE8:
	cmp r4, #0x56
	bne _0234CE00
	ldr r0, _0234CED4 ; =ov29_02353268
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE00:
	cmp r4, #0x5e
	bne _0234CE18
	ldr r0, _0234CED8 ; =ov29_02353288
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE18:
	cmp r4, #0x4c
	bne _0234CE30
	ldr r0, _0234CEDC ; =ov29_023532E8
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE30:
	cmp r4, #0x60
	bne _0234CE48
	ldr r0, _0234CEE0 ; =ov29_02353260
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE48:
	cmp r4, #0x75
	bne _0234CE60
	ldr r0, _0234CEE4 ; =ov29_02353308
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
_0234CE60:
	ldr r0, _0234CEA4 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	cmp r0, #0x7b
	ldmneia sp!, {r4, pc}
	ldr r0, _0234CEE8 ; =0xFFFFFED2
	add r0, r4, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	ldr r0, _0234CEEC ; =ov29_02353310
	mov r1, #0
	bl DisplayDungeonTip
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234CEA4: .word ov29_02353538
_0234CEA8: .word ov29_023532F0
_0234CEAC: .word ov29_023532F8
_0234CEB0: .word ov29_023532D8
_0234CEB4: .word ov29_023532C8
_0234CEB8: .word ov29_02353250
_0234CEBC: .word ov29_02353248
_0234CEC0: .word ov29_02353270
_0234CEC4: .word ov29_02353280
_0234CEC8: .word ov29_023532A8
_0234CECC: .word ov29_02353300
_0234CED0: .word ov29_02353258
_0234CED4: .word ov29_02353268
_0234CED8: .word ov29_02353288
_0234CEDC: .word ov29_023532E8
_0234CEE0: .word ov29_02353260
_0234CEE4: .word ov29_02353308
_0234CEE8: .word 0xFFFFFED2
_0234CEEC: .word ov29_02353310
	arm_func_end ov29_0234CCB4

	arm_func_start DisplayDungeonTip
DisplayDungeonTip: ; 0x0234CEF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r4, r1
	bl GetDungeonTipShown
	cmp r0, #0
	bne _0234CF58
	ldrh r0, [r5, #4]
	bl StringFromMessageId
	ldrb r0, [r0]
	cmp r0, #0
	beq _0234CF58
	ldr r0, [r5]
	bl SetDungeonTipShown
	bl ov29_022EACBC
	ldrh r1, [r5, #4]
	mov r0, #0
	mov r2, #1
	bl DisplayMessage2
	cmp r4, #0
	beq _0234CF50
	bl GetLeader
	ldrh r1, [r5, #4]
	bl LogMessageByIdQuiet
_0234CF50:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0234CF58:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DisplayDungeonTip

	arm_func_start SetBothScreensWindowColorToDefault
SetBothScreensWindowColorToDefault: ; 0x0234CF60
	stmdb sp!, {r3, lr}
	bl GetGameMode
	cmp r0, #3
	bne _0234CF7C
	mov r0, #2
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
_0234CF7C:
	bl ov29_022F42D8
	cmp r0, #1
	bne _0234CF94
	mov r0, #0
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
_0234CF94:
	mov r0, #1
	bl SetBothScreensWindowsColor
	ldmia sp!, {r3, pc}
	arm_func_end SetBothScreensWindowColorToDefault

	arm_func_start ov29_0234CFA0
ov29_0234CFA0: ; 0x0234CFA0
	stmdb sp!, {r3, lr}
	bl IsFullFloorFixedRoom
	cmp r0, #0
	movne r0, #2
	ldmneia sp!, {r3, pc}
	ldr r0, _0234CFE8 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r0, [r0, #0x748]
	bl IsFutureDungeon
	cmp r0, #0
	bne _0234CFD8
	bl IsSecretFloor
	cmp r0, #0
	beq _0234CFE0
_0234CFD8:
	mov r0, #1
	ldmia sp!, {r3, pc}
_0234CFE0:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234CFE8: .word ov29_02353538
	arm_func_end ov29_0234CFA0

	arm_func_start GetPersonalityIndex
GetPersonalityIndex: ; 0x0234CFEC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x48]
	cmp r0, #0xd8
	cmpne r0, #0xf9
	cmpne r0, #0xf7
	cmpne r0, #0xf8
	beq _0234D1D4
	cmp r0, #0xd6
	blo _0234D1D4
	cmp r0, #0xd7
	bne _0234D04C
	mov r0, #0
	mov r1, #0x43
	bl LoadScriptVariableValue
	cmp r0, #1
	moveq r4, #0x4b0
	beq _0234D1E0
	cmp r0, #2
	ldreq r4, _0234D1E8 ; =0x000004B1
	beq _0234D1E0
	cmp r0, #3
	ldreq r4, _0234D1EC ; =0x000004B2
	b _0234D1E0
_0234D04C:
	cmp r0, #0xd6
	bne _0234D0A0
	ldrsh r2, [r5, #2]
	ldr r1, _0234D1F0 ; =0x000001B2
	cmp r2, r1
	ldreq r4, _0234D1F4 ; =0x000004CD
	beq _0234D1E0
	cmp r2, #0xae
	addeq r4, r1, #0x31c
	beq _0234D1E0
	add r0, r1, #0x27c
	cmp r2, r0
	ldreq r4, _0234D1F8 ; =0x000004CF
	beq _0234D1E0
	sub r0, r1, #0x99
	cmp r2, r0
	moveq r4, #0x4d0
	beq _0234D1E0
	cmp r2, #0x318
	ldreq r4, _0234D1FC ; =0x000004D1
	b _0234D1E0
_0234D0A0:
	cmp r0, #0xda
	ldreq r4, _0234D200 ; =0x000004B3
	beq _0234D1E0
	cmp r0, #0xed
	bne _0234D148
	ldr r0, _0234D204 ; =ov29_02353538
	ldr r0, [r0]
	ldrb r1, [r0, #0x748]
	add r0, r1, #0x7b
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D208 ; =0x000004C4
	bls _0234D1E0
	cmp r1, #0x88
	ldreq r4, _0234D20C ; =0x000004C6
	beq _0234D1E0
	add r0, r1, #0x77
	and r0, r0, #0xff
	cmp r0, #1
	ldrls r4, _0234D210 ; =0x000004C7
	bls _0234D1E0
	add r0, r1, #0x75
	and r0, r0, #0xff
	cmp r0, #1
	ldrls r4, _0234D214 ; =0x000004C8
	bls _0234D1E0
	cmp r1, #0x8d
	ldreq r4, _0234D218 ; =0x000004C9
	beq _0234D1E0
	add r0, r1, #0x72
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D21C ; =0x000004CA
	bls _0234D1E0
	cmp r1, #0x91
	ldreq r4, _0234D220 ; =0x000004CB
	beq _0234D1E0
	add r0, r1, #0x6e
	and r0, r0, #0xff
	cmp r0, #2
	ldrls r4, _0234D224 ; =0x000004CC
	b _0234D1E0
_0234D148:
	cmp r0, #0xe2
	bne _0234D170
	mov r0, #0x1a
	bl GetPerformanceFlagWithChecks
	cmp r0, #0
	beq _0234D170
	ldrsh r0, [r5, #2]
	bl sub_02025784
	mov r4, r0
	b _0234D1E0
_0234D170:
	ldr r1, _0234D228 ; =ov29_023537E8
	b _0234D1C4
_0234D178:
	ldrb r0, [r5, #0x48]
	cmp r0, r2
	bne _0234D1C0
	ldrsh r4, [r1, #2]
	ldr r0, _0234D22C ; =0x000004B8
	cmp r4, r0
	bne _0234D1A8
	ldrsh r0, [r5, #2]
	cmp r0, #0x1f8
	cmpne r0, #0x51
	ldreq r4, _0234D230 ; =0x000004D3
	beq _0234D1E0
_0234D1A8:
	cmp r4, #0
	bne _0234D1E0
	ldrsh r0, [r5, #2]
	bl sub_02025784
	mov r4, r0
	b _0234D1E0
_0234D1C0:
	add r1, r1, #4
_0234D1C4:
	ldrb r2, [r1]
	cmp r2, #0xff
	bne _0234D178
	b _0234D1E0
_0234D1D4:
	ldrsh r0, [r5, #4]
	bl sub_02025784
	mov r4, r0
_0234D1E0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234D1E8: .word 0x000004B1
_0234D1EC: .word 0x000004B2
_0234D1F0: .word 0x000001B2
_0234D1F4: .word 0x000004CD
_0234D1F8: .word 0x000004CF
_0234D1FC: .word 0x000004D1
_0234D200: .word 0x000004B3
_0234D204: .word ov29_02353538
_0234D208: .word 0x000004C4
_0234D20C: .word 0x000004C6
_0234D210: .word 0x000004C7
_0234D214: .word 0x000004C8
_0234D218: .word 0x000004C9
_0234D21C: .word 0x000004CA
_0234D220: .word 0x000004CB
_0234D224: .word 0x000004CC
_0234D228: .word ov29_023537E8
_0234D22C: .word 0x000004B8
_0234D230: .word 0x000004D3
	arm_func_end GetPersonalityIndex

	arm_func_start ov29_0234D234
ov29_0234D234: ; 0x0234D234
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	ldrb ip, [sp, #0x14]
	str lr, [sp]
	str ip, [sp, #4]
	bl ov29_0234D5D0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234D234

	arm_func_start DisplayMessage
DisplayMessage: ; 0x0234D258
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0xa
	bl ov29_0234BA54
	bl ov29_0234D558
	bl ov29_0234B034
	mov r1, r4
	mov r2, r6
	str r0, [sp]
	mov r0, r5
	mov r3, #0
	str r3, [sp, #4]
	bl DisplayMessageInternal
	mov r0, #0xb
	mov r1, #0
	bl ov29_022EA428
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessage

	arm_func_start DisplayMessage2
DisplayMessage2: ; 0x0234D2AC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, #0xa
	bl ov29_0234BA54
	bl ov29_0234D558
	bl ov29_0234B034
	mov r1, r4
	mov r2, r6
	str r0, [sp]
	mov r0, r5
	mov r3, #1
	str r3, [sp, #4]
	mov r3, #0
	bl DisplayMessageInternal
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessage2

	arm_func_start ov29_0234D304
ov29_0234D304: ; 0x0234D304
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	ldr r4, _0234D454 ; =ov29_02353563
	mov r8, r0
	ldrb r0, [r4]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r0, #0
	beq _0234D334
	mov r0, #0xa
	bl ov29_0234BA54
_0234D334:
	bl ov29_0234D558
	mov r0, r8
	bl IsMonster__0234D460
	cmp r0, #0
	beq _0234D41C
	mov r0, r8
	bl IsMonster__0234D460
	cmp r0, #0
	beq _0234D3F8
	ldr r4, [r8, #0xb4]
	bl FixedRoomIsSubstituteRoom
	cmp r0, #0
	beq _0234D3BC
	bl ov29_022F99EC
	cmp r0, #0
	moveq r1, #0
	beq _0234D38C
	ldr r1, [r0]
	cmp r1, #0
	movne r1, #1
	moveq r1, #0
	and r1, r1, #0xff
_0234D38C:
	cmp r1, #0
	moveq r0, #0
	streq r0, [sp, #8]
	beq _0234D3D0
	ldr r1, [r0, #0xb4]
	ldr r0, _0234D458 ; =ov29_02353368
	ldrb r1, [r1, #0xbc]
	sub r1, r1, #0xb
	orr r1, r1, #0x90000
	str r1, [sp, #8]
	bl DebugPrint0
	b _0234D3D0
_0234D3BC:
	bl ov29_02337EE8
	mov r1, r0
	ldr r0, _0234D45C ; =ov29_02353380
	str r1, [sp, #8]
	bl DebugPrint0
_0234D3D0:
	ldrsh r0, [r4, #4]
	str r0, [sp, #0xc]
	bl ov29_0233804C
	str r0, [sp, #0x18]
	mov r0, r8
	bl ov29_0231ADA8
	str r0, [sp, #0x1c]
	ldrsh r0, [r4, #0xc]
	orr r0, r0, #0x30000
	str r0, [sp, #0x54]
_0234D3F8:
	add r3, sp, #8
	str r3, [sp]
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, r7
	str r3, [sp, #4]
	bl ov29_0234D5D0
	b _0234D440
_0234D41C:
	bl ov29_0234B034
	str r0, [sp]
	mov r4, #1
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, #0
	str r4, [sp, #4]
	bl ov29_0234D5D0
_0234D440:
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0234D454: .word ov29_02353563
_0234D458: .word ov29_02353368
_0234D45C: .word ov29_02353380
	arm_func_end ov29_0234D304

	arm_func_start IsMonster__0234D460
IsMonster__0234D460: ; 0x0234D460
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r0, [r0]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end IsMonster__0234D460

	arm_func_start ov29_0234D484
ov29_0234D484: ; 0x0234D484
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	bl StringFromMessageId
	mov r4, r0
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, #1
	bl ov29_0234D304
	mov r0, r5
	mov r1, r4
	bl LogMessageQuiet
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov29_0234D484

	arm_func_start ov29_0234D4BC
ov29_0234D4BC: ; 0x0234D4BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov29_0234D558
	bl ov29_0234D630
	bl ov29_0234B034
	mov r1, r0
	mov r2, r7
	mov r3, r5
	mov r0, r6
	str r4, [sp]
	bl ov29_0234D750
	mov r4, r0
	ldrb r0, [sp, #0x18]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	bl ov29_0234D8A0
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234D4BC

	arm_func_start YesNoMenu
YesNoMenu: ; 0x0234D518
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, r1
	mov r5, r2
	mov r4, r3
	bl StringFromMessageId
	ldrb ip, [sp, #0x18]
	mov r1, r0
	mov r0, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov29_0234D4BC
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end YesNoMenu

	arm_func_start ov29_0234D558
ov29_0234D558: ; 0x0234D558
	stmdb sp!, {r4, lr}
	bl ov29_0234B73C
	mov r4, r0
	mov r0, #2
	mov r1, #0
	bl ov29_022EA428
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0
	bl ov29_0234B1A4
	mov r0, #0xa
	mov r1, r0
	bl ov29_022EA370
	ldmia sp!, {r4, pc}
	arm_func_end ov29_0234D558

	arm_func_start DisplayMessageInternal
DisplayMessageInternal: ; 0x0234D590
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl StringFromMessageId
	ldr r1, [sp, #0x18]
	ldrb ip, [sp, #0x1c]
	str r1, [sp]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp, #4]
	bl ov29_0234D5D0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DisplayMessageInternal

	arm_func_start ov29_0234D5D0
ov29_0234D5D0: ; 0x0234D5D0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r0, #2
	mov r1, #0
	mov r5, r2
	mov r4, r3
	bl ov29_022EA428
	mov r0, #1
	bl ov29_0234B4CC
	bl ov29_0234DB58
	mov r0, r5
	bl ov29_0234DBE0
	mov r0, r7
	mov r3, r4
	str r6, [sp]
	ldr r1, [sp, #0x18]
	mov r2, #0
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	mov r0, r6
	ldrb r1, [sp, #0x1c]
	bl ov29_0234D8B4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234D5D0

	arm_func_start ov29_0234D630
ov29_0234D630: ; 0x0234D630
	stmdb sp!, {r3, lr}
	mov r0, #2
	mov r1, #0
	bl ov29_022EA428
	mov r0, #1
	bl ov29_0234B4CC
	bl ov29_0234DB58
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234D630

	arm_func_start ov29_0234D650
ov29_0234D650: ; 0x0234D650
	ldr ip, _0234D658 ; =ov29_0234D9C0
	bx ip
	.align 2, 0
_0234D658: .word ov29_0234D9C0
	arm_func_end ov29_0234D650

	arm_func_start ov29_0234D65C
ov29_0234D65C: ; 0x0234D65C
	ldr ip, _0234D664 ; =ov29_0234DBE0
	bx ip
	.align 2, 0
_0234D664: .word ov29_0234DBE0
	arm_func_end ov29_0234D65C

	arm_func_start ov29_0234D668
ov29_0234D668: ; 0x0234D668
	stmdb sp!, {r3, lr}
	ldr r0, _0234D68C ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x12]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl HidePortraitBox
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234D68C: .word ov29_02382800
	arm_func_end ov29_0234D668

	arm_func_start ov29_0234D690
ov29_0234D690: ; 0x0234D690
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl StringFromMessageId
	ldrb ip, [sp, #0x18]
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl ov29_0234DC3C
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov29_0234D690

	arm_func_start ov29_0234D6C8
ov29_0234D6C8: ; 0x0234D6C8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r0, r2
	mov r5, r1
	mov r4, r3
	bl ov29_0234DBE0
	ldrb ip, [sp, #0x18]
	mov r0, r6
	mov r1, r5
	mov r3, r4
	mov r2, #0
	str ip, [sp]
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov29_0234D6C8

	arm_func_start ov29_0234D70C
ov29_0234D70C: ; 0x0234D70C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	mov r7, r1
	mov r5, r3
	bl StringFromMessageId
	mov r4, r0
	mov r0, r6
	bl ov29_0234DBE0
	mov r0, r4
	mov r1, r7
	mov r3, r5
	ldrb ip, [sp, #0x18]
	mov r2, #0
	str ip, [sp]
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov29_0234D70C

	arm_func_start ov29_0234D750
ov29_0234D750: ; 0x0234D750
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldrb ip, [sp, #0x20]
	mov r4, r2
	mov r6, r0
	mov r5, r1
	mov r2, #0
	mov r1, r3
	add r0, sp, #4
	mov r3, r2
	str ip, [sp]
	bl ov29_0234D860
	mov r0, r4
	bl ov29_0234DBE0
	mov r2, #1
	str r2, [sp]
	mov r0, r6
	mov r1, r5
	add r2, sp, #4
	mov r3, #0
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	ldr r0, _0234D7BC ; =ov29_02382800
	ldr r0, [r0]
	ldr r0, [r0, #0x46c]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0234D7BC: .word ov29_02382800
	arm_func_end ov29_0234D750

	arm_func_start ov29_0234D7C0
ov29_0234D7C0: ; 0x0234D7C0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl StringFromMessageId
	ldrb r1, [sp, #0x20]
	mov r2, #0
	mov r4, r0
	str r1, [sp]
	add r0, sp, #4
	mov r1, r5
	mov r3, r2
	bl ov29_0234D860
	mov r0, r6
	bl ov29_0234DBE0
	mov r2, #1
	str r2, [sp]
	mov r0, r4
	mov r1, r7
	add r2, sp, #4
	mov r3, #0
	bl ov29_0234DC3C
	bl ov29_0234D9C0
	ldr r0, _0234D834 ; =ov29_02382800
	ldr r0, [r0]
	ldr r0, [r0, #0x46c]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_0234D834: .word ov29_02382800
	arm_func_end ov29_0234D7C0

	arm_func_start ov29_0234D838
ov29_0234D838: ; 0x0234D838
	stmdb sp!, {r3, lr}
	ldr r0, _0234D85C ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x10]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	bl sub_0202F334
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234D85C: .word ov29_02382800
	arm_func_end ov29_0234D838

	arm_func_start ov29_0234D860
ov29_0234D860: ; 0x0234D860
	ldrb ip, [sp]
	strb r3, [r0]
	strb ip, [r0, #1]
	strh r1, [r0, #2]
	str r2, [r0, #4]
	bx lr
	arm_func_end ov29_0234D860

	arm_func_start ov29_0234D878
ov29_0234D878: ; 0x0234D878
	ldr r1, _0234D888 ; =ov29_02382800
	ldr r1, [r1]
	str r0, [r1, #0x474]
	bx lr
	.align 2, 0
_0234D888: .word ov29_02382800
	arm_func_end ov29_0234D878

	arm_func_start ov29_0234D88C
ov29_0234D88C: ; 0x0234D88C
	ldr r0, _0234D89C ; =ov29_02382800
	ldr r0, [r0]
	ldr r0, [r0, #0x46c]
	bx lr
	.align 2, 0
_0234D89C: .word ov29_02382800
	arm_func_end ov29_0234D88C

	arm_func_start ov29_0234D8A0
ov29_0234D8A0: ; 0x0234D8A0
	ldr ip, _0234D8B0 ; =ov29_0234D8B4
	mov r1, r0
	mov r0, #0
	bx ip
	.align 2, 0
_0234D8B0: .word ov29_0234D8B4
	arm_func_end ov29_0234D8A0

	arm_func_start ov29_0234D8B4
ov29_0234D8B4: ; 0x0234D8B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0234D9BC ; =ov29_02382800
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	cmp r0, #0
	beq _0234D970
	ldrsb r0, [r0, #0x12]
	mvn r1, #1
	cmp r0, r1
	beq _0234D8E4
	bl HidePortraitBox
_0234D8E4:
	ldr r0, _0234D9BC ; =ov29_02382800
	ldr r0, [r0]
	ldrsb r0, [r0, #0x10]
	bl sub_0202F334
	mov r0, #8
	mov r1, #0x62
	bl ov29_022EA370
	ldr r0, _0234D9BC ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x11]
	cmp r0, r1
	beq _0234D91C
	bl sub_0202AABC
_0234D91C:
	ldr r0, _0234D9BC ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	ldrsb r0, [r0, #0x12]
	cmp r0, r1
	beq _0234D948
	bl FreePortraitBox
	ldr r0, _0234D9BC ; =ov29_02382800
	mvn r1, #1
	ldr r0, [r0]
	strb r1, [r0, #0x12]
_0234D948:
	ldr r0, _0234D9BC ; =ov29_02382800
	ldr r0, [r0]
	ldrsb r0, [r0, #0x10]
	bl FreeDBox
	ldr r0, _0234D9BC ; =ov29_02382800
	ldr r0, [r0]
	bl MemFree
	ldr r0, _0234D9BC ; =ov29_02382800
	mov r1, #0
	str r1, [r0]
_0234D970:
	mov r0, #0x62
	bl AdvanceFrame
	cmp r5, #0
	beq _0234D994
	bl ov29_022F2FE4
	bl ov29_02339148
	mov r0, #8
	mov r1, #9
	bl ov29_022EA370
_0234D994:
	cmp r4, #0
	beq _0234D9A8
	mov r0, #0
	mov r1, r0
	bl ov29_022EA428
_0234D9A8:
	bl sub_02006B70
	bl ov29_022E0B44
	mov r0, #0
	bl ov29_0234B4CC
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0234D9BC: .word ov29_02382800
	arm_func_end ov29_0234D8B4

	arm_func_start ov29_0234D9C0
ov29_0234D9C0: ; 0x0234D9C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mvn r8, #1
	mov r7, #0
	ldr r6, _0234DB50 ; =ov29_02382800
	sub r5, r8, #3
	sub r4, r8, #2
	mov sb, #1
	mov fp, r7
_0234D9E0:
	mov r0, #0x62
	bl AdvanceFrame
	ldr r1, [r6]
	ldrb r0, [r1, #0x466]
	cmp r0, #0
	beq _0234DB2C
	add r0, r1, #0x400
	ldrsh r0, [r0, #0x6a]
	mov sl, #0
	cmp r0, #0
	bne _0234DA90
	ldrsb r0, [r1, #0x10]
	bl IsDBoxActive
	cmp r0, #0
	bne _0234DB44
	ldr r0, [r6]
	add r0, r0, #0x400
	strh sb, [r0, #0x6a]
	ldr r0, [r6]
	ldr r3, [r0, #0x470]
	ldrb r0, [r0, #0x467]
	cmp r3, #0
	ldreq r3, _0234DB54 ; =ov29_02353398
	cmp r0, #0
	movne r1, #0x11
	mov r0, #0
	moveq r1, #0x13
	mov r2, r0
	bl sub_0202A5CC
	ldr r1, [r6]
	strb r0, [r1, #0x11]
	ldr r1, [r6]
	ldrsb r0, [r1, #0x11]
	add r1, r1, #0x400
	ldrsh r1, [r1, #0x68]
	bl sub_0202AB94
	ldr r0, [r6]
	ldr r0, [r0, #0x474]
	cmp r0, #0
	beq _0234DB44
	blx r0
	ldr r0, [r6]
	str fp, [r0, #0x474]
	b _0234DB44
_0234DA90:
	ldrsb r0, [r1, #0x11]
	bl sub_020282F4
	ldr r2, [r6]
	ldrb r1, [r2, #0x467]
	cmp r1, #0
	cmpeq r0, r5
	moveq r0, #2
	streq r0, [r2, #0x46c]
	moveq sl, #1
	beq _0234DAD4
	cmp r0, r4
	bne _0234DAD4
	ldrsb r0, [r2, #0x11]
	bl sub_0202ABB0
	ldr r1, [r6]
	mov sl, #1
	str r0, [r1, #0x46c]
_0234DAD4:
	cmp sl, #0
	beq _0234DB44
	ldr r0, [r6]
	ldrsb r0, [r0, #0x11]
	cmp r0, r8
	beq _0234DAF8
	bl sub_0202AABC
	ldr r0, [r6]
	strb r8, [r0, #0x11]
_0234DAF8:
	ldr r0, [r6]
	add r0, r0, #0x400
	strh r7, [r0, #0x6a]
	ldr r0, [r6]
	strb r7, [r0, #0x466]
	ldr r0, [r6]
	strb r7, [r0, #0x467]
	ldr r0, [r6]
	add r0, r0, #0x400
	strh r7, [r0, #0x68]
	ldr r0, [r6]
	str r7, [r0, #0x470]
	b _0234DB44
_0234DB2C:
	ldrsb r0, [r1, #0x10]
	bl IsDBoxActive
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	and sl, r0, #0xff
_0234DB44:
	cmp sl, #0
	beq _0234D9E0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_0234DB50: .word ov29_02382800
_0234DB54: .word ov29_02353398
	arm_func_end ov29_0234D9C0

	arm_func_start ov29_0234DB58
ov29_0234DB58: ; 0x0234DB58
	stmdb sp!, {r3, lr}
	ldr r0, _0234DBD8 ; =0x00000478
	mov r1, #8
	bl MemAlloc
	ldr r2, _0234DBDC ; =ov29_02382800
	ldr r1, _0234DBD8 ; =0x00000478
	str r0, [r2]
	bl MemZero
	ldr r0, _0234DBDC ; =ov29_02382800
	mvn r2, #0
	ldr r1, [r0]
	str r2, [r1, #0x46c]
	ldr r0, [r0]
	add r0, r0, #0x14
	bl InitPreprocessorArgs
	ldr r1, _0234DBDC ; =ov29_02382800
	mov r3, #0
	ldr r0, [r1]
	sub r2, r3, #2
	strb r3, [r0, #0x466]
	ldr r0, [r1]
	add r0, r0, #0x400
	strh r3, [r0, #0x6a]
	ldr r0, [r1]
	strb r2, [r0, #0x12]
	ldr r0, [r1]
	strb r2, [r0, #0x11]
	ldr r0, [r1]
	strb r2, [r0, #0x10]
	ldr r0, [r1]
	str r3, [r0, #0x474]
	ldmia sp!, {r3, pc}
	.align 2, 0
_0234DBD8: .word 0x00000478
_0234DBDC: .word ov29_02382800
	arm_func_end ov29_0234DB58

	arm_func_start ov29_0234DBE0
ov29_0234DBE0: ; 0x0234DBE0
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	ldr r1, _0234DC38 ; =ov29_02382800
	mvn r0, #1
	ldr r1, [r1]
	ldrsb r1, [r1, #0x12]
	cmp r1, r0
	bne _0234DC20
	mov r0, #0
	mov r1, #3
	mov r2, #1
	bl CreatePortraitBox
	ldr r1, _0234DC38 ; =ov29_02382800
	ldr r1, [r1]
	strb r0, [r1, #0x12]
_0234DC20:
	ldr r0, _0234DC38 ; =ov29_02382800
	mov r1, r4
	ldr r0, [r0]
	ldrsb r0, [r0, #0x12]
	bl ShowPortraitBox
	ldmia sp!, {r4, pc}
	.align 2, 0
_0234DC38: .word ov29_02382800
	arm_func_end ov29_0234DBE0

	arm_func_start ov29_0234DC3C
ov29_0234DC3C: ; 0x0234DC3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0234DD88 ; =ov29_02382800
	mvn ip, #1
	ldr r4, [r4]
	mov r7, r0
	ldrsb r0, [r4, #0x10]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r0, ip
	bne _0234DC8C
	mov r0, #0
	bl CreateDBox
	ldr r2, _0234DD88 ; =ov29_02382800
	mov r1, #0
	ldr r3, [r2]
	strb r0, [r3, #0x10]
	ldr r0, [r2]
	ldrsb r0, [r0, #0x10]
	bl sub_0202F474
_0234DC8C:
	ldr r0, _0234DD88 ; =ov29_02382800
	mov r8, r6
	ldr sb, [r0]
	mov ip, #5
	add lr, sb, #0x14
_0234DCA0:
	ldmia r8!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0234DCA0
	ldr r1, _0234DD8C ; =0x00001004
	add r0, sb, #0x400
	strh r1, [r0, #0x64]
	cmp r4, #0
	beq _0234DCDC
	ldr r0, _0234DD88 ; =ov29_02382800
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0, #0x64]
	orr r1, r1, #0x2000
	strh r1, [r0, #0x64]
_0234DCDC:
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	beq _0234DD24
	cmp r5, #0
	beq _0234DD0C
	ldr r0, _0234DD88 ; =ov29_02382800
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0, #0x64]
	orr r1, r1, #8
	strh r1, [r0, #0x64]
	b _0234DD24
_0234DD0C:
	ldr r0, _0234DD88 ; =ov29_02382800
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0, #0x64]
	orr r1, r1, #0x18
	strh r1, [r0, #0x64]
_0234DD24:
	cmp r5, #0
	beq _0234DD64
	ldr r1, _0234DD88 ; =ov29_02382800
	mov r2, #1
	ldr r0, [r1]
	strb r2, [r0, #0x466]
	ldrb r2, [r5, #1]
	ldr r0, [r1]
	strb r2, [r0, #0x467]
	ldr r0, [r1]
	ldrsh r2, [r5, #2]
	add r0, r0, #0x400
	strh r2, [r0, #0x68]
	ldr r2, [r5, #4]
	ldr r0, [r1]
	str r2, [r0, #0x470]
_0234DD64:
	ldr r0, _0234DD88 ; =ov29_02382800
	mov r2, r7
	ldr r0, [r0]
	mov r3, r6
	add r1, r0, #0x400
	ldrsb r0, [r0, #0x10]
	ldrh r1, [r1, #0x64]
	bl sub_0202F23C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_0234DD88: .word ov29_02382800
_0234DD8C: .word 0x00001004
	arm_func_end ov29_0234DC3C

	arm_func_start ov29_0234DD90
ov29_0234DD90: ; 0x0234DD90
	ldr ip, _0234DD9C ; =LoadOverlay
	mov r0, #0x22
	bx ip
	.align 2, 0
_0234DD9C: .word LoadOverlay
	arm_func_end ov29_0234DD90

	arm_func_start ov29_0234DDA0
ov29_0234DDA0: ; 0x0234DDA0
	ldr ip, _0234DDAC ; =OverlayIsLoaded
	mov r0, #0x22
	bx ip
	.align 2, 0
_0234DDAC: .word OverlayIsLoaded
	arm_func_end ov29_0234DDA0

	arm_func_start ov29_0234DDB0
ov29_0234DDB0: ; 0x0234DDB0
	stmdb sp!, {r3, lr}
	mov r0, #0x22
	bl OverlayIsLoaded
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x22
	bl UnloadOverlay
	ldmia sp!, {r3, pc}
	arm_func_end ov29_0234DDB0
