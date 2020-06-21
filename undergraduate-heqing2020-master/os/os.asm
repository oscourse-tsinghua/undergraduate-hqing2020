
target/riscv32-os/release/os:     file format elf32-littleriscv


Disassembly of section .text:

fc400000 <_start>:
fc400000:	fc40e137          	lui	sp,0xfc40e
fc400004:	fc4042b7          	lui	t0,0xfc404
fc400008:	ec828293          	addi	t0,t0,-312 # fc403ec8 <ebss+0xfffe4e28>
fc40000c:	00028067          	jr	t0

fc400010 <print_uint32>:
fc400010:	f00005b7          	lui	a1,0xf0000
fc400014:	00100893          	li	a7,1
fc400018:	00800313          	li	t1,8
fc40001c:	00100393          	li	t2,1

fc400020 <loop>:
fc400020:	00d5f533          	and	a0,a1,a3
fc400024:	01c55513          	srli	a0,a0,0x1c
fc400028:	03050513          	addi	a0,a0,48
fc40002c:	00000073          	ecall
fc400030:	00469693          	slli	a3,a3,0x4
fc400034:	40730333          	sub	t1,t1,t2
fc400038:	fe0314e3          	bnez	t1,fc400020 <loop>
fc40003c:	00008067          	ret

fc400040 <_ZN2os6memory4init17h83fdcd4a151097b4E>:
fc400040:	fa010113          	addi	sp,sp,-96 # fc40dfa0 <ebss+0xfffeef00>
fc400044:	04112e23          	sw	ra,92(sp)
fc400048:	04812c23          	sw	s0,88(sp)
fc40004c:	04912a23          	sw	s1,84(sp)
fc400050:	05212823          	sw	s2,80(sp)
fc400054:	05312623          	sw	s3,76(sp)
fc400058:	06010413          	addi	s0,sp,96
fc40005c:	00058613          	mv	a2,a1
fc400060:	00050593          	mv	a1,a0
fc400064:	fc41e4b7          	lui	s1,0xfc41e
fc400068:	09048513          	addi	a0,s1,144 # fc41e090 <ebss+0xffffeff0>
fc40006c:	ffc57693          	andi	a3,a0,-4
fc400070:	0ff00913          	li	s2,255
fc400074:	00100993          	li	s3,1
fc400078:	1406a72f          	lr.w.aq	a4,(a3)
fc40007c:	012777b3          	and	a5,a4,s2
fc400080:	00079c63          	bnez	a5,fc400098 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x58>
fc400084:	013747b3          	xor	a5,a4,s3
fc400088:	0127f7b3          	and	a5,a5,s2
fc40008c:	00f747b3          	xor	a5,a4,a5
fc400090:	18f6a7af          	sc.w	a5,a5,(a3)
fc400094:	fe0792e3          	bnez	a5,fc400078 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x38>
fc400098:	0ff77713          	andi	a4,a4,255
fc40009c:	00070a63          	beqz	a4,fc4000b0 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x70>
fc4000a0:	09048703          	lb	a4,144(s1)
fc4000a4:	0ff77713          	andi	a4,a4,255
fc4000a8:	fe071ce3          	bnez	a4,fc4000a0 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x60>
fc4000ac:	fcdff06f          	j	fc400078 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x38>
fc4000b0:	00450513          	addi	a0,a0,4
fc4000b4:	00000097          	auipc	ra,0x0
fc4000b8:	188080e7          	jalr	392(ra) # fc40023c <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E>
fc4000bc:	0310000f          	fence	rw,w
fc4000c0:	08048823          	sb	zero,144(s1)
fc4000c4:	fc41e537          	lui	a0,0xfc41e
fc4000c8:	00050513          	mv	a0,a0
fc4000cc:	00001097          	auipc	ra,0x1
fc4000d0:	a38080e7          	jalr	-1480(ra) # fc400b04 <_ZN78_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..ops..deref..Deref$GT$5deref17h0da6bd18818544bdE>
fc4000d4:	00050493          	mv	s1,a0
fc4000d8:	00351513          	slli	a0,a0,0x3
fc4000dc:	01857613          	andi	a2,a0,24
fc4000e0:	00c915b3          	sll	a1,s2,a2
fc4000e4:	00c996b3          	sll	a3,s3,a2
fc4000e8:	ffc4f513          	andi	a0,s1,-4
fc4000ec:	1405272f          	lr.w.aq	a4,(a0)
fc4000f0:	00b777b3          	and	a5,a4,a1
fc4000f4:	00079c63          	bnez	a5,fc40010c <_ZN2os6memory4init17h83fdcd4a151097b4E+0xcc>
fc4000f8:	00d747b3          	xor	a5,a4,a3
fc4000fc:	00b7f7b3          	and	a5,a5,a1
fc400100:	00f747b3          	xor	a5,a4,a5
fc400104:	18f527af          	sc.w	a5,a5,(a0)
fc400108:	fe0792e3          	bnez	a5,fc4000ec <_ZN2os6memory4init17h83fdcd4a151097b4E+0xac>
fc40010c:	00b775b3          	and	a1,a4,a1
fc400110:	04058463          	beqz	a1,fc400158 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x118>
fc400114:	0ff00593          	li	a1,255
fc400118:	00c595b3          	sll	a1,a1,a2
fc40011c:	00100693          	li	a3,1
fc400120:	00c69633          	sll	a2,a3,a2
fc400124:	00048683          	lb	a3,0(s1)
fc400128:	0ff6f693          	andi	a3,a3,255
fc40012c:	fe069ce3          	bnez	a3,fc400124 <_ZN2os6memory4init17h83fdcd4a151097b4E+0xe4>
fc400130:	140526af          	lr.w.aq	a3,(a0)
fc400134:	00b6f733          	and	a4,a3,a1
fc400138:	00071c63          	bnez	a4,fc400150 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x110>
fc40013c:	00c6c733          	xor	a4,a3,a2
fc400140:	00b77733          	and	a4,a4,a1
fc400144:	00e6c733          	xor	a4,a3,a4
fc400148:	18e5272f          	sc.w	a4,a4,(a0)
fc40014c:	fe0712e3          	bnez	a4,fc400130 <_ZN2os6memory4init17h83fdcd4a151097b4E+0xf0>
fc400150:	00b6f6b3          	and	a3,a3,a1
fc400154:	fc0698e3          	bnez	a3,fc400124 <_ZN2os6memory4init17h83fdcd4a151097b4E+0xe4>
fc400158:	fc40e537          	lui	a0,0xfc40e
fc40015c:	00050593          	mv	a1,a0
fc400160:	00448513          	addi	a0,s1,4
fc400164:	00010637          	lui	a2,0x10
fc400168:	00000097          	auipc	ra,0x0
fc40016c:	7e8080e7          	jalr	2024(ra) # fc400950 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E>
fc400170:	0310000f          	fence	rw,w
fc400174:	00048023          	sb	zero,0(s1)
fc400178:	fc402537          	lui	a0,0xfc402
fc40017c:	dfc50513          	addi	a0,a0,-516 # fc401dfc <ebss+0xfffe2d5c>
fc400180:	faa42623          	sw	a0,-84(s0)
fc400184:	fb040513          	addi	a0,s0,-80
fc400188:	faa42423          	sw	a0,-88(s0)
fc40018c:	00400513          	li	a0,4
fc400190:	fca42023          	sw	a0,-64(s0)
fc400194:	fc406537          	lui	a0,0xfc406
fc400198:	02c50513          	addi	a0,a0,44 # fc40602c <ebss+0xfffe6f8c>
fc40019c:	faa42823          	sw	a0,-80(s0)
fc4001a0:	fc042223          	sw	zero,-60(s0)
fc4001a4:	fa042c23          	sw	zero,-72(s0)
fc4001a8:	00100513          	li	a0,1
fc4001ac:	faa42a23          	sw	a0,-76(s0)
fc4001b0:	fd040593          	addi	a1,s0,-48
fc4001b4:	fcb42623          	sw	a1,-52(s0)
fc4001b8:	fea42223          	sw	a0,-28(s0)
fc4001bc:	fa840513          	addi	a0,s0,-88
fc4001c0:	fea42023          	sw	a0,-32(s0)
fc4001c4:	00200513          	li	a0,2
fc4001c8:	fca42a23          	sw	a0,-44(s0)
fc4001cc:	fc406537          	lui	a0,0xfc406
fc4001d0:	00450513          	addi	a0,a0,4 # fc406004 <ebss+0xfffe6f64>
fc4001d4:	fca42823          	sw	a0,-48(s0)
fc4001d8:	fc406537          	lui	a0,0xfc406
fc4001dc:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc4001e0:	fc042c23          	sw	zero,-40(s0)
fc4001e4:	fcc40513          	addi	a0,s0,-52
fc4001e8:	fd040613          	addi	a2,s0,-48
fc4001ec:	00002097          	auipc	ra,0x2
fc4001f0:	c7c080e7          	jalr	-900(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc4001f4:	02051063          	bnez	a0,fc400214 <_ZN2os6memory4init17h83fdcd4a151097b4E+0x1d4>
fc4001f8:	04c12983          	lw	s3,76(sp)
fc4001fc:	05012903          	lw	s2,80(sp)
fc400200:	05412483          	lw	s1,84(sp)
fc400204:	05812403          	lw	s0,88(sp)
fc400208:	05c12083          	lw	ra,92(sp)
fc40020c:	06010113          	addi	sp,sp,96
fc400210:	00008067          	ret
fc400214:	fc406537          	lui	a0,0xfc406
fc400218:	11450513          	addi	a0,a0,276 # fc406114 <ebss+0xfffe7074>
fc40021c:	fc4065b7          	lui	a1,0xfc406
fc400220:	14058693          	addi	a3,a1,320 # fc406140 <ebss+0xfffe70a0>
fc400224:	fd040613          	addi	a2,s0,-48
fc400228:	02b00593          	li	a1,43
fc40022c:	00001097          	auipc	ra,0x1
fc400230:	fdc080e7          	jalr	-36(ra) # fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>
fc400234:	00000097          	auipc	ra,0x0
fc400238:	284080e7          	jalr	644(ra) # fc4004b8 <abort>

fc40023c <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E>:
fc40023c:	ff010113          	addi	sp,sp,-16
fc400240:	00112623          	sw	ra,12(sp)
fc400244:	00812423          	sw	s0,8(sp)
fc400248:	01010413          	addi	s0,sp,16
fc40024c:	fff58693          	addi	a3,a1,-1
fc400250:	00d52423          	sw	a3,8(a0)
fc400254:	40b608b3          	sub	a7,a2,a1
fc400258:	01152223          	sw	a7,4(a0)
fc40025c:	00100393          	li	t2,1
fc400260:	00288713          	addi	a4,a7,2
fc400264:	00038693          	mv	a3,t2
fc400268:	00139393          	slli	t2,t2,0x1
fc40026c:	fee6ece3          	bltu	a3,a4,fc400264 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x28>
fc400270:	00d52023          	sw	a3,0(a0)
fc400274:	02038a63          	beqz	t2,fc4002a8 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x6c>
fc400278:	00d50813          	addi	a6,a0,13
fc40027c:	00001737          	lui	a4,0x1
fc400280:	fff70313          	addi	t1,a4,-1 # fff <XLENB+0xffb>
fc400284:	00100293          	li	t0,1
fc400288:	00000713          	li	a4,0
fc40028c:	0c670063          	beq	a4,t1,fc40034c <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x110>
fc400290:	00e807b3          	add	a5,a6,a4
fc400294:	00578023          	sb	t0,0(a5)
fc400298:	00170793          	addi	a5,a4,1
fc40029c:	00270e13          	addi	t3,a4,2
fc4002a0:	00078713          	mv	a4,a5
fc4002a4:	fe7e64e3          	bltu	t3,t2,fc40028c <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x50>
fc4002a8:	00200813          	li	a6,2
fc4002ac:	0308ec63          	bltu	a7,a6,fc4002e4 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0xa8>
fc4002b0:	fff5c593          	not	a1,a1
fc4002b4:	00c588b3          	add	a7,a1,a2
fc4002b8:	00d50713          	addi	a4,a0,13
fc4002bc:	00000793          	li	a5,0
fc4002c0:	00f686b3          	add	a3,a3,a5
fc4002c4:	00168593          	addi	a1,a3,1
fc4002c8:	00c5d613          	srli	a2,a1,0xc
fc4002cc:	0a061063          	bnez	a2,fc40036c <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x130>
fc4002d0:	00d705b3          	add	a1,a4,a3
fc4002d4:	00058023          	sb	zero,0(a1)
fc4002d8:	00052683          	lw	a3,0(a0)
fc4002dc:	00178793          	addi	a5,a5,1
fc4002e0:	fef890e3          	bne	a7,a5,fc4002c0 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x84>
fc4002e4:	0506ec63          	bltu	a3,a6,fc40033c <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x100>
fc4002e8:	00b68713          	addi	a4,a3,11
fc4002ec:	00169593          	slli	a1,a3,0x1
fc4002f0:	ffe58593          	addi	a1,a1,-2
fc4002f4:	00100813          	li	a6,1
fc4002f8:	00c5d613          	srli	a2,a1,0xc
fc4002fc:	08061663          	bnez	a2,fc400388 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x14c>
fc400300:	00158613          	addi	a2,a1,1
fc400304:	00c65793          	srli	a5,a2,0xc
fc400308:	08079e63          	bnez	a5,fc4003a4 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x168>
fc40030c:	ff470613          	addi	a2,a4,-12
fc400310:	00c65793          	srli	a5,a2,0xc
fc400314:	0a079863          	bnez	a5,fc4003c4 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0x188>
fc400318:	00b507b3          	add	a5,a0,a1
fc40031c:	00c7c683          	lbu	a3,12(a5)
fc400320:	00d7c783          	lbu	a5,13(a5)
fc400324:	00d7f6b3          	and	a3,a5,a3
fc400328:	00e507b3          	add	a5,a0,a4
fc40032c:	00d78023          	sb	a3,0(a5)
fc400330:	ffe58593          	addi	a1,a1,-2
fc400334:	fff70713          	addi	a4,a4,-1
fc400338:	fcc860e3          	bltu	a6,a2,fc4002f8 <_ZN2os6memory15frame_allocator20SegmentTreeAllocator4init17h432c517be66b1d84E+0xbc>
fc40033c:	00812403          	lw	s0,8(sp)
fc400340:	00c12083          	lw	ra,12(sp)
fc400344:	01010113          	addi	sp,sp,16
fc400348:	00008067          	ret
fc40034c:	fc406537          	lui	a0,0xfc406
fc400350:	06050513          	addi	a0,a0,96 # fc406060 <ebss+0xfffe6fc0>
fc400354:	000015b7          	lui	a1,0x1
fc400358:	00001637          	lui	a2,0x1
fc40035c:	00001097          	auipc	ra,0x1
fc400360:	dd8080e7          	jalr	-552(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc400364:	00000097          	auipc	ra,0x0
fc400368:	154080e7          	jalr	340(ra) # fc4004b8 <abort>
fc40036c:	fc406537          	lui	a0,0xfc406
fc400370:	07050513          	addi	a0,a0,112 # fc406070 <ebss+0xfffe6fd0>
fc400374:	00001637          	lui	a2,0x1
fc400378:	00001097          	auipc	ra,0x1
fc40037c:	dbc080e7          	jalr	-580(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc400380:	00000097          	auipc	ra,0x0
fc400384:	138080e7          	jalr	312(ra) # fc4004b8 <abort>
fc400388:	fc406537          	lui	a0,0xfc406
fc40038c:	08050513          	addi	a0,a0,128 # fc406080 <ebss+0xfffe6fe0>
fc400390:	00001637          	lui	a2,0x1
fc400394:	00001097          	auipc	ra,0x1
fc400398:	da0080e7          	jalr	-608(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc40039c:	00000097          	auipc	ra,0x0
fc4003a0:	11c080e7          	jalr	284(ra) # fc4004b8 <abort>
fc4003a4:	fc406537          	lui	a0,0xfc406
fc4003a8:	09050513          	addi	a0,a0,144 # fc406090 <ebss+0xfffe6ff0>
fc4003ac:	00060593          	mv	a1,a2
fc4003b0:	00001637          	lui	a2,0x1
fc4003b4:	00001097          	auipc	ra,0x1
fc4003b8:	d80080e7          	jalr	-640(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc4003bc:	00000097          	auipc	ra,0x0
fc4003c0:	0fc080e7          	jalr	252(ra) # fc4004b8 <abort>
fc4003c4:	fc406537          	lui	a0,0xfc406
fc4003c8:	0a050513          	addi	a0,a0,160 # fc4060a0 <ebss+0xfffe7000>
fc4003cc:	00060593          	mv	a1,a2
fc4003d0:	00001637          	lui	a2,0x1
fc4003d4:	00001097          	auipc	ra,0x1
fc4003d8:	d60080e7          	jalr	-672(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc4003dc:	00000097          	auipc	ra,0x0
fc4003e0:	0dc080e7          	jalr	220(ra) # fc4004b8 <abort>

fc4003e4 <rust_begin_unwind>:
fc4003e4:	fa010113          	addi	sp,sp,-96
fc4003e8:	04112e23          	sw	ra,92(sp)
fc4003ec:	04812c23          	sw	s0,88(sp)
fc4003f0:	06010413          	addi	s0,sp,96
fc4003f4:	faa42623          	sw	a0,-84(s0)
fc4003f8:	fc402537          	lui	a0,0xfc402
fc4003fc:	dfc50513          	addi	a0,a0,-516 # fc401dfc <ebss+0xfffe2d5c>
fc400400:	faa42a23          	sw	a0,-76(s0)
fc400404:	fb840513          	addi	a0,s0,-72
fc400408:	faa42823          	sw	a0,-80(s0)
fc40040c:	fd040513          	addi	a0,s0,-48
fc400410:	fca42423          	sw	a0,-56(s0)
fc400414:	fc406537          	lui	a0,0xfc406
fc400418:	0c450513          	addi	a0,a0,196 # fc4060c4 <ebss+0xfffe7024>
fc40041c:	faa42c23          	sw	a0,-72(s0)
fc400420:	fc400537          	lui	a0,0xfc400
fc400424:	4e050513          	addi	a0,a0,1248 # fc4004e0 <ebss+0xfffe1440>
fc400428:	fca42a23          	sw	a0,-44(s0)
fc40042c:	fac40513          	addi	a0,s0,-84
fc400430:	fca42823          	sw	a0,-48(s0)
fc400434:	00100513          	li	a0,1
fc400438:	fca42623          	sw	a0,-52(s0)
fc40043c:	fc042023          	sw	zero,-64(s0)
fc400440:	faa42e23          	sw	a0,-68(s0)
fc400444:	fe040593          	addi	a1,s0,-32
fc400448:	fcb42e23          	sw	a1,-36(s0)
fc40044c:	fea42a23          	sw	a0,-12(s0)
fc400450:	fb040513          	addi	a0,s0,-80
fc400454:	fea42823          	sw	a0,-16(s0)
fc400458:	00200513          	li	a0,2
fc40045c:	fea42223          	sw	a0,-28(s0)
fc400460:	fc406537          	lui	a0,0xfc406
fc400464:	0b450513          	addi	a0,a0,180 # fc4060b4 <ebss+0xfffe7014>
fc400468:	fea42023          	sw	a0,-32(s0)
fc40046c:	fc406537          	lui	a0,0xfc406
fc400470:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc400474:	fe042423          	sw	zero,-24(s0)
fc400478:	fdc40513          	addi	a0,s0,-36
fc40047c:	fe040613          	addi	a2,s0,-32
fc400480:	00002097          	auipc	ra,0x2
fc400484:	9e8080e7          	jalr	-1560(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc400488:	00051463          	bnez	a0,fc400490 <rust_begin_unwind+0xac>
fc40048c:	0000006f          	j	fc40048c <rust_begin_unwind+0xa8>
fc400490:	fc406537          	lui	a0,0xfc406
fc400494:	11450513          	addi	a0,a0,276 # fc406114 <ebss+0xfffe7074>
fc400498:	fc4065b7          	lui	a1,0xfc406
fc40049c:	14058693          	addi	a3,a1,320 # fc406140 <ebss+0xfffe70a0>
fc4004a0:	fe040613          	addi	a2,s0,-32
fc4004a4:	02b00593          	li	a1,43
fc4004a8:	00001097          	auipc	ra,0x1
fc4004ac:	d60080e7          	jalr	-672(ra) # fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>
fc4004b0:	00000097          	auipc	ra,0x0
fc4004b4:	008080e7          	jalr	8(ra) # fc4004b8 <abort>

fc4004b8 <abort>:
fc4004b8:	ff010113          	addi	sp,sp,-16
fc4004bc:	00112623          	sw	ra,12(sp)
fc4004c0:	00812423          	sw	s0,8(sp)
fc4004c4:	01010413          	addi	s0,sp,16
fc4004c8:	fc406537          	lui	a0,0xfc406
fc4004cc:	0e450513          	addi	a0,a0,228 # fc4060e4 <ebss+0xfffe7044>
fc4004d0:	00001097          	auipc	ra,0x1
fc4004d4:	bec080e7          	jalr	-1044(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc4004d8:	00000097          	auipc	ra,0x0
fc4004dc:	fe0080e7          	jalr	-32(ra) # fc4004b8 <abort>

fc4004e0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h122de1a1e16e0895E>:
fc4004e0:	ff010113          	addi	sp,sp,-16
fc4004e4:	00112623          	sw	ra,12(sp)
fc4004e8:	00812423          	sw	s0,8(sp)
fc4004ec:	01010413          	addi	s0,sp,16
fc4004f0:	00052503          	lw	a0,0(a0)
fc4004f4:	00812403          	lw	s0,8(sp)
fc4004f8:	00c12083          	lw	ra,12(sp)
fc4004fc:	01010113          	addi	sp,sp,16
fc400500:	00001317          	auipc	t1,0x1
fc400504:	a4030067          	jr	-1472(t1) # fc400f40 <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hff8798dffae81b49E>

fc400508 <_ZN4core3ptr18real_drop_in_place17h26a7c1223dabf49eE>:
fc400508:	ff010113          	addi	sp,sp,-16
fc40050c:	00112623          	sw	ra,12(sp)
fc400510:	00812423          	sw	s0,8(sp)
fc400514:	01010413          	addi	s0,sp,16
fc400518:	00812403          	lw	s0,8(sp)
fc40051c:	00c12083          	lw	ra,12(sp)
fc400520:	01010113          	addi	sp,sp,16
fc400524:	00008067          	ret

fc400528 <_ZN4core3ptr18real_drop_in_place17hf1d12bec331c43e8E>:
fc400528:	ff010113          	addi	sp,sp,-16
fc40052c:	00112623          	sw	ra,12(sp)
fc400530:	00812423          	sw	s0,8(sp)
fc400534:	01010413          	addi	s0,sp,16
fc400538:	00812403          	lw	s0,8(sp)
fc40053c:	00c12083          	lw	ra,12(sp)
fc400540:	01010113          	addi	sp,sp,16
fc400544:	00008067          	ret

fc400548 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E>:
fc400548:	ff010113          	addi	sp,sp,-16
fc40054c:	00112623          	sw	ra,12(sp)
fc400550:	00812423          	sw	s0,8(sp)
fc400554:	01010413          	addi	s0,sp,16
fc400558:	fe042a23          	sw	zero,-12(s0)
fc40055c:	08000513          	li	a0,128
fc400560:	00a5f663          	bgeu	a1,a0,fc40056c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x24>
fc400564:	00100513          	li	a0,1
fc400568:	09c0006f          	j	fc400604 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0xbc>
fc40056c:	00b5d513          	srli	a0,a1,0xb
fc400570:	02051263          	bnez	a0,fc400594 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x4c>
fc400574:	03f5f513          	andi	a0,a1,63
fc400578:	08056513          	ori	a0,a0,128
fc40057c:	fea40aa3          	sb	a0,-11(s0)
fc400580:	00200513          	li	a0,2
fc400584:	0065d593          	srli	a1,a1,0x6
fc400588:	01f5f593          	andi	a1,a1,31
fc40058c:	fc05e593          	ori	a1,a1,-64
fc400590:	0740006f          	j	fc400604 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0xbc>
fc400594:	0105d513          	srli	a0,a1,0x10
fc400598:	02051a63          	bnez	a0,fc4005cc <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x84>
fc40059c:	03f5f513          	andi	a0,a1,63
fc4005a0:	08056513          	ori	a0,a0,128
fc4005a4:	fea40b23          	sb	a0,-10(s0)
fc4005a8:	0065d513          	srli	a0,a1,0x6
fc4005ac:	03f57513          	andi	a0,a0,63
fc4005b0:	08056513          	ori	a0,a0,128
fc4005b4:	fea40aa3          	sb	a0,-11(s0)
fc4005b8:	00300513          	li	a0,3
fc4005bc:	00c5d593          	srli	a1,a1,0xc
fc4005c0:	00f5f593          	andi	a1,a1,15
fc4005c4:	fe05e593          	ori	a1,a1,-32
fc4005c8:	03c0006f          	j	fc400604 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0xbc>
fc4005cc:	03f5f513          	andi	a0,a1,63
fc4005d0:	08056513          	ori	a0,a0,128
fc4005d4:	fea40ba3          	sb	a0,-9(s0)
fc4005d8:	0065d513          	srli	a0,a1,0x6
fc4005dc:	03f57513          	andi	a0,a0,63
fc4005e0:	08056513          	ori	a0,a0,128
fc4005e4:	fea40b23          	sb	a0,-10(s0)
fc4005e8:	00c5d513          	srli	a0,a1,0xc
fc4005ec:	03f57513          	andi	a0,a0,63
fc4005f0:	08056513          	ori	a0,a0,128
fc4005f4:	fea40aa3          	sb	a0,-11(s0)
fc4005f8:	00400513          	li	a0,4
fc4005fc:	0125d593          	srli	a1,a1,0x12
fc400600:	ff05e593          	ori	a1,a1,-16
fc400604:	feb40a23          	sb	a1,-12(s0)
fc400608:	ff440613          	addi	a2,s0,-12
fc40060c:	00a607b3          	add	a5,a2,a0
fc400610:	fff00e13          	li	t3,-1
fc400614:	0df00393          	li	t2,223
fc400618:	0f000813          	li	a6,240
fc40061c:	001c02b7          	lui	t0,0x1c0
fc400620:	00110337          	lui	t1,0x110
fc400624:	00100893          	li	a7,1
fc400628:	00160693          	addi	a3,a2,1 # 1001 <XLENB+0xffd>
fc40062c:	01859513          	slli	a0,a1,0x18
fc400630:	41855713          	srai	a4,a0,0x18
fc400634:	0ff5f513          	andi	a0,a1,255
fc400638:	0aee4663          	blt	t3,a4,fc4006e4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x19c>
fc40063c:	04f68463          	beq	a3,a5,fc400684 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x13c>
fc400640:	00260693          	addi	a3,a2,2
fc400644:	00164603          	lbu	a2,1(a2)
fc400648:	03f67613          	andi	a2,a2,63
fc40064c:	01f5f593          	andi	a1,a1,31
fc400650:	04a3f263          	bgeu	t2,a0,fc400694 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x14c>
fc400654:	04f68663          	beq	a3,a5,fc4006a0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x158>
fc400658:	00168713          	addi	a4,a3,1
fc40065c:	0006c683          	lbu	a3,0(a3)
fc400660:	03f6f693          	andi	a3,a3,63
fc400664:	00661613          	slli	a2,a2,0x6
fc400668:	00c6e633          	or	a2,a3,a2
fc40066c:	05056463          	bltu	a0,a6,fc4006b4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x16c>
fc400670:	04f70a63          	beq	a4,a5,fc4006c4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x17c>
fc400674:	00170693          	addi	a3,a4,1
fc400678:	00074503          	lbu	a0,0(a4)
fc40067c:	03f57513          	andi	a0,a0,63
fc400680:	04c0006f          	j	fc4006cc <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x184>
fc400684:	00078693          	mv	a3,a5
fc400688:	00000613          	li	a2,0
fc40068c:	01f5f593          	andi	a1,a1,31
fc400690:	fca3e2e3          	bltu	t2,a0,fc400654 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x10c>
fc400694:	00659513          	slli	a0,a1,0x6
fc400698:	00a66533          	or	a0,a2,a0
fc40069c:	0480006f          	j	fc4006e4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x19c>
fc4006a0:	00078713          	mv	a4,a5
fc4006a4:	00000693          	li	a3,0
fc4006a8:	00661613          	slli	a2,a2,0x6
fc4006ac:	00c6e633          	or	a2,a3,a2
fc4006b0:	fd0570e3          	bgeu	a0,a6,fc400670 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x128>
fc4006b4:	00c59513          	slli	a0,a1,0xc
fc4006b8:	00a66533          	or	a0,a2,a0
fc4006bc:	00070693          	mv	a3,a4
fc4006c0:	0240006f          	j	fc4006e4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x19c>
fc4006c4:	00078693          	mv	a3,a5
fc4006c8:	00000513          	li	a0,0
fc4006cc:	01259593          	slli	a1,a1,0x12
fc4006d0:	0055f5b3          	and	a1,a1,t0
fc4006d4:	00661613          	slli	a2,a2,0x6
fc4006d8:	00b665b3          	or	a1,a2,a1
fc4006dc:	00a5e533          	or	a0,a1,a0
fc4006e0:	02650263          	beq	a0,t1,fc400704 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x1bc>
fc4006e4:	0ff57513          	andi	a0,a0,255
fc4006e8:	00000593          	li	a1,0
fc4006ec:	00000613          	li	a2,0
fc4006f0:	00000073          	ecall
fc4006f4:	00f68863          	beq	a3,a5,fc400704 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0x1bc>
fc4006f8:	0006c583          	lbu	a1,0(a3)
fc4006fc:	00068613          	mv	a2,a3
fc400700:	f29ff06f          	j	fc400628 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h769770354e192f35E+0xe0>
fc400704:	00000513          	li	a0,0
fc400708:	00812403          	lw	s0,8(sp)
fc40070c:	00c12083          	lw	ra,12(sp)
fc400710:	01010113          	addi	sp,sp,16
fc400714:	00008067          	ret

fc400718 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17hb8d4d25c2e5c3fe6E>:
fc400718:	fd010113          	addi	sp,sp,-48
fc40071c:	02112623          	sw	ra,44(sp)
fc400720:	02812423          	sw	s0,40(sp)
fc400724:	03010413          	addi	s0,sp,48
fc400728:	00052503          	lw	a0,0(a0)
fc40072c:	fca42e23          	sw	a0,-36(s0)
fc400730:	0145a503          	lw	a0,20(a1)
fc400734:	fea42a23          	sw	a0,-12(s0)
fc400738:	0105a503          	lw	a0,16(a1)
fc40073c:	fea42823          	sw	a0,-16(s0)
fc400740:	00c5a503          	lw	a0,12(a1)
fc400744:	fea42623          	sw	a0,-20(s0)
fc400748:	0085a503          	lw	a0,8(a1)
fc40074c:	fea42423          	sw	a0,-24(s0)
fc400750:	0045a503          	lw	a0,4(a1)
fc400754:	fea42223          	sw	a0,-28(s0)
fc400758:	0005a503          	lw	a0,0(a1)
fc40075c:	fea42023          	sw	a0,-32(s0)
fc400760:	fc406537          	lui	a0,0xfc406
fc400764:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc400768:	fdc40513          	addi	a0,s0,-36
fc40076c:	fe040613          	addi	a2,s0,-32
fc400770:	00001097          	auipc	ra,0x1
fc400774:	6f8080e7          	jalr	1784(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc400778:	02812403          	lw	s0,40(sp)
fc40077c:	02c12083          	lw	ra,44(sp)
fc400780:	03010113          	addi	sp,sp,48
fc400784:	00008067          	ret

fc400788 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E>:
fc400788:	ff010113          	addi	sp,sp,-16
fc40078c:	00112623          	sw	ra,12(sp)
fc400790:	00812423          	sw	s0,8(sp)
fc400794:	01010413          	addi	s0,sp,16
fc400798:	10060463          	beqz	a2,fc4008a0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x118>
fc40079c:	00058693          	mv	a3,a1
fc4007a0:	00c587b3          	add	a5,a1,a2
fc4007a4:	fff00e13          	li	t3,-1
fc4007a8:	0df00813          	li	a6,223
fc4007ac:	0f000293          	li	t0,240
fc4007b0:	001c0337          	lui	t1,0x1c0
fc4007b4:	001103b7          	lui	t2,0x110
fc4007b8:	00100893          	li	a7,1
fc4007bc:	00168593          	addi	a1,a3,1
fc4007c0:	00068603          	lb	a2,0(a3)
fc4007c4:	0ff67513          	andi	a0,a2,255
fc4007c8:	02ce5663          	bge	t3,a2,fc4007f4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x6c>
fc4007cc:	00058693          	mv	a3,a1
fc4007d0:	0ff57513          	andi	a0,a0,255
fc4007d4:	00000593          	li	a1,0
fc4007d8:	00000613          	li	a2,0
fc4007dc:	00000073          	ecall
fc4007e0:	0cf68063          	beq	a3,a5,fc4008a0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x118>
fc4007e4:	00168593          	addi	a1,a3,1
fc4007e8:	00068603          	lb	a2,0(a3)
fc4007ec:	0ff67513          	andi	a0,a2,255
fc4007f0:	fcce4ee3          	blt	t3,a2,fc4007cc <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x44>
fc4007f4:	04f58663          	beq	a1,a5,fc400840 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0xb8>
fc4007f8:	00268713          	addi	a4,a3,2
fc4007fc:	0016c583          	lbu	a1,1(a3)
fc400800:	03f5f613          	andi	a2,a1,63
fc400804:	01f57593          	andi	a1,a0,31
fc400808:	04a87463          	bgeu	a6,a0,fc400850 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0xc8>
fc40080c:	04f70a63          	beq	a4,a5,fc400860 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0xd8>
fc400810:	00170693          	addi	a3,a4,1
fc400814:	00074703          	lbu	a4,0(a4)
fc400818:	03f77713          	andi	a4,a4,63
fc40081c:	00661613          	slli	a2,a2,0x6
fc400820:	00c76633          	or	a2,a4,a2
fc400824:	04556863          	bltu	a0,t0,fc400874 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0xec>
fc400828:	04f68c63          	beq	a3,a5,fc400880 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0xf8>
fc40082c:	00168713          	addi	a4,a3,1
fc400830:	0006c503          	lbu	a0,0(a3)
fc400834:	03f57513          	andi	a0,a0,63
fc400838:	00070693          	mv	a3,a4
fc40083c:	04c0006f          	j	fc400888 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x100>
fc400840:	00078713          	mv	a4,a5
fc400844:	00000613          	li	a2,0
fc400848:	01f57593          	andi	a1,a0,31
fc40084c:	fca860e3          	bltu	a6,a0,fc40080c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x84>
fc400850:	00659513          	slli	a0,a1,0x6
fc400854:	00a66533          	or	a0,a2,a0
fc400858:	00070693          	mv	a3,a4
fc40085c:	f75ff06f          	j	fc4007d0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x48>
fc400860:	00078693          	mv	a3,a5
fc400864:	00000713          	li	a4,0
fc400868:	00661613          	slli	a2,a2,0x6
fc40086c:	00c76633          	or	a2,a4,a2
fc400870:	fa557ce3          	bgeu	a0,t0,fc400828 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0xa0>
fc400874:	00c59513          	slli	a0,a1,0xc
fc400878:	00a66533          	or	a0,a2,a0
fc40087c:	f55ff06f          	j	fc4007d0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x48>
fc400880:	00078693          	mv	a3,a5
fc400884:	00000513          	li	a0,0
fc400888:	01259593          	slli	a1,a1,0x12
fc40088c:	0065f5b3          	and	a1,a1,t1
fc400890:	00661613          	slli	a2,a2,0x6
fc400894:	00b665b3          	or	a1,a2,a1
fc400898:	00a5e533          	or	a0,a1,a0
fc40089c:	f2751ae3          	bne	a0,t2,fc4007d0 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17h2047758d78f32b02E+0x48>
fc4008a0:	00000513          	li	a0,0
fc4008a4:	00812403          	lw	s0,8(sp)
fc4008a8:	00c12083          	lw	ra,12(sp)
fc4008ac:	01010113          	addi	sp,sp,16
fc4008b0:	00008067          	ret

fc4008b4 <_ZN2os2io6_print17h5deb1cd274d85726E>:
fc4008b4:	fd010113          	addi	sp,sp,-48
fc4008b8:	02112623          	sw	ra,44(sp)
fc4008bc:	02812423          	sw	s0,40(sp)
fc4008c0:	03010413          	addi	s0,sp,48
fc4008c4:	fe040593          	addi	a1,s0,-32
fc4008c8:	fcb42e23          	sw	a1,-36(s0)
fc4008cc:	01452583          	lw	a1,20(a0)
fc4008d0:	feb42a23          	sw	a1,-12(s0)
fc4008d4:	01052583          	lw	a1,16(a0)
fc4008d8:	feb42823          	sw	a1,-16(s0)
fc4008dc:	00c52583          	lw	a1,12(a0)
fc4008e0:	feb42623          	sw	a1,-20(s0)
fc4008e4:	00852583          	lw	a1,8(a0)
fc4008e8:	feb42423          	sw	a1,-24(s0)
fc4008ec:	00452583          	lw	a1,4(a0)
fc4008f0:	feb42223          	sw	a1,-28(s0)
fc4008f4:	00052503          	lw	a0,0(a0)
fc4008f8:	fea42023          	sw	a0,-32(s0)
fc4008fc:	fc406537          	lui	a0,0xfc406
fc400900:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc400904:	fdc40513          	addi	a0,s0,-36
fc400908:	fe040613          	addi	a2,s0,-32
fc40090c:	00001097          	auipc	ra,0x1
fc400910:	55c080e7          	jalr	1372(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc400914:	00051a63          	bnez	a0,fc400928 <_ZN2os2io6_print17h5deb1cd274d85726E+0x74>
fc400918:	02812403          	lw	s0,40(sp)
fc40091c:	02c12083          	lw	ra,44(sp)
fc400920:	03010113          	addi	sp,sp,48
fc400924:	00008067          	ret
fc400928:	fc406537          	lui	a0,0xfc406
fc40092c:	11450513          	addi	a0,a0,276 # fc406114 <ebss+0xfffe7074>
fc400930:	fc4065b7          	lui	a1,0xfc406
fc400934:	14058693          	addi	a3,a1,320 # fc406140 <ebss+0xfffe70a0>
fc400938:	fe040613          	addi	a2,s0,-32
fc40093c:	02b00593          	li	a1,43
fc400940:	00001097          	auipc	ra,0x1
fc400944:	8c8080e7          	jalr	-1848(ra) # fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>
fc400948:	00000097          	auipc	ra,0x0
fc40094c:	b70080e7          	jalr	-1168(ra) # fc4004b8 <abort>

fc400950 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E>:
fc400950:	ff010113          	addi	sp,sp,-16
fc400954:	00112623          	sw	ra,12(sp)
fc400958:	00812423          	sw	s0,8(sp)
fc40095c:	01010413          	addi	s0,sp,16
fc400960:	00b60633          	add	a2,a2,a1
fc400964:	ffc67e13          	andi	t3,a2,-4
fc400968:	00358593          	addi	a1,a1,3
fc40096c:	ffc5f693          	andi	a3,a1,-4
fc400970:	16de6e63          	bltu	t3,a3,fc400aec <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x19c>
fc400974:	00468593          	addi	a1,a3,4
fc400978:	00be7663          	bgeu	t3,a1,fc400984 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x34>
fc40097c:	00000793          	li	a5,0
fc400980:	1340006f          	j	fc400ab4 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x164>
fc400984:	01f00893          	li	a7,31
fc400988:	00100813          	li	a6,1
fc40098c:	555555b7          	lui	a1,0x55555
fc400990:	55558293          	addi	t0,a1,1365 # 55555555 <XLENB+0x55555551>
fc400994:	333335b7          	lui	a1,0x33333
fc400998:	33358e93          	addi	t4,a1,819 # 33333333 <XLENB+0x3333332f>
fc40099c:	0f0f15b7          	lui	a1,0xf0f1
fc4009a0:	f0f58313          	addi	t1,a1,-241 # f0f0f0f <XLENB+0xf0f0f0b>
fc4009a4:	010105b7          	lui	a1,0x1010
fc4009a8:	10158393          	addi	t2,a1,257 # 1010101 <XLENB+0x10100fd>
fc4009ac:	00000793          	li	a5,0
fc4009b0:	40d005b3          	neg	a1,a3
fc4009b4:	00b6f5b3          	and	a1,a3,a1
fc4009b8:	40de0633          	sub	a2,t3,a3
fc4009bc:	0a060c63          	beqz	a2,fc400a74 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x124>
fc4009c0:	00165713          	srli	a4,a2,0x1
fc4009c4:	00e66633          	or	a2,a2,a4
fc4009c8:	00265713          	srli	a4,a2,0x2
fc4009cc:	00e66633          	or	a2,a2,a4
fc4009d0:	00465713          	srli	a4,a2,0x4
fc4009d4:	00e66633          	or	a2,a2,a4
fc4009d8:	00865713          	srli	a4,a2,0x8
fc4009dc:	00e66633          	or	a2,a2,a4
fc4009e0:	01065713          	srli	a4,a2,0x10
fc4009e4:	00e66633          	or	a2,a2,a4
fc4009e8:	fff64613          	not	a2,a2
fc4009ec:	00165713          	srli	a4,a2,0x1
fc4009f0:	00577733          	and	a4,a4,t0
fc4009f4:	40e60633          	sub	a2,a2,a4
fc4009f8:	01d67733          	and	a4,a2,t4
fc4009fc:	00265613          	srli	a2,a2,0x2
fc400a00:	01d67633          	and	a2,a2,t4
fc400a04:	00c70633          	add	a2,a4,a2
fc400a08:	00465713          	srli	a4,a2,0x4
fc400a0c:	00e60633          	add	a2,a2,a4
fc400a10:	00667633          	and	a2,a2,t1
fc400a14:	02760633          	mul	a2,a2,t2
fc400a18:	01865613          	srli	a2,a2,0x18
fc400a1c:	40c88633          	sub	a2,a7,a2
fc400a20:	00c81633          	sll	a2,a6,a2
fc400a24:	00b66463          	bltu	a2,a1,fc400a2c <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0xdc>
fc400a28:	00058613          	mv	a2,a1
fc400a2c:	04060e63          	beqz	a2,fc400a88 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x138>
fc400a30:	fff60593          	addi	a1,a2,-1
fc400a34:	fff64713          	not	a4,a2
fc400a38:	00b775b3          	and	a1,a4,a1
fc400a3c:	0015d713          	srli	a4,a1,0x1
fc400a40:	00577733          	and	a4,a4,t0
fc400a44:	40e585b3          	sub	a1,a1,a4
fc400a48:	01d5f733          	and	a4,a1,t4
fc400a4c:	0025d593          	srli	a1,a1,0x2
fc400a50:	01d5f5b3          	and	a1,a1,t4
fc400a54:	00b705b3          	add	a1,a4,a1
fc400a58:	0045d713          	srli	a4,a1,0x4
fc400a5c:	00e585b3          	add	a1,a1,a4
fc400a60:	0065f5b3          	and	a1,a1,t1
fc400a64:	027585b3          	mul	a1,a1,t2
fc400a68:	0185d593          	srli	a1,a1,0x18
fc400a6c:	02b8f263          	bgeu	a7,a1,fc400a90 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x140>
fc400a70:	0600006f          	j	fc400ad0 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x180>
fc400a74:	02000613          	li	a2,32
fc400a78:	40c88633          	sub	a2,a7,a2
fc400a7c:	00c81633          	sll	a2,a6,a2
fc400a80:	fab674e3          	bgeu	a2,a1,fc400a28 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0xd8>
fc400a84:	fa9ff06f          	j	fc400a2c <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0xdc>
fc400a88:	02000593          	li	a1,32
fc400a8c:	04b8e263          	bltu	a7,a1,fc400ad0 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x180>
fc400a90:	00259593          	slli	a1,a1,0x2
fc400a94:	00b505b3          	add	a1,a0,a1
fc400a98:	0005a703          	lw	a4,0(a1)
fc400a9c:	00e6a023          	sw	a4,0(a3)
fc400aa0:	00d5a023          	sw	a3,0(a1)
fc400aa4:	00f607b3          	add	a5,a2,a5
fc400aa8:	00d606b3          	add	a3,a2,a3
fc400aac:	00468593          	addi	a1,a3,4
fc400ab0:	f0be70e3          	bgeu	t3,a1,fc4009b0 <_ZN22buddy_system_allocator4Heap4init17hc71f6d34527c4866E+0x60>
fc400ab4:	08852583          	lw	a1,136(a0)
fc400ab8:	00f585b3          	add	a1,a1,a5
fc400abc:	08b52423          	sw	a1,136(a0)
fc400ac0:	00812403          	lw	s0,8(sp)
fc400ac4:	00c12083          	lw	ra,12(sp)
fc400ac8:	01010113          	addi	sp,sp,16
fc400acc:	00008067          	ret
fc400ad0:	fc406537          	lui	a0,0xfc406
fc400ad4:	25850513          	addi	a0,a0,600 # fc406258 <ebss+0xfffe71b8>
fc400ad8:	02000613          	li	a2,32
fc400adc:	00000097          	auipc	ra,0x0
fc400ae0:	658080e7          	jalr	1624(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc400ae4:	00000097          	auipc	ra,0x0
fc400ae8:	9d4080e7          	jalr	-1580(ra) # fc4004b8 <abort>
fc400aec:	fc406537          	lui	a0,0xfc406
fc400af0:	1d850513          	addi	a0,a0,472 # fc4061d8 <ebss+0xfffe7138>
fc400af4:	00000097          	auipc	ra,0x0
fc400af8:	5c8080e7          	jalr	1480(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc400afc:	00000097          	auipc	ra,0x0
fc400b00:	9bc080e7          	jalr	-1604(ra) # fc4004b8 <abort>

fc400b04 <_ZN78_$LT$buddy_system_allocator..LockedHeap$u20$as$u20$core..ops..deref..Deref$GT$5deref17h0da6bd18818544bdE>:
fc400b04:	ff010113          	addi	sp,sp,-16
fc400b08:	00112623          	sw	ra,12(sp)
fc400b0c:	00812423          	sw	s0,8(sp)
fc400b10:	01010413          	addi	s0,sp,16
fc400b14:	00812403          	lw	s0,8(sp)
fc400b18:	00c12083          	lw	ra,12(sp)
fc400b1c:	01010113          	addi	sp,sp,16
fc400b20:	00008067          	ret

fc400b24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E>:
fc400b24:	f7010113          	addi	sp,sp,-144
fc400b28:	08112623          	sw	ra,140(sp)
fc400b2c:	08812423          	sw	s0,136(sp)
fc400b30:	09010413          	addi	s0,sp,144
fc400b34:	00058813          	mv	a6,a1
fc400b38:	00052503          	lw	a0,0(a0)
fc400b3c:	00a00713          	li	a4,10
fc400b40:	f7840693          	addi	a3,s0,-136
fc400b44:	00000613          	li	a2,0
fc400b48:	00f57793          	andi	a5,a0,15
fc400b4c:	02e7e263          	bltu	a5,a4,fc400b70 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E+0x4c>
fc400b50:	05778793          	addi	a5,a5,87
fc400b54:	00c685b3          	add	a1,a3,a2
fc400b58:	06f58fa3          	sb	a5,127(a1)
fc400b5c:	fff60613          	addi	a2,a2,-1
fc400b60:	00455513          	srli	a0,a0,0x4
fc400b64:	00050a63          	beqz	a0,fc400b78 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E+0x54>
fc400b68:	00f57793          	andi	a5,a0,15
fc400b6c:	fee7f2e3          	bgeu	a5,a4,fc400b50 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E+0x2c>
fc400b70:	0307e793          	ori	a5,a5,48
fc400b74:	fe1ff06f          	j	fc400b54 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E+0x30>
fc400b78:	08060513          	addi	a0,a2,128
fc400b7c:	08100593          	li	a1,129
fc400b80:	02b57e63          	bgeu	a0,a1,fc400bbc <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E+0x98>
fc400b84:	00c68533          	add	a0,a3,a2
fc400b88:	40c007b3          	neg	a5,a2
fc400b8c:	08050713          	addi	a4,a0,128
fc400b90:	fc406537          	lui	a0,0xfc406
fc400b94:	26850613          	addi	a2,a0,616 # fc406268 <ebss+0xfffe71c8>
fc400b98:	00080513          	mv	a0,a6
fc400b9c:	00100593          	li	a1,1
fc400ba0:	00200693          	li	a3,2
fc400ba4:	00001097          	auipc	ra,0x1
fc400ba8:	6b0080e7          	jalr	1712(ra) # fc402254 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE>
fc400bac:	08812403          	lw	s0,136(sp)
fc400bb0:	08c12083          	lw	ra,140(sp)
fc400bb4:	09010113          	addi	sp,sp,144
fc400bb8:	00008067          	ret
fc400bbc:	08000593          	li	a1,128
fc400bc0:	00001097          	auipc	ra,0x1
fc400bc4:	c8c080e7          	jalr	-884(ra) # fc40184c <_ZN4core5slice22slice_index_order_fail17hc299d5381b4697c1E>
fc400bc8:	00000097          	auipc	ra,0x0
fc400bcc:	8f0080e7          	jalr	-1808(ra) # fc4004b8 <abort>

fc400bd0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E>:
fc400bd0:	f7010113          	addi	sp,sp,-144
fc400bd4:	08112623          	sw	ra,140(sp)
fc400bd8:	08812423          	sw	s0,136(sp)
fc400bdc:	09010413          	addi	s0,sp,144
fc400be0:	00058813          	mv	a6,a1
fc400be4:	00052503          	lw	a0,0(a0)
fc400be8:	00a00713          	li	a4,10
fc400bec:	f7840693          	addi	a3,s0,-136
fc400bf0:	00000613          	li	a2,0
fc400bf4:	00f57793          	andi	a5,a0,15
fc400bf8:	02e7e263          	bltu	a5,a4,fc400c1c <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E+0x4c>
fc400bfc:	03778793          	addi	a5,a5,55
fc400c00:	00c685b3          	add	a1,a3,a2
fc400c04:	06f58fa3          	sb	a5,127(a1)
fc400c08:	fff60613          	addi	a2,a2,-1
fc400c0c:	00455513          	srli	a0,a0,0x4
fc400c10:	00050a63          	beqz	a0,fc400c24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E+0x54>
fc400c14:	00f57793          	andi	a5,a0,15
fc400c18:	fee7f2e3          	bgeu	a5,a4,fc400bfc <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E+0x2c>
fc400c1c:	0307e793          	ori	a5,a5,48
fc400c20:	fe1ff06f          	j	fc400c00 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E+0x30>
fc400c24:	08060513          	addi	a0,a2,128
fc400c28:	08100593          	li	a1,129
fc400c2c:	02b57e63          	bgeu	a0,a1,fc400c68 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E+0x98>
fc400c30:	00c68533          	add	a0,a3,a2
fc400c34:	40c007b3          	neg	a5,a2
fc400c38:	08050713          	addi	a4,a0,128
fc400c3c:	fc406537          	lui	a0,0xfc406
fc400c40:	26850613          	addi	a2,a0,616 # fc406268 <ebss+0xfffe71c8>
fc400c44:	00080513          	mv	a0,a6
fc400c48:	00100593          	li	a1,1
fc400c4c:	00200693          	li	a3,2
fc400c50:	00001097          	auipc	ra,0x1
fc400c54:	604080e7          	jalr	1540(ra) # fc402254 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE>
fc400c58:	08812403          	lw	s0,136(sp)
fc400c5c:	08c12083          	lw	ra,140(sp)
fc400c60:	09010113          	addi	sp,sp,144
fc400c64:	00008067          	ret
fc400c68:	08000593          	li	a1,128
fc400c6c:	00001097          	auipc	ra,0x1
fc400c70:	be0080e7          	jalr	-1056(ra) # fc40184c <_ZN4core5slice22slice_index_order_fail17hc299d5381b4697c1E>
fc400c74:	00000097          	auipc	ra,0x0
fc400c78:	844080e7          	jalr	-1980(ra) # fc4004b8 <abort>

fc400c7c <_ZN4core3ptr18real_drop_in_place17h6eba8ae9bfe89041E>:
fc400c7c:	ff010113          	addi	sp,sp,-16
fc400c80:	00112623          	sw	ra,12(sp)
fc400c84:	00812423          	sw	s0,8(sp)
fc400c88:	01010413          	addi	s0,sp,16
fc400c8c:	00812403          	lw	s0,8(sp)
fc400c90:	00c12083          	lw	ra,12(sp)
fc400c94:	01010113          	addi	sp,sp,16
fc400c98:	00008067          	ret

fc400c9c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E>:
fc400c9c:	f6010113          	addi	sp,sp,-160
fc400ca0:	08112e23          	sw	ra,156(sp)
fc400ca4:	08812c23          	sw	s0,152(sp)
fc400ca8:	08912a23          	sw	s1,148(sp)
fc400cac:	09212823          	sw	s2,144(sp)
fc400cb0:	09312623          	sw	s3,140(sp)
fc400cb4:	09412423          	sw	s4,136(sp)
fc400cb8:	0a010413          	addi	s0,sp,160
fc400cbc:	00058993          	mv	s3,a1
fc400cc0:	00050913          	mv	s2,a0
fc400cc4:	0005a583          	lw	a1,0(a1)
fc400cc8:	0105f513          	andi	a0,a1,16
fc400ccc:	02051663          	bnez	a0,fc400cf8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x5c>
fc400cd0:	00092503          	lw	a0,0(s2)
fc400cd4:	0205f593          	andi	a1,a1,32
fc400cd8:	06059063          	bnez	a1,fc400d38 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x9c>
fc400cdc:	00100493          	li	s1,1
fc400ce0:	00100593          	li	a1,1
fc400ce4:	00098613          	mv	a2,s3
fc400ce8:	00001097          	auipc	ra,0x1
fc400cec:	ec0080e7          	jalr	-320(ra) # fc401ba8 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110>
fc400cf0:	0c050063          	beqz	a0,fc400db0 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x114>
fc400cf4:	1e40006f          	j	fc400ed8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x23c>
fc400cf8:	00092503          	lw	a0,0(s2)
fc400cfc:	00a00693          	li	a3,10
fc400d00:	f6840613          	addi	a2,s0,-152
fc400d04:	00000593          	li	a1,0
fc400d08:	00f57713          	andi	a4,a0,15
fc400d0c:	02d76263          	bltu	a4,a3,fc400d30 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x94>
fc400d10:	05770713          	addi	a4,a4,87
fc400d14:	00b607b3          	add	a5,a2,a1
fc400d18:	06e78fa3          	sb	a4,127(a5)
fc400d1c:	fff58593          	addi	a1,a1,-1
fc400d20:	00455513          	srli	a0,a0,0x4
fc400d24:	04050863          	beqz	a0,fc400d74 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0xd8>
fc400d28:	00f57713          	andi	a4,a0,15
fc400d2c:	fed772e3          	bgeu	a4,a3,fc400d10 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x74>
fc400d30:	03076713          	ori	a4,a4,48
fc400d34:	fe1ff06f          	j	fc400d14 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x78>
fc400d38:	00a00693          	li	a3,10
fc400d3c:	f6840613          	addi	a2,s0,-152
fc400d40:	00000593          	li	a1,0
fc400d44:	00f57713          	andi	a4,a0,15
fc400d48:	02d76263          	bltu	a4,a3,fc400d6c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0xd0>
fc400d4c:	03770713          	addi	a4,a4,55
fc400d50:	00b607b3          	add	a5,a2,a1
fc400d54:	06e78fa3          	sb	a4,127(a5)
fc400d58:	fff58593          	addi	a1,a1,-1
fc400d5c:	00455513          	srli	a0,a0,0x4
fc400d60:	00050a63          	beqz	a0,fc400d74 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0xd8>
fc400d64:	00f57713          	andi	a4,a0,15
fc400d68:	fed772e3          	bgeu	a4,a3,fc400d4c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0xb0>
fc400d6c:	03076713          	ori	a4,a4,48
fc400d70:	fe1ff06f          	j	fc400d50 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0xb4>
fc400d74:	08058513          	addi	a0,a1,128
fc400d78:	08100693          	li	a3,129
fc400d7c:	18d57063          	bgeu	a0,a3,fc400efc <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x260>
fc400d80:	00b60533          	add	a0,a2,a1
fc400d84:	40b007b3          	neg	a5,a1
fc400d88:	08050713          	addi	a4,a0,128
fc400d8c:	fc406537          	lui	a0,0xfc406
fc400d90:	26850613          	addi	a2,a0,616 # fc406268 <ebss+0xfffe71c8>
fc400d94:	00100493          	li	s1,1
fc400d98:	00098513          	mv	a0,s3
fc400d9c:	00100593          	li	a1,1
fc400da0:	00200693          	li	a3,2
fc400da4:	00001097          	auipc	ra,0x1
fc400da8:	4b0080e7          	jalr	1200(ra) # fc402254 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE>
fc400dac:	12051663          	bnez	a0,fc400ed8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x23c>
fc400db0:	01c9a583          	lw	a1,28(s3)
fc400db4:	0189a503          	lw	a0,24(s3)
fc400db8:	00400613          	li	a2,4
fc400dbc:	f6c42c23          	sw	a2,-136(s0)
fc400dc0:	f6042e23          	sw	zero,-132(s0)
fc400dc4:	f6042823          	sw	zero,-144(s0)
fc400dc8:	fc406637          	lui	a2,0xfc406
fc400dcc:	33c60613          	addi	a2,a2,828 # fc40633c <ebss+0xfffe729c>
fc400dd0:	f6c42423          	sw	a2,-152(s0)
fc400dd4:	00100493          	li	s1,1
fc400dd8:	f6942623          	sw	s1,-148(s0)
fc400ddc:	f6840a13          	addi	s4,s0,-152
fc400de0:	000a0613          	mv	a2,s4
fc400de4:	00001097          	auipc	ra,0x1
fc400de8:	084080e7          	jalr	132(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc400dec:	0e051663          	bnez	a0,fc400ed8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x23c>
fc400df0:	0009a583          	lw	a1,0(s3)
fc400df4:	0105f513          	andi	a0,a1,16
fc400df8:	02051663          	bnez	a0,fc400e24 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x188>
fc400dfc:	00492503          	lw	a0,4(s2)
fc400e00:	0205f593          	andi	a1,a1,32
fc400e04:	04059e63          	bnez	a1,fc400e60 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1c4>
fc400e08:	00100593          	li	a1,1
fc400e0c:	00098613          	mv	a2,s3
fc400e10:	00001097          	auipc	ra,0x1
fc400e14:	d98080e7          	jalr	-616(ra) # fc401ba8 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110>
fc400e18:	00000493          	li	s1,0
fc400e1c:	0a051c63          	bnez	a0,fc400ed4 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x238>
fc400e20:	0b80006f          	j	fc400ed8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x23c>
fc400e24:	00492503          	lw	a0,4(s2)
fc400e28:	00a00613          	li	a2,10
fc400e2c:	00000593          	li	a1,0
fc400e30:	00f57693          	andi	a3,a0,15
fc400e34:	02c6e263          	bltu	a3,a2,fc400e58 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1bc>
fc400e38:	05768693          	addi	a3,a3,87
fc400e3c:	00ba0733          	add	a4,s4,a1
fc400e40:	06d70fa3          	sb	a3,127(a4)
fc400e44:	fff58593          	addi	a1,a1,-1
fc400e48:	00455513          	srli	a0,a0,0x4
fc400e4c:	04050663          	beqz	a0,fc400e98 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1fc>
fc400e50:	00f57693          	andi	a3,a0,15
fc400e54:	fec6f2e3          	bgeu	a3,a2,fc400e38 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x19c>
fc400e58:	0306e693          	ori	a3,a3,48
fc400e5c:	fe1ff06f          	j	fc400e3c <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1a0>
fc400e60:	00a00613          	li	a2,10
fc400e64:	00000593          	li	a1,0
fc400e68:	00f57693          	andi	a3,a0,15
fc400e6c:	02c6e263          	bltu	a3,a2,fc400e90 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1f4>
fc400e70:	03768693          	addi	a3,a3,55
fc400e74:	00ba0733          	add	a4,s4,a1
fc400e78:	06d70fa3          	sb	a3,127(a4)
fc400e7c:	fff58593          	addi	a1,a1,-1
fc400e80:	00455513          	srli	a0,a0,0x4
fc400e84:	00050a63          	beqz	a0,fc400e98 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1fc>
fc400e88:	00f57693          	andi	a3,a0,15
fc400e8c:	fec6f2e3          	bgeu	a3,a2,fc400e70 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1d4>
fc400e90:	0306e693          	ori	a3,a3,48
fc400e94:	fe1ff06f          	j	fc400e74 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x1d8>
fc400e98:	08058513          	addi	a0,a1,128
fc400e9c:	08100613          	li	a2,129
fc400ea0:	04c57e63          	bgeu	a0,a2,fc400efc <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x260>
fc400ea4:	00ba0533          	add	a0,s4,a1
fc400ea8:	40b007b3          	neg	a5,a1
fc400eac:	08050713          	addi	a4,a0,128
fc400eb0:	fc406537          	lui	a0,0xfc406
fc400eb4:	26850613          	addi	a2,a0,616 # fc406268 <ebss+0xfffe71c8>
fc400eb8:	00098513          	mv	a0,s3
fc400ebc:	00100593          	li	a1,1
fc400ec0:	00200693          	li	a3,2
fc400ec4:	00001097          	auipc	ra,0x1
fc400ec8:	390080e7          	jalr	912(ra) # fc402254 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE>
fc400ecc:	00000493          	li	s1,0
fc400ed0:	00050463          	beqz	a0,fc400ed8 <_ZN71_$LT$core..ops..range..Range$LT$Idx$GT$$u20$as$u20$core..fmt..Debug$GT$3fmt17h73e3b5817d007d79E+0x23c>
fc400ed4:	00100493          	li	s1,1
fc400ed8:	00048513          	mv	a0,s1
fc400edc:	08812a03          	lw	s4,136(sp)
fc400ee0:	08c12983          	lw	s3,140(sp)
fc400ee4:	09012903          	lw	s2,144(sp)
fc400ee8:	09412483          	lw	s1,148(sp)
fc400eec:	09812403          	lw	s0,152(sp)
fc400ef0:	09c12083          	lw	ra,156(sp)
fc400ef4:	0a010113          	addi	sp,sp,160
fc400ef8:	00008067          	ret
fc400efc:	08000593          	li	a1,128
fc400f00:	00001097          	auipc	ra,0x1
fc400f04:	94c080e7          	jalr	-1716(ra) # fc40184c <_ZN4core5slice22slice_index_order_fail17hc299d5381b4697c1E>
fc400f08:	fffff097          	auipc	ra,0xfffff
fc400f0c:	5b0080e7          	jalr	1456(ra) # fc4004b8 <abort>

fc400f10 <_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h423531606c6a3383E>:
fc400f10:	ff010113          	addi	sp,sp,-16
fc400f14:	00112623          	sw	ra,12(sp)
fc400f18:	00812423          	sw	s0,8(sp)
fc400f1c:	01010413          	addi	s0,sp,16
fc400f20:	11dcf537          	lui	a0,0x11dcf
fc400f24:	d0950513          	addi	a0,a0,-759 # 11dced09 <XLENB+0x11dced05>
fc400f28:	c5d0f5b7          	lui	a1,0xc5d0f
fc400f2c:	09558593          	addi	a1,a1,149 # c5d0f095 <ebss+0xc98efff5>
fc400f30:	00812403          	lw	s0,8(sp)
fc400f34:	00c12083          	lw	ra,12(sp)
fc400f38:	01010113          	addi	sp,sp,16
fc400f3c:	00008067          	ret

fc400f40 <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hff8798dffae81b49E>:
fc400f40:	fb010113          	addi	sp,sp,-80
fc400f44:	04112623          	sw	ra,76(sp)
fc400f48:	04812423          	sw	s0,72(sp)
fc400f4c:	04912223          	sw	s1,68(sp)
fc400f50:	05212023          	sw	s2,64(sp)
fc400f54:	03312e23          	sw	s3,60(sp)
fc400f58:	05010413          	addi	s0,sp,80
fc400f5c:	00058993          	mv	s3,a1
fc400f60:	00050913          	mv	s2,a0
fc400f64:	0185a503          	lw	a0,24(a1)
fc400f68:	01c5a583          	lw	a1,28(a1)
fc400f6c:	00c5a683          	lw	a3,12(a1)
fc400f70:	fc4065b7          	lui	a1,0xfc406
fc400f74:	35458593          	addi	a1,a1,852 # fc406354 <ebss+0xfffe72b4>
fc400f78:	00c00613          	li	a2,12
fc400f7c:	000680e7          	jalr	a3
fc400f80:	00100493          	li	s1,1
fc400f84:	10051c63          	bnez	a0,fc40109c <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hff8798dffae81b49E+0x15c>
fc400f88:	00892503          	lw	a0,8(s2)
fc400f8c:	00050a63          	beqz	a0,fc400fa0 <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hff8798dffae81b49E+0x60>
fc400f90:	faa42a23          	sw	a0,-76(s0)
fc400f94:	fc403537          	lui	a0,0xfc403
fc400f98:	02450513          	addi	a0,a0,36 # fc403024 <ebss+0xfffe3f84>
fc400f9c:	0440006f          	j	fc400fe0 <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hff8798dffae81b49E+0xa0>
fc400fa0:	00092483          	lw	s1,0(s2)
fc400fa4:	00492503          	lw	a0,4(s2)
fc400fa8:	00c52583          	lw	a1,12(a0)
fc400fac:	00048513          	mv	a0,s1
fc400fb0:	000580e7          	jalr	a1
fc400fb4:	11109637          	lui	a2,0x11109
fc400fb8:	4d960613          	addi	a2,a2,1241 # 111094d9 <XLENB+0x111094d5>
fc400fbc:	00c5c5b3          	xor	a1,a1,a2
fc400fc0:	70b09637          	lui	a2,0x70b09
fc400fc4:	76460613          	addi	a2,a2,1892 # 70b09764 <XLENB+0x70b09760>
fc400fc8:	00c54533          	xor	a0,a0,a2
fc400fcc:	00b56533          	or	a0,a0,a1
fc400fd0:	04051e63          	bnez	a0,fc40102c <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hff8798dffae81b49E+0xec>
fc400fd4:	fa942a23          	sw	s1,-76(s0)
fc400fd8:	fc403537          	lui	a0,0xfc403
fc400fdc:	09450513          	addi	a0,a0,148 # fc403094 <ebss+0xfffe3ff4>
fc400fe0:	faa42e23          	sw	a0,-68(s0)
fc400fe4:	fb440513          	addi	a0,s0,-76
fc400fe8:	faa42c23          	sw	a0,-72(s0)
fc400fec:	01c9a583          	lw	a1,28(s3)
fc400ff0:	0189a503          	lw	a0,24(s3)
fc400ff4:	fb840613          	addi	a2,s0,-72
fc400ff8:	fec42023          	sw	a2,-32(s0)
fc400ffc:	fc042c23          	sw	zero,-40(s0)
fc401000:	00200613          	li	a2,2
fc401004:	fcc42a23          	sw	a2,-44(s0)
fc401008:	fc406637          	lui	a2,0xfc406
fc40100c:	36460613          	addi	a2,a2,868 # fc406364 <ebss+0xfffe72c4>
fc401010:	fcc42823          	sw	a2,-48(s0)
fc401014:	00100493          	li	s1,1
fc401018:	fe942223          	sw	s1,-28(s0)
fc40101c:	fd040613          	addi	a2,s0,-48
fc401020:	00001097          	auipc	ra,0x1
fc401024:	e48080e7          	jalr	-440(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc401028:	06051a63          	bnez	a0,fc40109c <_ZN61_$LT$core..panic..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hff8798dffae81b49E+0x15c>
fc40102c:	01890513          	addi	a0,s2,24
fc401030:	fca42423          	sw	a0,-56(s0)
fc401034:	fc402537          	lui	a0,0xfc402
fc401038:	d7c50513          	addi	a0,a0,-644 # fc401d7c <ebss+0xfffe2cdc>
fc40103c:	fca42623          	sw	a0,-52(s0)
fc401040:	fca42223          	sw	a0,-60(s0)
fc401044:	01490513          	addi	a0,s2,20
fc401048:	fca42023          	sw	a0,-64(s0)
fc40104c:	fc403537          	lui	a0,0xfc403
fc401050:	ff050513          	addi	a0,a0,-16 # fc402ff0 <ebss+0xfffe3f50>
fc401054:	faa42e23          	sw	a0,-68(s0)
fc401058:	00c90513          	addi	a0,s2,12
fc40105c:	faa42c23          	sw	a0,-72(s0)
fc401060:	01c9a583          	lw	a1,28(s3)
fc401064:	0189a503          	lw	a0,24(s3)
fc401068:	fb840613          	addi	a2,s0,-72
fc40106c:	fec42023          	sw	a2,-32(s0)
fc401070:	fc042c23          	sw	zero,-40(s0)
fc401074:	00300613          	li	a2,3
fc401078:	fec42223          	sw	a2,-28(s0)
fc40107c:	fcc42a23          	sw	a2,-44(s0)
fc401080:	fc406637          	lui	a2,0xfc406
fc401084:	37860613          	addi	a2,a2,888 # fc406378 <ebss+0xfffe72d8>
fc401088:	fcc42823          	sw	a2,-48(s0)
fc40108c:	fd040613          	addi	a2,s0,-48
fc401090:	00001097          	auipc	ra,0x1
fc401094:	dd8080e7          	jalr	-552(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc401098:	00050493          	mv	s1,a0
fc40109c:	00048513          	mv	a0,s1
fc4010a0:	03c12983          	lw	s3,60(sp)
fc4010a4:	04012903          	lw	s2,64(sp)
fc4010a8:	04412483          	lw	s1,68(sp)
fc4010ac:	04812403          	lw	s0,72(sp)
fc4010b0:	04c12083          	lw	ra,76(sp)
fc4010b4:	05010113          	addi	sp,sp,80
fc4010b8:	00008067          	ret

fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>:
fc4010bc:	fc010113          	addi	sp,sp,-64
fc4010c0:	02112e23          	sw	ra,60(sp)
fc4010c4:	02812c23          	sw	s0,56(sp)
fc4010c8:	04010413          	addi	s0,sp,64
fc4010cc:	00852803          	lw	a6,8(a0)
fc4010d0:	00c52603          	lw	a2,12(a0)
fc4010d4:	01052683          	lw	a3,16(a0)
fc4010d8:	01452703          	lw	a4,20(a0)
fc4010dc:	00052783          	lw	a5,0(a0)
fc4010e0:	00452503          	lw	a0,4(a0)
fc4010e4:	00400593          	li	a1,4
fc4010e8:	fcb42c23          	sw	a1,-40(s0)
fc4010ec:	fc042e23          	sw	zero,-36(s0)
fc4010f0:	fc042823          	sw	zero,-48(s0)
fc4010f4:	00100593          	li	a1,1
fc4010f8:	fcb42623          	sw	a1,-52(s0)
fc4010fc:	fe040593          	addi	a1,s0,-32
fc401100:	fcb42423          	sw	a1,-56(s0)
fc401104:	fea42223          	sw	a0,-28(s0)
fc401108:	fef42023          	sw	a5,-32(s0)
fc40110c:	fee42a23          	sw	a4,-12(s0)
fc401110:	fed42823          	sw	a3,-16(s0)
fc401114:	fec42623          	sw	a2,-20(s0)
fc401118:	ff042423          	sw	a6,-24(s0)
fc40111c:	fc840513          	addi	a0,s0,-56
fc401120:	fe840593          	addi	a1,s0,-24
fc401124:	00000097          	auipc	ra,0x0
fc401128:	088080e7          	jalr	136(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc40112c:	fffff097          	auipc	ra,0xfffff
fc401130:	38c080e7          	jalr	908(ra) # fc4004b8 <abort>

fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>:
fc401134:	fc010113          	addi	sp,sp,-64
fc401138:	02112e23          	sw	ra,60(sp)
fc40113c:	02812c23          	sw	s0,56(sp)
fc401140:	04010413          	addi	s0,sp,64
fc401144:	00050693          	mv	a3,a0
fc401148:	fcc42623          	sw	a2,-52(s0)
fc40114c:	fcb42423          	sw	a1,-56(s0)
fc401150:	fe840513          	addi	a0,s0,-24
fc401154:	fea42023          	sw	a0,-32(s0)
fc401158:	fc042c23          	sw	zero,-40(s0)
fc40115c:	00200513          	li	a0,2
fc401160:	fea42223          	sw	a0,-28(s0)
fc401164:	fca42a23          	sw	a0,-44(s0)
fc401168:	fc406537          	lui	a0,0xfc406
fc40116c:	3c450513          	addi	a0,a0,964 # fc4063c4 <ebss+0xfffe7324>
fc401170:	fca42823          	sw	a0,-48(s0)
fc401174:	fc840513          	addi	a0,s0,-56
fc401178:	fea42823          	sw	a0,-16(s0)
fc40117c:	fc402537          	lui	a0,0xfc402
fc401180:	d7c50513          	addi	a0,a0,-644 # fc401d7c <ebss+0xfffe2cdc>
fc401184:	fea42a23          	sw	a0,-12(s0)
fc401188:	fea42623          	sw	a0,-20(s0)
fc40118c:	fcc40513          	addi	a0,s0,-52
fc401190:	fea42423          	sw	a0,-24(s0)
fc401194:	fd040513          	addi	a0,s0,-48
fc401198:	00068593          	mv	a1,a3
fc40119c:	00000097          	auipc	ra,0x0
fc4011a0:	010080e7          	jalr	16(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc4011a4:	fffff097          	auipc	ra,0xfffff
fc4011a8:	314080e7          	jalr	788(ra) # fc4004b8 <abort>

fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>:
fc4011ac:	fd010113          	addi	sp,sp,-48
fc4011b0:	02112623          	sw	ra,44(sp)
fc4011b4:	02812423          	sw	s0,40(sp)
fc4011b8:	03010413          	addi	s0,sp,48
fc4011bc:	0005a603          	lw	a2,0(a1)
fc4011c0:	0045a683          	lw	a3,4(a1)
fc4011c4:	0085a703          	lw	a4,8(a1)
fc4011c8:	00c5a583          	lw	a1,12(a1)
fc4011cc:	feb42823          	sw	a1,-16(s0)
fc4011d0:	fee42623          	sw	a4,-20(s0)
fc4011d4:	fed42423          	sw	a3,-24(s0)
fc4011d8:	fec42223          	sw	a2,-28(s0)
fc4011dc:	fea42023          	sw	a0,-32(s0)
fc4011e0:	fc406537          	lui	a0,0xfc406
fc4011e4:	34450513          	addi	a0,a0,836 # fc406344 <ebss+0xfffe72a4>
fc4011e8:	fca42e23          	sw	a0,-36(s0)
fc4011ec:	00100513          	li	a0,1
fc4011f0:	fca42c23          	sw	a0,-40(s0)
fc4011f4:	fd840513          	addi	a0,s0,-40
fc4011f8:	fffff097          	auipc	ra,0xfffff
fc4011fc:	1ec080e7          	jalr	492(ra) # fc4003e4 <rust_begin_unwind>
fc401200:	fffff097          	auipc	ra,0xfffff
fc401204:	2b8080e7          	jalr	696(ra) # fc4004b8 <abort>

fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>:
fc401208:	fc010113          	addi	sp,sp,-64
fc40120c:	02112e23          	sw	ra,60(sp)
fc401210:	02812c23          	sw	s0,56(sp)
fc401214:	04010413          	addi	s0,sp,64
fc401218:	fcb42223          	sw	a1,-60(s0)
fc40121c:	fca42023          	sw	a0,-64(s0)
fc401220:	fcd42623          	sw	a3,-52(s0)
fc401224:	fcc42423          	sw	a2,-56(s0)
fc401228:	fe840513          	addi	a0,s0,-24
fc40122c:	fea42023          	sw	a0,-32(s0)
fc401230:	fc042c23          	sw	zero,-40(s0)
fc401234:	00200513          	li	a0,2
fc401238:	fea42223          	sw	a0,-28(s0)
fc40123c:	fca42a23          	sw	a0,-44(s0)
fc401240:	fc406537          	lui	a0,0xfc406
fc401244:	48c50513          	addi	a0,a0,1164 # fc40648c <ebss+0xfffe73ec>
fc401248:	fca42823          	sw	a0,-48(s0)
fc40124c:	fc403537          	lui	a0,0xfc403
fc401250:	fc050513          	addi	a0,a0,-64 # fc402fc0 <ebss+0xfffe3f20>
fc401254:	fea42a23          	sw	a0,-12(s0)
fc401258:	fc840513          	addi	a0,s0,-56
fc40125c:	fea42823          	sw	a0,-16(s0)
fc401260:	fc403537          	lui	a0,0xfc403
fc401264:	ff050513          	addi	a0,a0,-16 # fc402ff0 <ebss+0xfffe3f50>
fc401268:	fea42623          	sw	a0,-20(s0)
fc40126c:	fc040513          	addi	a0,s0,-64
fc401270:	fea42423          	sw	a0,-24(s0)
fc401274:	fc406537          	lui	a0,0xfc406
fc401278:	50c50593          	addi	a1,a0,1292 # fc40650c <ebss+0xfffe746c>
fc40127c:	fd040513          	addi	a0,s0,-48
fc401280:	00000097          	auipc	ra,0x0
fc401284:	f2c080e7          	jalr	-212(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc401288:	fffff097          	auipc	ra,0xfffff
fc40128c:	230080e7          	jalr	560(ra) # fc4004b8 <abort>

fc401290 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E>:
fc401290:	ff010113          	addi	sp,sp,-16
fc401294:	00112623          	sw	ra,12(sp)
fc401298:	00812423          	sw	s0,8(sp)
fc40129c:	01010413          	addi	s0,sp,16
fc4012a0:	00050693          	mv	a3,a0
fc4012a4:	0035f713          	andi	a4,a1,3
fc4012a8:	00000513          	li	a0,0
fc4012ac:	0ff6f393          	andi	t2,a3,255
fc4012b0:	04070a63          	beqz	a4,fc401304 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x74>
fc4012b4:	00400793          	li	a5,4
fc4012b8:	40e78733          	sub	a4,a5,a4
fc4012bc:	04070463          	beqz	a4,fc401304 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x74>
fc4012c0:	00060513          	mv	a0,a2
fc4012c4:	00e66463          	bltu	a2,a4,fc4012cc <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x3c>
fc4012c8:	00070513          	mv	a0,a4
fc4012cc:	00000713          	li	a4,0
fc4012d0:	02e50a63          	beq	a0,a4,fc401304 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x74>
fc4012d4:	00e587b3          	add	a5,a1,a4
fc4012d8:	00170713          	addi	a4,a4,1
fc4012dc:	0007c783          	lbu	a5,0(a5)
fc4012e0:	fe7798e3          	bne	a5,t2,fc4012d0 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x40>
fc4012e4:	0077c533          	xor	a0,a5,t2
fc4012e8:	00153513          	seqz	a0,a0
fc4012ec:	00150513          	addi	a0,a0,1
fc4012f0:	00157513          	andi	a0,a0,1
fc4012f4:	00e50533          	add	a0,a0,a4
fc4012f8:	00100613          	li	a2,1
fc4012fc:	fff50593          	addi	a1,a0,-1
fc401300:	0c00006f          	j	fc4013c0 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x130>
fc401304:	00800713          	li	a4,8
fc401308:	06e66863          	bltu	a2,a4,fc401378 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0xe8>
fc40130c:	ff860813          	addi	a6,a2,-8
fc401310:	06a86463          	bltu	a6,a0,fc401378 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0xe8>
fc401314:	01010737          	lui	a4,0x1010
fc401318:	10170713          	addi	a4,a4,257 # 1010101 <XLENB+0x10100fd>
fc40131c:	02e388b3          	mul	a7,t2,a4
fc401320:	80808737          	lui	a4,0x80808
fc401324:	08070293          	addi	t0,a4,128 # 80808080 <ebss+0x843e8fe0>
fc401328:	feff07b7          	lui	a5,0xfeff0
fc40132c:	eff78313          	addi	t1,a5,-257 # fefefeff <ebss+0x2bd0e5f>
fc401330:	00a58733          	add	a4,a1,a0
fc401334:	00072783          	lw	a5,0(a4)
fc401338:	0117c7b3          	xor	a5,a5,a7
fc40133c:	006786b3          	add	a3,a5,t1
fc401340:	fff7c793          	not	a5,a5
fc401344:	0057f7b3          	and	a5,a5,t0
fc401348:	00d7f6b3          	and	a3,a5,a3
fc40134c:	00472703          	lw	a4,4(a4)
fc401350:	01174733          	xor	a4,a4,a7
fc401354:	006707b3          	add	a5,a4,t1
fc401358:	fff74713          	not	a4,a4
fc40135c:	00577733          	and	a4,a4,t0
fc401360:	00f77733          	and	a4,a4,a5
fc401364:	00d766b3          	or	a3,a4,a3
fc401368:	00069663          	bnez	a3,fc401374 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0xe4>
fc40136c:	00850513          	addi	a0,a0,8
fc401370:	fca870e3          	bgeu	a6,a0,fc401330 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0xa0>
fc401374:	06a66063          	bltu	a2,a0,fc4013d4 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x144>
fc401378:	40a60633          	sub	a2,a2,a0
fc40137c:	00a58733          	add	a4,a1,a0
fc401380:	00000593          	li	a1,0
fc401384:	02b60a63          	beq	a2,a1,fc4013b8 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x128>
fc401388:	00b706b3          	add	a3,a4,a1
fc40138c:	00158593          	addi	a1,a1,1
fc401390:	0006c783          	lbu	a5,0(a3)
fc401394:	fe7798e3          	bne	a5,t2,fc401384 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0xf4>
fc401398:	0077c633          	xor	a2,a5,t2
fc40139c:	00163613          	seqz	a2,a2
fc4013a0:	00160613          	addi	a2,a2,1
fc4013a4:	00167613          	andi	a2,a2,1
fc4013a8:	00b605b3          	add	a1,a2,a1
fc4013ac:	00100613          	li	a2,1
fc4013b0:	fff58593          	addi	a1,a1,-1
fc4013b4:	0080006f          	j	fc4013bc <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E+0x12c>
fc4013b8:	00000613          	li	a2,0
fc4013bc:	00a585b3          	add	a1,a1,a0
fc4013c0:	00060513          	mv	a0,a2
fc4013c4:	00812403          	lw	s0,8(sp)
fc4013c8:	00c12083          	lw	ra,12(sp)
fc4013cc:	01010113          	addi	sp,sp,16
fc4013d0:	00008067          	ret
fc4013d4:	00060593          	mv	a1,a2
fc4013d8:	00000097          	auipc	ra,0x0
fc4013dc:	474080e7          	jalr	1140(ra) # fc40184c <_ZN4core5slice22slice_index_order_fail17hc299d5381b4697c1E>
fc4013e0:	fffff097          	auipc	ra,0xfffff
fc4013e4:	0d8080e7          	jalr	216(ra) # fc4004b8 <abort>

fc4013e8 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE>:
fc4013e8:	f9010113          	addi	sp,sp,-112
fc4013ec:	06112623          	sw	ra,108(sp)
fc4013f0:	06812423          	sw	s0,104(sp)
fc4013f4:	07010413          	addi	s0,sp,112
fc4013f8:	f8d42a23          	sw	a3,-108(s0)
fc4013fc:	f8c42823          	sw	a2,-112(s0)
fc401400:	00100713          	li	a4,1
fc401404:	10100793          	li	a5,257
fc401408:	00058313          	mv	t1,a1
fc40140c:	02f5ee63          	bltu	a1,a5,fc401448 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x60>
fc401410:	40b00833          	neg	a6,a1
fc401414:	10000793          	li	a5,256
fc401418:	fbf00893          	li	a7,-65
fc40141c:	00100293          	li	t0,1
fc401420:	00b7f863          	bgeu	a5,a1,fc401430 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x48>
fc401424:	00f50733          	add	a4,a0,a5
fc401428:	00070703          	lb	a4,0(a4)
fc40142c:	02e8c863          	blt	a7,a4,fc40145c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x74>
fc401430:	fff78313          	addi	t1,a5,-1
fc401434:	12578063          	beq	a5,t0,fc401554 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x16c>
fc401438:	00f803b3          	add	t2,a6,a5
fc40143c:	00030793          	mv	a5,t1
fc401440:	00000713          	li	a4,0
fc401444:	fc539ee3          	bne	t2,t0,fc401420 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x38>
fc401448:	02071063          	bnez	a4,fc401468 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x80>
fc40144c:	fc406737          	lui	a4,0xfc406
fc401450:	52c70713          	addi	a4,a4,1324 # fc40652c <ebss+0xfffe748c>
fc401454:	00500793          	li	a5,5
fc401458:	01c0006f          	j	fc401474 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x8c>
fc40145c:	00078313          	mv	t1,a5
fc401460:	00000713          	li	a4,0
fc401464:	fe0704e3          	beqz	a4,fc40144c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x64>
fc401468:	fc406737          	lui	a4,0xfc406
fc40146c:	48870713          	addi	a4,a4,1160 # fc406488 <ebss+0xfffe73e8>
fc401470:	00000793          	li	a5,0
fc401474:	f8642e23          	sw	t1,-100(s0)
fc401478:	f8a42c23          	sw	a0,-104(s0)
fc40147c:	faf42223          	sw	a5,-92(s0)
fc401480:	fae42023          	sw	a4,-96(s0)
fc401484:	24c5e863          	bltu	a1,a2,fc4016d4 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x2ec>
fc401488:	24d5e663          	bltu	a1,a3,fc4016d4 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x2ec>
fc40148c:	2cc6e463          	bltu	a3,a2,fc401754 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x36c>
fc401490:	00060e63          	beqz	a2,fc4014ac <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0xc4>
fc401494:	00c58c63          	beq	a1,a2,fc4014ac <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0xc4>
fc401498:	00b67c63          	bgeu	a2,a1,fc4014b0 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0xc8>
fc40149c:	00c50733          	add	a4,a0,a2
fc4014a0:	00070703          	lb	a4,0(a4)
fc4014a4:	fc000793          	li	a5,-64
fc4014a8:	00f74463          	blt	a4,a5,fc4014b0 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0xc8>
fc4014ac:	00068613          	mv	a2,a3
fc4014b0:	fac42423          	sw	a2,-88(s0)
fc4014b4:	02060e63          	beqz	a2,fc4014f0 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x108>
fc4014b8:	02b60c63          	beq	a2,a1,fc4014f0 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x108>
fc4014bc:	00158693          	addi	a3,a1,1
fc4014c0:	fc000813          	li	a6,-64
fc4014c4:	00100793          	li	a5,1
fc4014c8:	00060713          	mv	a4,a2
fc4014cc:	00b67863          	bgeu	a2,a1,fc4014dc <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0xf4>
fc4014d0:	00e50633          	add	a2,a0,a4
fc4014d4:	00060603          	lb	a2,0(a2)
fc4014d8:	01065a63          	bge	a2,a6,fc4014ec <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x104>
fc4014dc:	fff70613          	addi	a2,a4,-1
fc4014e0:	00f70863          	beq	a4,a5,fc4014f0 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x108>
fc4014e4:	fee692e3          	bne	a3,a4,fc4014c8 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0xe0>
fc4014e8:	0080006f          	j	fc4014f0 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x108>
fc4014ec:	00070613          	mv	a2,a4
fc4014f0:	00b61e63          	bne	a2,a1,fc40150c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x124>
fc4014f4:	fc406537          	lui	a0,0xfc406
fc4014f8:	47050513          	addi	a0,a0,1136 # fc406470 <ebss+0xfffe73d0>
fc4014fc:	00000097          	auipc	ra,0x0
fc401500:	bc0080e7          	jalr	-1088(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc401504:	fffff097          	auipc	ra,0xfffff
fc401508:	fb4080e7          	jalr	-76(ra) # fc4004b8 <abort>
fc40150c:	00c50733          	add	a4,a0,a2
fc401510:	00070783          	lb	a5,0(a4)
fc401514:	0ff7f893          	andi	a7,a5,255
fc401518:	fff00693          	li	a3,-1
fc40151c:	00f6d863          	bge	a3,a5,fc40152c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x144>
fc401520:	fb142623          	sw	a7,-84(s0)
fc401524:	00100593          	li	a1,1
fc401528:	1040006f          	j	fc40162c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x244>
fc40152c:	00b50533          	add	a0,a0,a1
fc401530:	00170593          	addi	a1,a4,1
fc401534:	02a59663          	bne	a1,a0,fc401560 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x178>
fc401538:	00050793          	mv	a5,a0
fc40153c:	00000713          	li	a4,0
fc401540:	01f8f593          	andi	a1,a7,31
fc401544:	0df00693          	li	a3,223
fc401548:	0316e863          	bltu	a3,a7,fc401578 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x190>
fc40154c:	00659513          	slli	a0,a1,0x6
fc401550:	0480006f          	j	fc401598 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x1b0>
fc401554:	00000713          	li	a4,0
fc401558:	ee070ae3          	beqz	a4,fc40144c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x64>
fc40155c:	f0dff06f          	j	fc401468 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x80>
fc401560:	00270793          	addi	a5,a4,2
fc401564:	00174583          	lbu	a1,1(a4)
fc401568:	03f5f713          	andi	a4,a1,63
fc40156c:	01f8f593          	andi	a1,a7,31
fc401570:	0df00693          	li	a3,223
fc401574:	fd16fce3          	bgeu	a3,a7,fc40154c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x164>
fc401578:	04a79a63          	bne	a5,a0,fc4015cc <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x1e4>
fc40157c:	00050813          	mv	a6,a0
fc401580:	00000793          	li	a5,0
fc401584:	00671693          	slli	a3,a4,0x6
fc401588:	00d7e733          	or	a4,a5,a3
fc40158c:	0f000693          	li	a3,240
fc401590:	04d8fc63          	bgeu	a7,a3,fc4015e8 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x200>
fc401594:	00c59513          	slli	a0,a1,0xc
fc401598:	00a76533          	or	a0,a4,a0
fc40159c:	00100593          	li	a1,1
fc4015a0:	faa42623          	sw	a0,-84(s0)
fc4015a4:	08000693          	li	a3,128
fc4015a8:	08d56263          	bltu	a0,a3,fc40162c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x244>
fc4015ac:	00200593          	li	a1,2
fc4015b0:	00b55693          	srli	a3,a0,0xb
fc4015b4:	06068c63          	beqz	a3,fc40162c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x244>
fc4015b8:	01055513          	srli	a0,a0,0x10
fc4015bc:	00300593          	li	a1,3
fc4015c0:	06050663          	beqz	a0,fc40162c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x244>
fc4015c4:	00400593          	li	a1,4
fc4015c8:	0640006f          	j	fc40162c <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x244>
fc4015cc:	00178813          	addi	a6,a5,1
fc4015d0:	0007c683          	lbu	a3,0(a5)
fc4015d4:	03f6f793          	andi	a5,a3,63
fc4015d8:	00671693          	slli	a3,a4,0x6
fc4015dc:	00d7e733          	or	a4,a5,a3
fc4015e0:	0f000693          	li	a3,240
fc4015e4:	fad8e8e3          	bltu	a7,a3,fc401594 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x1ac>
fc4015e8:	00a81663          	bne	a6,a0,fc4015f4 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x20c>
fc4015ec:	00000513          	li	a0,0
fc4015f0:	00c0006f          	j	fc4015fc <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x214>
fc4015f4:	00084503          	lbu	a0,0(a6)
fc4015f8:	03f57513          	andi	a0,a0,63
fc4015fc:	01259593          	slli	a1,a1,0x12
fc401600:	001c06b7          	lui	a3,0x1c0
fc401604:	00d5f5b3          	and	a1,a1,a3
fc401608:	00671693          	slli	a3,a4,0x6
fc40160c:	00b6e5b3          	or	a1,a3,a1
fc401610:	00a5e533          	or	a0,a1,a0
fc401614:	001105b7          	lui	a1,0x110
fc401618:	ecb50ee3          	beq	a0,a1,fc4014f4 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x10c>
fc40161c:	00100593          	li	a1,1
fc401620:	faa42623          	sw	a0,-84(s0)
fc401624:	08000693          	li	a3,128
fc401628:	f8d572e3          	bgeu	a0,a3,fc4015ac <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x1c4>
fc40162c:	fac42823          	sw	a2,-80(s0)
fc401630:	00c58533          	add	a0,a1,a2
fc401634:	faa42a23          	sw	a0,-76(s0)
fc401638:	fd040513          	addi	a0,s0,-48
fc40163c:	fca42423          	sw	a0,-56(s0)
fc401640:	fc042023          	sw	zero,-64(s0)
fc401644:	00500513          	li	a0,5
fc401648:	fca42623          	sw	a0,-52(s0)
fc40164c:	faa42e23          	sw	a0,-68(s0)
fc401650:	fc406537          	lui	a0,0xfc406
fc401654:	6b050513          	addi	a0,a0,1712 # fc4066b0 <ebss+0xfffe7610>
fc401658:	faa42c23          	sw	a0,-72(s0)
fc40165c:	fa040513          	addi	a0,s0,-96
fc401660:	fea42823          	sw	a0,-16(s0)
fc401664:	fc403537          	lui	a0,0xfc403
fc401668:	ff050513          	addi	a0,a0,-16 # fc402ff0 <ebss+0xfffe3f50>
fc40166c:	fea42a23          	sw	a0,-12(s0)
fc401670:	fea42623          	sw	a0,-20(s0)
fc401674:	f9840513          	addi	a0,s0,-104
fc401678:	fea42423          	sw	a0,-24(s0)
fc40167c:	fc401537          	lui	a0,0xfc401
fc401680:	c9c50513          	addi	a0,a0,-868 # fc400c9c <ebss+0xfffe1bfc>
fc401684:	fea42223          	sw	a0,-28(s0)
fc401688:	fb040513          	addi	a0,s0,-80
fc40168c:	fea42023          	sw	a0,-32(s0)
fc401690:	fc403537          	lui	a0,0xfc403
fc401694:	bcc50513          	addi	a0,a0,-1076 # fc402bcc <ebss+0xfffe3b2c>
fc401698:	fca42e23          	sw	a0,-36(s0)
fc40169c:	fac40513          	addi	a0,s0,-84
fc4016a0:	fca42c23          	sw	a0,-40(s0)
fc4016a4:	fc402537          	lui	a0,0xfc402
fc4016a8:	d7c50513          	addi	a0,a0,-644 # fc401d7c <ebss+0xfffe2cdc>
fc4016ac:	fca42a23          	sw	a0,-44(s0)
fc4016b0:	fa840513          	addi	a0,s0,-88
fc4016b4:	fca42823          	sw	a0,-48(s0)
fc4016b8:	fc406537          	lui	a0,0xfc406
fc4016bc:	6d850593          	addi	a1,a0,1752 # fc4066d8 <ebss+0xfffe7638>
fc4016c0:	fb840513          	addi	a0,s0,-72
fc4016c4:	00000097          	auipc	ra,0x0
fc4016c8:	ae8080e7          	jalr	-1304(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc4016cc:	fffff097          	auipc	ra,0xfffff
fc4016d0:	dec080e7          	jalr	-532(ra) # fc4004b8 <abort>
fc4016d4:	00c5e463          	bltu	a1,a2,fc4016dc <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE+0x2f4>
fc4016d8:	00068613          	mv	a2,a3
fc4016dc:	fac42823          	sw	a2,-80(s0)
fc4016e0:	fd040513          	addi	a0,s0,-48
fc4016e4:	fca42423          	sw	a0,-56(s0)
fc4016e8:	fc042023          	sw	zero,-64(s0)
fc4016ec:	00300513          	li	a0,3
fc4016f0:	fca42623          	sw	a0,-52(s0)
fc4016f4:	faa42e23          	sw	a0,-68(s0)
fc4016f8:	fc406537          	lui	a0,0xfc406
fc4016fc:	55450513          	addi	a0,a0,1364 # fc406554 <ebss+0xfffe74b4>
fc401700:	faa42c23          	sw	a0,-72(s0)
fc401704:	fa040513          	addi	a0,s0,-96
fc401708:	fea42023          	sw	a0,-32(s0)
fc40170c:	fc403537          	lui	a0,0xfc403
fc401710:	ff050513          	addi	a0,a0,-16 # fc402ff0 <ebss+0xfffe3f50>
fc401714:	fea42223          	sw	a0,-28(s0)
fc401718:	fca42e23          	sw	a0,-36(s0)
fc40171c:	f9840513          	addi	a0,s0,-104
fc401720:	fca42c23          	sw	a0,-40(s0)
fc401724:	fc402537          	lui	a0,0xfc402
fc401728:	d7c50513          	addi	a0,a0,-644 # fc401d7c <ebss+0xfffe2cdc>
fc40172c:	fca42a23          	sw	a0,-44(s0)
fc401730:	fb040513          	addi	a0,s0,-80
fc401734:	fca42823          	sw	a0,-48(s0)
fc401738:	fc406537          	lui	a0,0xfc406
fc40173c:	5dc50593          	addi	a1,a0,1500 # fc4065dc <ebss+0xfffe753c>
fc401740:	fb840513          	addi	a0,s0,-72
fc401744:	00000097          	auipc	ra,0x0
fc401748:	a68080e7          	jalr	-1432(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc40174c:	fffff097          	auipc	ra,0xfffff
fc401750:	d6c080e7          	jalr	-660(ra) # fc4004b8 <abort>
fc401754:	fd040513          	addi	a0,s0,-48
fc401758:	fca42423          	sw	a0,-56(s0)
fc40175c:	fc042023          	sw	zero,-64(s0)
fc401760:	00400513          	li	a0,4
fc401764:	fca42623          	sw	a0,-52(s0)
fc401768:	faa42e23          	sw	a0,-68(s0)
fc40176c:	fa040513          	addi	a0,s0,-96
fc401770:	fea42423          	sw	a0,-24(s0)
fc401774:	fc403537          	lui	a0,0xfc403
fc401778:	ff050513          	addi	a0,a0,-16 # fc402ff0 <ebss+0xfffe3f50>
fc40177c:	fea42623          	sw	a0,-20(s0)
fc401780:	fea42223          	sw	a0,-28(s0)
fc401784:	f9840513          	addi	a0,s0,-104
fc401788:	fea42023          	sw	a0,-32(s0)
fc40178c:	f9440513          	addi	a0,s0,-108
fc401790:	fca42c23          	sw	a0,-40(s0)
fc401794:	fc402537          	lui	a0,0xfc402
fc401798:	d7c50513          	addi	a0,a0,-644 # fc401d7c <ebss+0xfffe2cdc>
fc40179c:	fca42e23          	sw	a0,-36(s0)
fc4017a0:	fca42a23          	sw	a0,-44(s0)
fc4017a4:	f9040513          	addi	a0,s0,-112
fc4017a8:	fca42823          	sw	a0,-48(s0)
fc4017ac:	fc406537          	lui	a0,0xfc406
fc4017b0:	65450513          	addi	a0,a0,1620 # fc406654 <ebss+0xfffe75b4>
fc4017b4:	faa42c23          	sw	a0,-72(s0)
fc4017b8:	fc406537          	lui	a0,0xfc406
fc4017bc:	67450593          	addi	a1,a0,1652 # fc406674 <ebss+0xfffe75d4>
fc4017c0:	fb840513          	addi	a0,s0,-72
fc4017c4:	00000097          	auipc	ra,0x0
fc4017c8:	9e8080e7          	jalr	-1560(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc4017cc:	fffff097          	auipc	ra,0xfffff
fc4017d0:	cec080e7          	jalr	-788(ra) # fc4004b8 <abort>

fc4017d4 <_ZN4core5slice20slice_index_len_fail17h5666f5f91c34d162E>:
fc4017d4:	fc010113          	addi	sp,sp,-64
fc4017d8:	02112e23          	sw	ra,60(sp)
fc4017dc:	02812c23          	sw	s0,56(sp)
fc4017e0:	04010413          	addi	s0,sp,64
fc4017e4:	fcb42623          	sw	a1,-52(s0)
fc4017e8:	fca42423          	sw	a0,-56(s0)
fc4017ec:	fe840513          	addi	a0,s0,-24
fc4017f0:	fea42023          	sw	a0,-32(s0)
fc4017f4:	fc042c23          	sw	zero,-40(s0)
fc4017f8:	00200513          	li	a0,2
fc4017fc:	fea42223          	sw	a0,-28(s0)
fc401800:	fca42a23          	sw	a0,-44(s0)
fc401804:	fc407537          	lui	a0,0xfc407
fc401808:	83850513          	addi	a0,a0,-1992 # fc406838 <ebss+0xfffe7798>
fc40180c:	fca42823          	sw	a0,-48(s0)
fc401810:	fcc40513          	addi	a0,s0,-52
fc401814:	fea42823          	sw	a0,-16(s0)
fc401818:	fc402537          	lui	a0,0xfc402
fc40181c:	d7c50513          	addi	a0,a0,-644 # fc401d7c <ebss+0xfffe2cdc>
fc401820:	fea42a23          	sw	a0,-12(s0)
fc401824:	fea42623          	sw	a0,-20(s0)
fc401828:	fc840513          	addi	a0,s0,-56
fc40182c:	fea42423          	sw	a0,-24(s0)
fc401830:	fc407537          	lui	a0,0xfc407
fc401834:	84850593          	addi	a1,a0,-1976 # fc406848 <ebss+0xfffe77a8>
fc401838:	fd040513          	addi	a0,s0,-48
fc40183c:	00000097          	auipc	ra,0x0
fc401840:	970080e7          	jalr	-1680(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc401844:	fffff097          	auipc	ra,0xfffff
fc401848:	c74080e7          	jalr	-908(ra) # fc4004b8 <abort>

fc40184c <_ZN4core5slice22slice_index_order_fail17hc299d5381b4697c1E>:
fc40184c:	fc010113          	addi	sp,sp,-64
fc401850:	02112e23          	sw	ra,60(sp)
fc401854:	02812c23          	sw	s0,56(sp)
fc401858:	04010413          	addi	s0,sp,64
fc40185c:	fcb42623          	sw	a1,-52(s0)
fc401860:	fca42423          	sw	a0,-56(s0)
fc401864:	fe840513          	addi	a0,s0,-24
fc401868:	fea42023          	sw	a0,-32(s0)
fc40186c:	fc042c23          	sw	zero,-40(s0)
fc401870:	00200513          	li	a0,2
fc401874:	fea42223          	sw	a0,-28(s0)
fc401878:	fca42a23          	sw	a0,-44(s0)
fc40187c:	fc407537          	lui	a0,0xfc407
fc401880:	87c50513          	addi	a0,a0,-1924 # fc40687c <ebss+0xfffe77dc>
fc401884:	fca42823          	sw	a0,-48(s0)
fc401888:	fcc40513          	addi	a0,s0,-52
fc40188c:	fea42823          	sw	a0,-16(s0)
fc401890:	fc402537          	lui	a0,0xfc402
fc401894:	d7c50513          	addi	a0,a0,-644 # fc401d7c <ebss+0xfffe2cdc>
fc401898:	fea42a23          	sw	a0,-12(s0)
fc40189c:	fea42623          	sw	a0,-20(s0)
fc4018a0:	fc840513          	addi	a0,s0,-56
fc4018a4:	fea42423          	sw	a0,-24(s0)
fc4018a8:	fc407537          	lui	a0,0xfc407
fc4018ac:	88c50593          	addi	a1,a0,-1908 # fc40688c <ebss+0xfffe77ec>
fc4018b0:	fd040513          	addi	a0,s0,-48
fc4018b4:	00000097          	auipc	ra,0x0
fc4018b8:	8f8080e7          	jalr	-1800(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc4018bc:	fffff097          	auipc	ra,0xfffff
fc4018c0:	bfc080e7          	jalr	-1028(ra) # fc4004b8 <abort>

fc4018c4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E>:
fc4018c4:	ff010113          	addi	sp,sp,-16
fc4018c8:	00112623          	sw	ra,12(sp)
fc4018cc:	00812423          	sw	s0,8(sp)
fc4018d0:	01010413          	addi	s0,sp,16
fc4018d4:	00b5d613          	srli	a2,a1,0xb
fc4018d8:	00061c63          	bnez	a2,fc4018f0 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0x2c>
fc4018dc:	20000637          	lui	a2,0x20000
fc4018e0:	ff860613          	addi	a2,a2,-8 # 1ffffff8 <XLENB+0x1ffffff4>
fc4018e4:	0035d693          	srli	a3,a1,0x3
fc4018e8:	00c6f633          	and	a2,a3,a2
fc4018ec:	0840006f          	j	fc401970 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0xac>
fc4018f0:	0105d613          	srli	a2,a1,0x10
fc4018f4:	02061863          	bnez	a2,fc401924 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0x60>
fc4018f8:	0065d613          	srli	a2,a1,0x6
fc4018fc:	fe060613          	addi	a2,a2,-32
fc401900:	3df00693          	li	a3,991
fc401904:	0ac6ee63          	bltu	a3,a2,fc4019c0 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0xfc>
fc401908:	00c50633          	add	a2,a0,a2
fc40190c:	11864683          	lbu	a3,280(a2)
fc401910:	10452603          	lw	a2,260(a0)
fc401914:	0cc6f663          	bgeu	a3,a2,fc4019e0 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0x11c>
fc401918:	00369613          	slli	a2,a3,0x3
fc40191c:	10052503          	lw	a0,256(a0)
fc401920:	0500006f          	j	fc401970 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0xac>
fc401924:	00c5d613          	srli	a2,a1,0xc
fc401928:	ff060613          	addi	a2,a2,-16
fc40192c:	10000693          	li	a3,256
fc401930:	0cd67663          	bgeu	a2,a3,fc4019fc <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0x138>
fc401934:	00c50633          	add	a2,a0,a2
fc401938:	4f864603          	lbu	a2,1272(a2)
fc40193c:	00661613          	slli	a2,a2,0x6
fc401940:	0065d693          	srli	a3,a1,0x6
fc401944:	03f6f693          	andi	a3,a3,63
fc401948:	00d666b3          	or	a3,a2,a3
fc40194c:	10c52603          	lw	a2,268(a0)
fc401950:	0cc6f663          	bgeu	a3,a2,fc401a1c <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0x158>
fc401954:	10852603          	lw	a2,264(a0)
fc401958:	00d60633          	add	a2,a2,a3
fc40195c:	00064683          	lbu	a3,0(a2)
fc401960:	11452603          	lw	a2,276(a0)
fc401964:	0cc6fa63          	bgeu	a3,a2,fc401a38 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0x174>
fc401968:	00369613          	slli	a2,a3,0x3
fc40196c:	11052503          	lw	a0,272(a0)
fc401970:	00c50533          	add	a0,a0,a2
fc401974:	00100613          	li	a2,1
fc401978:	03f5f693          	andi	a3,a1,63
fc40197c:	fe068693          	addi	a3,a3,-32 # 1bffe0 <XLENB+0x1bffdc>
fc401980:	0006c863          	bltz	a3,fc401990 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0xcc>
fc401984:	00d615b3          	sll	a1,a2,a3
fc401988:	00000613          	li	a2,0
fc40198c:	00c0006f          	j	fc401998 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E+0xd4>
fc401990:	00b61633          	sll	a2,a2,a1
fc401994:	00000593          	li	a1,0
fc401998:	00052683          	lw	a3,0(a0)
fc40199c:	00c6f633          	and	a2,a3,a2
fc4019a0:	00452503          	lw	a0,4(a0)
fc4019a4:	00b57533          	and	a0,a0,a1
fc4019a8:	00a66533          	or	a0,a2,a0
fc4019ac:	00a03533          	snez	a0,a0
fc4019b0:	00812403          	lw	s0,8(sp)
fc4019b4:	00c12083          	lw	ra,12(sp)
fc4019b8:	01010113          	addi	sp,sp,16
fc4019bc:	00008067          	ret
fc4019c0:	fc407537          	lui	a0,0xfc407
fc4019c4:	91c50513          	addi	a0,a0,-1764 # fc40691c <ebss+0xfffe787c>
fc4019c8:	00060593          	mv	a1,a2
fc4019cc:	3e000613          	li	a2,992
fc4019d0:	fffff097          	auipc	ra,0xfffff
fc4019d4:	764080e7          	jalr	1892(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc4019d8:	fffff097          	auipc	ra,0xfffff
fc4019dc:	ae0080e7          	jalr	-1312(ra) # fc4004b8 <abort>
fc4019e0:	fc407537          	lui	a0,0xfc407
fc4019e4:	92c50513          	addi	a0,a0,-1748 # fc40692c <ebss+0xfffe788c>
fc4019e8:	00068593          	mv	a1,a3
fc4019ec:	fffff097          	auipc	ra,0xfffff
fc4019f0:	748080e7          	jalr	1864(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc4019f4:	fffff097          	auipc	ra,0xfffff
fc4019f8:	ac4080e7          	jalr	-1340(ra) # fc4004b8 <abort>
fc4019fc:	fc407537          	lui	a0,0xfc407
fc401a00:	93c50513          	addi	a0,a0,-1732 # fc40693c <ebss+0xfffe789c>
fc401a04:	00060593          	mv	a1,a2
fc401a08:	10000613          	li	a2,256
fc401a0c:	fffff097          	auipc	ra,0xfffff
fc401a10:	728080e7          	jalr	1832(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc401a14:	fffff097          	auipc	ra,0xfffff
fc401a18:	aa4080e7          	jalr	-1372(ra) # fc4004b8 <abort>
fc401a1c:	fc407537          	lui	a0,0xfc407
fc401a20:	94c50513          	addi	a0,a0,-1716 # fc40694c <ebss+0xfffe78ac>
fc401a24:	00068593          	mv	a1,a3
fc401a28:	fffff097          	auipc	ra,0xfffff
fc401a2c:	70c080e7          	jalr	1804(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc401a30:	fffff097          	auipc	ra,0xfffff
fc401a34:	a88080e7          	jalr	-1400(ra) # fc4004b8 <abort>
fc401a38:	fc407537          	lui	a0,0xfc407
fc401a3c:	95c50513          	addi	a0,a0,-1700 # fc40695c <ebss+0xfffe78bc>
fc401a40:	00068593          	mv	a1,a3
fc401a44:	fffff097          	auipc	ra,0xfffff
fc401a48:	6f0080e7          	jalr	1776(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc401a4c:	fffff097          	auipc	ra,0xfffff
fc401a50:	a6c080e7          	jalr	-1428(ra) # fc4004b8 <abort>

fc401a54 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110>:
fc401a54:	ff010113          	addi	sp,sp,-16
fc401a58:	00112623          	sw	ra,12(sp)
fc401a5c:	00812423          	sw	s0,8(sp)
fc401a60:	01010413          	addi	s0,sp,16
fc401a64:	06060863          	beqz	a2,fc401ad4 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x80>
fc401a68:	00161613          	slli	a2,a2,0x1
fc401a6c:	00c582b3          	add	t0,a1,a2
fc401a70:	00010637          	lui	a2,0x10
fc401a74:	f0060613          	addi	a2,a2,-256 # ff00 <XLENB+0xfefc>
fc401a78:	00c57633          	and	a2,a0,a2
fc401a7c:	00865313          	srli	t1,a2,0x8
fc401a80:	0ff57e93          	andi	t4,a0,255
fc401a84:	00000393          	li	t2,0
fc401a88:	0015c603          	lbu	a2,1(a1) # 110001 <XLENB+0x10fffd>
fc401a8c:	00c388b3          	add	a7,t2,a2
fc401a90:	00258e13          	addi	t3,a1,2
fc401a94:	0005c583          	lbu	a1,0(a1)
fc401a98:	02659663          	bne	a1,t1,fc401ac4 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x70>
fc401a9c:	0c78ee63          	bltu	a7,t2,fc401b78 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x124>
fc401aa0:	0f176863          	bltu	a4,a7,fc401b90 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x13c>
fc401aa4:	007685b3          	add	a1,a3,t2
fc401aa8:	02060063          	beqz	a2,fc401ac8 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x74>
fc401aac:	fff60613          	addi	a2,a2,-1
fc401ab0:	00158393          	addi	t2,a1,1
fc401ab4:	0005cf03          	lbu	t5,0(a1)
fc401ab8:	00038593          	mv	a1,t2
fc401abc:	ffdf16e3          	bne	t5,t4,fc401aa8 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x54>
fc401ac0:	0800006f          	j	fc401b40 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xec>
fc401ac4:	00b36863          	bltu	t1,a1,fc401ad4 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x80>
fc401ac8:	00088393          	mv	t2,a7
fc401acc:	000e0593          	mv	a1,t3
fc401ad0:	fa5e1ce3          	bne	t3,t0,fc401a88 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x34>
fc401ad4:	06080a63          	beqz	a6,fc401b48 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xf4>
fc401ad8:	010785b3          	add	a1,a5,a6
fc401adc:	00010637          	lui	a2,0x10
fc401ae0:	fff60613          	addi	a2,a2,-1 # ffff <XLENB+0xfffb>
fc401ae4:	00c57633          	and	a2,a0,a2
fc401ae8:	00100513          	li	a0,1
fc401aec:	00178693          	addi	a3,a5,1
fc401af0:	0007c703          	lbu	a4,0(a5)
fc401af4:	01871793          	slli	a5,a4,0x18
fc401af8:	4187d793          	srai	a5,a5,0x18
fc401afc:	0207c063          	bltz	a5,fc401b1c <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xc8>
fc401b00:	00068793          	mv	a5,a3
fc401b04:	40e60633          	sub	a2,a2,a4
fc401b08:	04064263          	bltz	a2,fc401b4c <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xf8>
fc401b0c:	00178693          	addi	a3,a5,1
fc401b10:	00154513          	xori	a0,a0,1
fc401b14:	fcb79ee3          	bne	a5,a1,fc401af0 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x9c>
fc401b18:	0340006f          	j	fc401b4c <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xf8>
fc401b1c:	04b68263          	beq	a3,a1,fc401b60 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0x10c>
fc401b20:	07f7f713          	andi	a4,a5,127
fc401b24:	00871713          	slli	a4,a4,0x8
fc401b28:	0006c783          	lbu	a5,0(a3)
fc401b2c:	00f76733          	or	a4,a4,a5
fc401b30:	00168793          	addi	a5,a3,1
fc401b34:	40e60633          	sub	a2,a2,a4
fc401b38:	fc065ae3          	bgez	a2,fc401b0c <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xb8>
fc401b3c:	0100006f          	j	fc401b4c <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xf8>
fc401b40:	00000513          	li	a0,0
fc401b44:	0080006f          	j	fc401b4c <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110+0xf8>
fc401b48:	00100513          	li	a0,1
fc401b4c:	00157513          	andi	a0,a0,1
fc401b50:	00812403          	lw	s0,8(sp)
fc401b54:	00c12083          	lw	ra,12(sp)
fc401b58:	01010113          	addi	sp,sp,16
fc401b5c:	00008067          	ret
fc401b60:	fc406537          	lui	a0,0xfc406
fc401b64:	78450513          	addi	a0,a0,1924 # fc406784 <ebss+0xfffe76e4>
fc401b68:	fffff097          	auipc	ra,0xfffff
fc401b6c:	554080e7          	jalr	1364(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc401b70:	fffff097          	auipc	ra,0xfffff
fc401b74:	948080e7          	jalr	-1720(ra) # fc4004b8 <abort>
fc401b78:	00038513          	mv	a0,t2
fc401b7c:	00088593          	mv	a1,a7
fc401b80:	00000097          	auipc	ra,0x0
fc401b84:	ccc080e7          	jalr	-820(ra) # fc40184c <_ZN4core5slice22slice_index_order_fail17hc299d5381b4697c1E>
fc401b88:	fffff097          	auipc	ra,0xfffff
fc401b8c:	930080e7          	jalr	-1744(ra) # fc4004b8 <abort>
fc401b90:	00088513          	mv	a0,a7
fc401b94:	00070593          	mv	a1,a4
fc401b98:	00000097          	auipc	ra,0x0
fc401b9c:	c3c080e7          	jalr	-964(ra) # fc4017d4 <_ZN4core5slice20slice_index_len_fail17h5666f5f91c34d162E>
fc401ba0:	fffff097          	auipc	ra,0xfffff
fc401ba4:	918080e7          	jalr	-1768(ra) # fc4004b8 <abort>

fc401ba8 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110>:
fc401ba8:	fc010113          	addi	sp,sp,-64
fc401bac:	02112e23          	sw	ra,60(sp)
fc401bb0:	02812c23          	sw	s0,56(sp)
fc401bb4:	02912a23          	sw	s1,52(sp)
fc401bb8:	03212823          	sw	s2,48(sp)
fc401bbc:	03312623          	sw	s3,44(sp)
fc401bc0:	03412423          	sw	s4,40(sp)
fc401bc4:	04010413          	addi	s0,sp,64
fc401bc8:	00060813          	mv	a6,a2
fc401bcc:	02700713          	li	a4,39
fc401bd0:	fc406637          	lui	a2,0xfc406
fc401bd4:	33462f03          	lw	t5,820(a2) # fc406334 <ebss+0xfffe7294>
fc401bd8:	00455693          	srli	a3,a0,0x4
fc401bdc:	27100793          	li	a5,625
fc401be0:	0af6e463          	bltu	a3,a5,fc401c88 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110+0xe0>
fc401be4:	d1b716b7          	lui	a3,0xd1b71
fc401be8:	75968893          	addi	a7,a3,1881 # d1b71759 <ebss+0xd57526b9>
fc401bec:	000026b7          	lui	a3,0x2
fc401bf0:	71068393          	addi	t2,a3,1808 # 2710 <XLENB+0x270c>
fc401bf4:	000106b7          	lui	a3,0x10
fc401bf8:	fff68e13          	addi	t3,a3,-1 # ffff <XLENB+0xfffb>
fc401bfc:	51eb8737          	lui	a4,0x51eb8
fc401c00:	51f70e93          	addi	t4,a4,1311 # 51eb851f <XLENB+0x51eb851b>
fc401c04:	fc140293          	addi	t0,s0,-63
fc401c08:	06400313          	li	t1,100
fc401c0c:	ffe68f93          	addi	t6,a3,-2
fc401c10:	05f5e6b7          	lui	a3,0x5f5e
fc401c14:	0ff68913          	addi	s2,a3,255 # 5f5e0ff <XLENB+0x5f5e0fb>
fc401c18:	00000693          	li	a3,0
fc401c1c:	00050993          	mv	s3,a0
fc401c20:	03153533          	mulhu	a0,a0,a7
fc401c24:	00d55513          	srli	a0,a0,0xd
fc401c28:	027507b3          	mul	a5,a0,t2
fc401c2c:	40f987b3          	sub	a5,s3,a5
fc401c30:	01c7f4b3          	and	s1,a5,t3
fc401c34:	03d4b4b3          	mulhu	s1,s1,t4
fc401c38:	00d28733          	add	a4,t0,a3
fc401c3c:	0054d493          	srli	s1,s1,0x5
fc401c40:	00149613          	slli	a2,s1,0x1
fc401c44:	00cf0633          	add	a2,t5,a2
fc401c48:	00064a03          	lbu	s4,0(a2)
fc401c4c:	00160603          	lb	a2,1(a2)
fc401c50:	02c70223          	sb	a2,36(a4)
fc401c54:	034701a3          	sb	s4,35(a4)
fc401c58:	02648633          	mul	a2,s1,t1
fc401c5c:	40c78633          	sub	a2,a5,a2
fc401c60:	00161613          	slli	a2,a2,0x1
fc401c64:	01f67633          	and	a2,a2,t6
fc401c68:	00cf0633          	add	a2,t5,a2
fc401c6c:	00064783          	lbu	a5,0(a2)
fc401c70:	00160603          	lb	a2,1(a2)
fc401c74:	02c70323          	sb	a2,38(a4)
fc401c78:	02f702a3          	sb	a5,37(a4)
fc401c7c:	ffc68693          	addi	a3,a3,-4
fc401c80:	f9396ee3          	bltu	s2,s3,fc401c1c <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110+0x74>
fc401c84:	02768713          	addi	a4,a3,39
fc401c88:	06300693          	li	a3,99
fc401c8c:	08a6d463          	bge	a3,a0,fc401d14 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110+0x16c>
fc401c90:	00010637          	lui	a2,0x10
fc401c94:	fff60693          	addi	a3,a2,-1 # ffff <XLENB+0xfffb>
fc401c98:	00d576b3          	and	a3,a0,a3
fc401c9c:	51eb87b7          	lui	a5,0x51eb8
fc401ca0:	51f78793          	addi	a5,a5,1311 # 51eb851f <XLENB+0x51eb851b>
fc401ca4:	02f6b6b3          	mulhu	a3,a3,a5
fc401ca8:	0056d693          	srli	a3,a3,0x5
fc401cac:	06400793          	li	a5,100
fc401cb0:	02f687b3          	mul	a5,a3,a5
fc401cb4:	40f50533          	sub	a0,a0,a5
fc401cb8:	00151513          	slli	a0,a0,0x1
fc401cbc:	ffe60613          	addi	a2,a2,-2
fc401cc0:	00c57533          	and	a0,a0,a2
fc401cc4:	00af0533          	add	a0,t5,a0
fc401cc8:	ffe70713          	addi	a4,a4,-2
fc401ccc:	fc140613          	addi	a2,s0,-63
fc401cd0:	00e60633          	add	a2,a2,a4
fc401cd4:	00054783          	lbu	a5,0(a0)
fc401cd8:	00150503          	lb	a0,1(a0)
fc401cdc:	00a600a3          	sb	a0,1(a2)
fc401ce0:	00f60023          	sb	a5,0(a2)
fc401ce4:	00a00513          	li	a0,10
fc401ce8:	02a6cc63          	blt	a3,a0,fc401d20 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110+0x178>
fc401cec:	00169513          	slli	a0,a3,0x1
fc401cf0:	00af0633          	add	a2,t5,a0
fc401cf4:	ffe70513          	addi	a0,a4,-2
fc401cf8:	fc140693          	addi	a3,s0,-63
fc401cfc:	00a686b3          	add	a3,a3,a0
fc401d00:	00064703          	lbu	a4,0(a2)
fc401d04:	00160603          	lb	a2,1(a2)
fc401d08:	00c680a3          	sb	a2,1(a3)
fc401d0c:	00e68023          	sb	a4,0(a3)
fc401d10:	0240006f          	j	fc401d34 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110+0x18c>
fc401d14:	00050693          	mv	a3,a0
fc401d18:	00a00513          	li	a0,10
fc401d1c:	fca6d8e3          	bge	a3,a0,fc401cec <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110+0x144>
fc401d20:	fff70513          	addi	a0,a4,-1
fc401d24:	fc140613          	addi	a2,s0,-63
fc401d28:	00a60633          	add	a2,a2,a0
fc401d2c:	03068693          	addi	a3,a3,48
fc401d30:	00d60023          	sb	a3,0(a2)
fc401d34:	fc140613          	addi	a2,s0,-63
fc401d38:	00a60733          	add	a4,a2,a0
fc401d3c:	02700613          	li	a2,39
fc401d40:	40a607b3          	sub	a5,a2,a0
fc401d44:	fc408537          	lui	a0,0xfc408
fc401d48:	ac050613          	addi	a2,a0,-1344 # fc407ac0 <ebss+0xfffe8a20>
fc401d4c:	00080513          	mv	a0,a6
fc401d50:	00000693          	li	a3,0
fc401d54:	00000097          	auipc	ra,0x0
fc401d58:	500080e7          	jalr	1280(ra) # fc402254 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE>
fc401d5c:	02812a03          	lw	s4,40(sp)
fc401d60:	02c12983          	lw	s3,44(sp)
fc401d64:	03012903          	lw	s2,48(sp)
fc401d68:	03412483          	lw	s1,52(sp)
fc401d6c:	03812403          	lw	s0,56(sp)
fc401d70:	03c12083          	lw	ra,60(sp)
fc401d74:	04010113          	addi	sp,sp,64
fc401d78:	00008067          	ret

fc401d7c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17ha3ee10d3be386233E>:
fc401d7c:	ff010113          	addi	sp,sp,-16
fc401d80:	00112623          	sw	ra,12(sp)
fc401d84:	00812423          	sw	s0,8(sp)
fc401d88:	01010413          	addi	s0,sp,16
fc401d8c:	00058613          	mv	a2,a1
fc401d90:	00052503          	lw	a0,0(a0)
fc401d94:	00100593          	li	a1,1
fc401d98:	00812403          	lw	s0,8(sp)
fc401d9c:	00c12083          	lw	ra,12(sp)
fc401da0:	01010113          	addi	sp,sp,16
fc401da4:	00000317          	auipc	t1,0x0
fc401da8:	e0430067          	jr	-508(t1) # fc401ba8 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110>

fc401dac <_ZN4core3ptr18real_drop_in_place17hf2560ca8a7129e85E>:
fc401dac:	ff010113          	addi	sp,sp,-16
fc401db0:	00112623          	sw	ra,12(sp)
fc401db4:	00812423          	sw	s0,8(sp)
fc401db8:	01010413          	addi	s0,sp,16
fc401dbc:	00812403          	lw	s0,8(sp)
fc401dc0:	00c12083          	lw	ra,12(sp)
fc401dc4:	01010113          	addi	sp,sp,16
fc401dc8:	00008067          	ret

fc401dcc <_ZN4core3fmt10ArgumentV110show_usize17h44568c26d5b16131E.llvm.6888356102653465869>:
fc401dcc:	ff010113          	addi	sp,sp,-16
fc401dd0:	00112623          	sw	ra,12(sp)
fc401dd4:	00812423          	sw	s0,8(sp)
fc401dd8:	01010413          	addi	s0,sp,16
fc401ddc:	00058613          	mv	a2,a1
fc401de0:	00052503          	lw	a0,0(a0)
fc401de4:	00100593          	li	a1,1
fc401de8:	00812403          	lw	s0,8(sp)
fc401dec:	00c12083          	lw	ra,12(sp)
fc401df0:	01010113          	addi	sp,sp,16
fc401df4:	00000317          	auipc	t1,0x0
fc401df8:	db430067          	jr	-588(t1) # fc401ba8 <_ZN4core3fmt3num3imp7fmt_u3217heefc26f1ee57506fE.llvm.7276170047363281110>

fc401dfc <_ZN59_$LT$core..fmt..Arguments$u20$as$u20$core..fmt..Display$GT$3fmt17hb638d6717f685e93E>:
fc401dfc:	fe010113          	addi	sp,sp,-32
fc401e00:	00112e23          	sw	ra,28(sp)
fc401e04:	00812c23          	sw	s0,24(sp)
fc401e08:	02010413          	addi	s0,sp,32
fc401e0c:	01c5a683          	lw	a3,28(a1)
fc401e10:	0185a583          	lw	a1,24(a1)
fc401e14:	01452603          	lw	a2,20(a0)
fc401e18:	fec42a23          	sw	a2,-12(s0)
fc401e1c:	01052603          	lw	a2,16(a0)
fc401e20:	fec42823          	sw	a2,-16(s0)
fc401e24:	00c52603          	lw	a2,12(a0)
fc401e28:	fec42623          	sw	a2,-20(s0)
fc401e2c:	00852603          	lw	a2,8(a0)
fc401e30:	fec42423          	sw	a2,-24(s0)
fc401e34:	00452603          	lw	a2,4(a0)
fc401e38:	fec42223          	sw	a2,-28(s0)
fc401e3c:	00052503          	lw	a0,0(a0)
fc401e40:	fea42023          	sw	a0,-32(s0)
fc401e44:	fe040613          	addi	a2,s0,-32
fc401e48:	00058513          	mv	a0,a1
fc401e4c:	00068593          	mv	a1,a3
fc401e50:	00000097          	auipc	ra,0x0
fc401e54:	018080e7          	jalr	24(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc401e58:	01812403          	lw	s0,24(sp)
fc401e5c:	01c12083          	lw	ra,28(sp)
fc401e60:	02010113          	addi	sp,sp,32
fc401e64:	00008067          	ret

fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>:
fc401e68:	f9010113          	addi	sp,sp,-112
fc401e6c:	06112623          	sw	ra,108(sp)
fc401e70:	06812423          	sw	s0,104(sp)
fc401e74:	06912223          	sw	s1,100(sp)
fc401e78:	07212023          	sw	s2,96(sp)
fc401e7c:	05312e23          	sw	s3,92(sp)
fc401e80:	05412c23          	sw	s4,88(sp)
fc401e84:	05512a23          	sw	s5,84(sp)
fc401e88:	05612823          	sw	s6,80(sp)
fc401e8c:	05712623          	sw	s7,76(sp)
fc401e90:	05812423          	sw	s8,72(sp)
fc401e94:	05912223          	sw	s9,68(sp)
fc401e98:	05a12023          	sw	s10,64(sp)
fc401e9c:	03b12e23          	sw	s11,60(sp)
fc401ea0:	07010413          	addi	s0,sp,112
fc401ea4:	01062b83          	lw	s7,16(a2)
fc401ea8:	01462683          	lw	a3,20(a2)
fc401eac:	00300713          	li	a4,3
fc401eb0:	fce40423          	sb	a4,-56(s0)
fc401eb4:	02000713          	li	a4,32
fc401eb8:	f8e42e23          	sw	a4,-100(s0)
fc401ebc:	fab42a23          	sw	a1,-76(s0)
fc401ec0:	faa42823          	sw	a0,-80(s0)
fc401ec4:	00369713          	slli	a4,a3,0x3
fc401ec8:	00eb8733          	add	a4,s7,a4
fc401ecc:	fae42e23          	sw	a4,-68(s0)
fc401ed0:	fcd42223          	sw	a3,-60(s0)
fc401ed4:	fd742023          	sw	s7,-64(s0)
fc401ed8:	fb742c23          	sw	s7,-72(s0)
fc401edc:	f8042c23          	sw	zero,-104(s0)
fc401ee0:	fa042423          	sw	zero,-88(s0)
fc401ee4:	fa042023          	sw	zero,-96(s0)
fc401ee8:	00862903          	lw	s2,8(a2)
fc401eec:	22090263          	beqz	s2,fc402110 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x2a8>
fc401ef0:	00c62683          	lw	a3,12(a2)
fc401ef4:	02400713          	li	a4,36
fc401ef8:	02e686b3          	mul	a3,a3,a4
fc401efc:	38e39737          	lui	a4,0x38e39
fc401f00:	e3970713          	addi	a4,a4,-455 # 38e38e39 <XLENB+0x38e38e35>
fc401f04:	02e6b6b3          	mulhu	a3,a3,a4
fc401f08:	0036d693          	srli	a3,a3,0x3
fc401f0c:	00462983          	lw	s3,4(a2)
fc401f10:	00098b13          	mv	s6,s3
fc401f14:	00d9e463          	bltu	s3,a3,fc401f1c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0xb4>
fc401f18:	00068b13          	mv	s6,a3
fc401f1c:	00062a03          	lw	s4,0(a2)
fc401f20:	260b0c63          	beqz	s6,fc402198 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x330>
fc401f24:	00c5a683          	lw	a3,12(a1)
fc401f28:	004a2603          	lw	a2,4(s4)
fc401f2c:	000a2583          	lw	a1,0(s4)
fc401f30:	000680e7          	jalr	a3
fc401f34:	00100a93          	li	s5,1
fc401f38:	28051a63          	bnez	a0,fc4021cc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x364>
fc401f3c:	00100b93          	li	s7,1
fc401f40:	00ca0c13          	addi	s8,s4,12
fc401f44:	01090493          	addi	s1,s2,16
fc401f48:	fc402537          	lui	a0,0xfc402
fc401f4c:	dcc50d13          	addi	s10,a0,-564 # fc401dcc <ebss+0xfffe2d2c>
fc401f50:	f9840913          	addi	s2,s0,-104
fc401f54:	00300d93          	li	s11,3
fc401f58:	00100c93          	li	s9,1
fc401f5c:	ff84a503          	lw	a0,-8(s1)
fc401f60:	f8a42e23          	sw	a0,-100(s0)
fc401f64:	01048503          	lb	a0,16(s1)
fc401f68:	fca40423          	sb	a0,-56(s0)
fc401f6c:	ffc4a503          	lw	a0,-4(s1)
fc401f70:	f8a42c23          	sw	a0,-104(s0)
fc401f74:	0084a503          	lw	a0,8(s1)
fc401f78:	06abc863          	blt	s7,a0,fc401fe8 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x180>
fc401f7c:	00c4a583          	lw	a1,12(s1)
fc401f80:	10051c63          	bnez	a0,fc402098 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x230>
fc401f84:	00100513          	li	a0,1
fc401f88:	fab42223          	sw	a1,-92(s0)
fc401f8c:	faa42023          	sw	a0,-96(s0)
fc401f90:	0004a503          	lw	a0,0(s1)
fc401f94:	08abd463          	bge	s7,a0,fc40201c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1b4>
fc401f98:	03b50063          	beq	a0,s11,fc401fb8 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x150>
fc401f9c:	fb842583          	lw	a1,-72(s0)
fc401fa0:	fbc42503          	lw	a0,-68(s0)
fc401fa4:	00a58a63          	beq	a1,a0,fc401fb8 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x150>
fc401fa8:	00858513          	addi	a0,a1,8
fc401fac:	faa42c23          	sw	a0,-72(s0)
fc401fb0:	0045a503          	lw	a0,4(a1)
fc401fb4:	13a50e63          	beq	a0,s10,fc4020f0 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x288>
fc401fb8:	00000513          	li	a0,0
fc401fbc:	fab42623          	sw	a1,-84(s0)
fc401fc0:	faa42423          	sw	a0,-88(s0)
fc401fc4:	ff04a503          	lw	a0,-16(s1)
fc401fc8:	07751863          	bne	a0,s7,fc402038 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1d0>
fc401fcc:	ff44a583          	lw	a1,-12(s1)
fc401fd0:	fc442603          	lw	a2,-60(s0)
fc401fd4:	22c5fc63          	bgeu	a1,a2,fc40220c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x3a4>
fc401fd8:	00359513          	slli	a0,a1,0x3
fc401fdc:	fc042583          	lw	a1,-64(s0)
fc401fe0:	00a58533          	add	a0,a1,a0
fc401fe4:	0680006f          	j	fc40204c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1e4>
fc401fe8:	03b50063          	beq	a0,s11,fc402008 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1a0>
fc401fec:	fb842583          	lw	a1,-72(s0)
fc401ff0:	fbc42503          	lw	a0,-68(s0)
fc401ff4:	00a58a63          	beq	a1,a0,fc402008 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1a0>
fc401ff8:	00858513          	addi	a0,a1,8
fc401ffc:	faa42c23          	sw	a0,-72(s0)
fc402000:	0045a503          	lw	a0,4(a1)
fc402004:	0ba50863          	beq	a0,s10,fc4020b4 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x24c>
fc402008:	00000513          	li	a0,0
fc40200c:	fab42223          	sw	a1,-92(s0)
fc402010:	faa42023          	sw	a0,-96(s0)
fc402014:	0004a503          	lw	a0,0(s1)
fc402018:	f8abc0e3          	blt	s7,a0,fc401f98 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x130>
fc40201c:	0044a583          	lw	a1,4(s1)
fc402020:	0a051a63          	bnez	a0,fc4020d4 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x26c>
fc402024:	00100513          	li	a0,1
fc402028:	fab42623          	sw	a1,-84(s0)
fc40202c:	faa42423          	sw	a0,-88(s0)
fc402030:	ff04a503          	lw	a0,-16(s1)
fc402034:	f9750ce3          	beq	a0,s7,fc401fcc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x164>
fc402038:	fb842503          	lw	a0,-72(s0)
fc40203c:	fbc42583          	lw	a1,-68(s0)
fc402040:	1eb50263          	beq	a0,a1,fc402224 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x3bc>
fc402044:	00850593          	addi	a1,a0,8
fc402048:	fab42c23          	sw	a1,-72(s0)
fc40204c:	00450593          	addi	a1,a0,4
fc402050:	00052503          	lw	a0,0(a0)
fc402054:	0005a603          	lw	a2,0(a1)
fc402058:	00090593          	mv	a1,s2
fc40205c:	000600e7          	jalr	a2
fc402060:	00100a93          	li	s5,1
fc402064:	16051463          	bnez	a0,fc4021cc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x364>
fc402068:	136cfa63          	bgeu	s9,s6,fc40219c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x334>
fc40206c:	fb442503          	lw	a0,-76(s0)
fc402070:	00c52683          	lw	a3,12(a0)
fc402074:	000c2603          	lw	a2,0(s8)
fc402078:	ffcc2583          	lw	a1,-4(s8)
fc40207c:	fb042503          	lw	a0,-80(s0)
fc402080:	000680e7          	jalr	a3
fc402084:	008c0c13          	addi	s8,s8,8
fc402088:	02448493          	addi	s1,s1,36
fc40208c:	001c8c93          	addi	s9,s9,1
fc402090:	ec0506e3          	beqz	a0,fc401f5c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0xf4>
fc402094:	1380006f          	j	fc4021cc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x364>
fc402098:	fc442603          	lw	a2,-60(s0)
fc40209c:	1ac5f063          	bgeu	a1,a2,fc40223c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x3d4>
fc4020a0:	00359513          	slli	a0,a1,0x3
fc4020a4:	fc042583          	lw	a1,-64(s0)
fc4020a8:	00a585b3          	add	a1,a1,a0
fc4020ac:	0045a503          	lw	a0,4(a1)
fc4020b0:	f5a51ce3          	bne	a0,s10,fc402008 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1a0>
fc4020b4:	00100513          	li	a0,1
fc4020b8:	0005a583          	lw	a1,0(a1)
fc4020bc:	0005a583          	lw	a1,0(a1)
fc4020c0:	fab42223          	sw	a1,-92(s0)
fc4020c4:	faa42023          	sw	a0,-96(s0)
fc4020c8:	0004a503          	lw	a0,0(s1)
fc4020cc:	ecabc6e3          	blt	s7,a0,fc401f98 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x130>
fc4020d0:	f4dff06f          	j	fc40201c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1b4>
fc4020d4:	fc442603          	lw	a2,-60(s0)
fc4020d8:	16c5f263          	bgeu	a1,a2,fc40223c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x3d4>
fc4020dc:	00359513          	slli	a0,a1,0x3
fc4020e0:	fc042583          	lw	a1,-64(s0)
fc4020e4:	00a585b3          	add	a1,a1,a0
fc4020e8:	0045a503          	lw	a0,4(a1)
fc4020ec:	eda516e3          	bne	a0,s10,fc401fb8 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x150>
fc4020f0:	00100513          	li	a0,1
fc4020f4:	0005a583          	lw	a1,0(a1)
fc4020f8:	0005a583          	lw	a1,0(a1)
fc4020fc:	fab42623          	sw	a1,-84(s0)
fc402100:	faa42423          	sw	a0,-88(s0)
fc402104:	ff04a503          	lw	a0,-16(s1)
fc402108:	ed7502e3          	beq	a0,s7,fc401fcc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x164>
fc40210c:	f2dff06f          	j	fc402038 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x1d0>
fc402110:	00462983          	lw	s3,4(a2)
fc402114:	00098b13          	mv	s6,s3
fc402118:	00d9e463          	bltu	s3,a3,fc402120 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x2b8>
fc40211c:	00068b13          	mv	s6,a3
fc402120:	00062a03          	lw	s4,0(a2)
fc402124:	060b0a63          	beqz	s6,fc402198 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x330>
fc402128:	00c5a683          	lw	a3,12(a1)
fc40212c:	004a2603          	lw	a2,4(s4)
fc402130:	000a2583          	lw	a1,0(s4)
fc402134:	000680e7          	jalr	a3
fc402138:	00100a93          	li	s5,1
fc40213c:	08051863          	bnez	a0,fc4021cc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x364>
fc402140:	00100a93          	li	s5,1
fc402144:	f9840913          	addi	s2,s0,-104
fc402148:	00000493          	li	s1,0
fc40214c:	00100c93          	li	s9,1
fc402150:	009b85b3          	add	a1,s7,s1
fc402154:	0005a503          	lw	a0,0(a1)
fc402158:	0045a603          	lw	a2,4(a1)
fc40215c:	00090593          	mv	a1,s2
fc402160:	000600e7          	jalr	a2
fc402164:	06051463          	bnez	a0,fc4021cc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x364>
fc402168:	036cfa63          	bgeu	s9,s6,fc40219c <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x334>
fc40216c:	009a0533          	add	a0,s4,s1
fc402170:	00c52603          	lw	a2,12(a0)
fc402174:	00852583          	lw	a1,8(a0)
fc402178:	fb442503          	lw	a0,-76(s0)
fc40217c:	00c52683          	lw	a3,12(a0)
fc402180:	fb042503          	lw	a0,-80(s0)
fc402184:	000680e7          	jalr	a3
fc402188:	00848493          	addi	s1,s1,8
fc40218c:	001c8c93          	addi	s9,s9,1
fc402190:	fc0500e3          	beqz	a0,fc402150 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x2e8>
fc402194:	0380006f          	j	fc4021cc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x364>
fc402198:	00000c93          	li	s9,0
fc40219c:	033cf663          	bgeu	s9,s3,fc4021c8 <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x360>
fc4021a0:	003c9513          	slli	a0,s9,0x3
fc4021a4:	00aa0533          	add	a0,s4,a0
fc4021a8:	00452603          	lw	a2,4(a0)
fc4021ac:	00052583          	lw	a1,0(a0)
fc4021b0:	fb442503          	lw	a0,-76(s0)
fc4021b4:	00c52683          	lw	a3,12(a0)
fc4021b8:	fb042503          	lw	a0,-80(s0)
fc4021bc:	000680e7          	jalr	a3
fc4021c0:	00100a93          	li	s5,1
fc4021c4:	00051463          	bnez	a0,fc4021cc <_ZN4core3fmt5write17h92d9c3fe00bde39aE+0x364>
fc4021c8:	00000a93          	li	s5,0
fc4021cc:	000a8513          	mv	a0,s5
fc4021d0:	03c12d83          	lw	s11,60(sp)
fc4021d4:	04012d03          	lw	s10,64(sp)
fc4021d8:	04412c83          	lw	s9,68(sp)
fc4021dc:	04812c03          	lw	s8,72(sp)
fc4021e0:	04c12b83          	lw	s7,76(sp)
fc4021e4:	05012b03          	lw	s6,80(sp)
fc4021e8:	05412a83          	lw	s5,84(sp)
fc4021ec:	05812a03          	lw	s4,88(sp)
fc4021f0:	05c12983          	lw	s3,92(sp)
fc4021f4:	06012903          	lw	s2,96(sp)
fc4021f8:	06412483          	lw	s1,100(sp)
fc4021fc:	06812403          	lw	s0,104(sp)
fc402200:	06c12083          	lw	ra,108(sp)
fc402204:	07010113          	addi	sp,sp,112
fc402208:	00008067          	ret
fc40220c:	fc408537          	lui	a0,0xfc408
fc402210:	c0050513          	addi	a0,a0,-1024 # fc407c00 <ebss+0xfffe8b60>
fc402214:	fffff097          	auipc	ra,0xfffff
fc402218:	f20080e7          	jalr	-224(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc40221c:	ffffe097          	auipc	ra,0xffffe
fc402220:	29c080e7          	jalr	668(ra) # fc4004b8 <abort>
fc402224:	fc408537          	lui	a0,0xfc408
fc402228:	b5c50513          	addi	a0,a0,-1188 # fc407b5c <ebss+0xfffe8abc>
fc40222c:	fffff097          	auipc	ra,0xfffff
fc402230:	e90080e7          	jalr	-368(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc402234:	ffffe097          	auipc	ra,0xffffe
fc402238:	284080e7          	jalr	644(ra) # fc4004b8 <abort>
fc40223c:	fc408537          	lui	a0,0xfc408
fc402240:	c1050513          	addi	a0,a0,-1008 # fc407c10 <ebss+0xfffe8b70>
fc402244:	fffff097          	auipc	ra,0xfffff
fc402248:	ef0080e7          	jalr	-272(ra) # fc401134 <_ZN4core9panicking18panic_bounds_check17ha0a54766cc3de5fdE>
fc40224c:	ffffe097          	auipc	ra,0xffffe
fc402250:	26c080e7          	jalr	620(ra) # fc4004b8 <abort>

fc402254 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE>:
fc402254:	fd010113          	addi	sp,sp,-48
fc402258:	02112623          	sw	ra,44(sp)
fc40225c:	02812423          	sw	s0,40(sp)
fc402260:	02912223          	sw	s1,36(sp)
fc402264:	03212023          	sw	s2,32(sp)
fc402268:	01312e23          	sw	s3,28(sp)
fc40226c:	01412c23          	sw	s4,24(sp)
fc402270:	01512a23          	sw	s5,20(sp)
fc402274:	01612823          	sw	s6,16(sp)
fc402278:	01712623          	sw	s7,12(sp)
fc40227c:	01812423          	sw	s8,8(sp)
fc402280:	01912223          	sw	s9,4(sp)
fc402284:	01a12023          	sw	s10,0(sp)
fc402288:	03010413          	addi	s0,sp,48
fc40228c:	00078913          	mv	s2,a5
fc402290:	00070993          	mv	s3,a4
fc402294:	00068a13          	mv	s4,a3
fc402298:	00060a93          	mv	s5,a2
fc40229c:	00050d13          	mv	s10,a0
fc4022a0:	04058c63          	beqz	a1,fc4022f8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0xa4>
fc4022a4:	000d2503          	lw	a0,0(s10)
fc4022a8:	00157593          	andi	a1,a0,1
fc4022ac:	00110b37          	lui	s6,0x110
fc4022b0:	00058463          	beqz	a1,fc4022b8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x64>
fc4022b4:	02b00b13          	li	s6,43
fc4022b8:	01258c33          	add	s8,a1,s2
fc4022bc:	00457593          	andi	a1,a0,4
fc4022c0:	04058663          	beqz	a1,fc40230c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0xb8>
fc4022c4:	080a0a63          	beqz	s4,fc402358 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x104>
fc4022c8:	000a0613          	mv	a2,s4
fc4022cc:	00000593          	li	a1,0
fc4022d0:	000a8693          	mv	a3,s5
fc4022d4:	0006c703          	lbu	a4,0(a3)
fc4022d8:	0c077713          	andi	a4,a4,192
fc4022dc:	08074713          	xori	a4,a4,128
fc4022e0:	00173713          	seqz	a4,a4
fc4022e4:	00e585b3          	add	a1,a1,a4
fc4022e8:	00168693          	addi	a3,a3,1
fc4022ec:	fff60613          	addi	a2,a2,-1
fc4022f0:	fe0612e3          	bnez	a2,fc4022d4 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x80>
fc4022f4:	0680006f          	j	fc40235c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x108>
fc4022f8:	02d00b13          	li	s6,45
fc4022fc:	000d2503          	lw	a0,0(s10)
fc402300:	00190c13          	addi	s8,s2,1
fc402304:	00457593          	andi	a1,a0,4
fc402308:	fa059ee3          	bnez	a1,fc4022c4 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x70>
fc40230c:	00000a93          	li	s5,0
fc402310:	008d2583          	lw	a1,8(s10)
fc402314:	00100b93          	li	s7,1
fc402318:	05759c63          	bne	a1,s7,fc402370 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x11c>
fc40231c:	00cd2c83          	lw	s9,12(s10)
fc402320:	059c7863          	bgeu	s8,s9,fc402370 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x11c>
fc402324:	00857513          	andi	a0,a0,8
fc402328:	0a051e63          	bnez	a0,fc4023e4 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x190>
fc40232c:	030d4603          	lbu	a2,48(s10)
fc402330:	00100593          	li	a1,1
fc402334:	00300693          	li	a3,3
fc402338:	00100513          	li	a0,1
fc40233c:	00d60463          	beq	a2,a3,fc402344 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0xf0>
fc402340:	00060513          	mv	a0,a2
fc402344:	418c8cb3          	sub	s9,s9,s8
fc402348:	0ea5ca63          	blt	a1,a0,fc40243c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x1e8>
fc40234c:	10051463          	bnez	a0,fc402454 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x200>
fc402350:	00000513          	li	a0,0
fc402354:	1080006f          	j	fc40245c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x208>
fc402358:	00000593          	li	a1,0
fc40235c:	014c0633          	add	a2,s8,s4
fc402360:	40b60c33          	sub	s8,a2,a1
fc402364:	008d2583          	lw	a1,8(s10)
fc402368:	00100b93          	li	s7,1
fc40236c:	fb7588e3          	beq	a1,s7,fc40231c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0xc8>
fc402370:	000d0513          	mv	a0,s10
fc402374:	000b0593          	mv	a1,s6
fc402378:	000a8613          	mv	a2,s5
fc40237c:	000a0693          	mv	a3,s4
fc402380:	00000097          	auipc	ra,0x0
fc402384:	214080e7          	jalr	532(ra) # fc402594 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E>
fc402388:	02051063          	bnez	a0,fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc40238c:	018d2503          	lw	a0,24(s10)
fc402390:	01cd2583          	lw	a1,28(s10)
fc402394:	00c5a683          	lw	a3,12(a1)
fc402398:	00098593          	mv	a1,s3
fc40239c:	00090613          	mv	a2,s2
fc4023a0:	000680e7          	jalr	a3
fc4023a4:	00050b93          	mv	s7,a0
fc4023a8:	000b8513          	mv	a0,s7
fc4023ac:	00012d03          	lw	s10,0(sp)
fc4023b0:	00412c83          	lw	s9,4(sp)
fc4023b4:	00812c03          	lw	s8,8(sp)
fc4023b8:	00c12b83          	lw	s7,12(sp)
fc4023bc:	01012b03          	lw	s6,16(sp)
fc4023c0:	01412a83          	lw	s5,20(sp)
fc4023c4:	01812a03          	lw	s4,24(sp)
fc4023c8:	01c12983          	lw	s3,28(sp)
fc4023cc:	02012903          	lw	s2,32(sp)
fc4023d0:	02412483          	lw	s1,36(sp)
fc4023d4:	02812403          	lw	s0,40(sp)
fc4023d8:	02c12083          	lw	ra,44(sp)
fc4023dc:	03010113          	addi	sp,sp,48
fc4023e0:	00008067          	ret
fc4023e4:	03000513          	li	a0,48
fc4023e8:	00ad2223          	sw	a0,4(s10)
fc4023ec:	00100b93          	li	s7,1
fc4023f0:	037d0823          	sb	s7,48(s10)
fc4023f4:	000d0513          	mv	a0,s10
fc4023f8:	000b0593          	mv	a1,s6
fc4023fc:	000a8613          	mv	a2,s5
fc402400:	000a0693          	mv	a3,s4
fc402404:	00000097          	auipc	ra,0x0
fc402408:	190080e7          	jalr	400(ra) # fc402594 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E>
fc40240c:	f8051ee3          	bnez	a0,fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc402410:	030d4603          	lbu	a2,48(s10)
fc402414:	00100593          	li	a1,1
fc402418:	00300693          	li	a3,3
fc40241c:	00100513          	li	a0,1
fc402420:	00d60463          	beq	a2,a3,fc402428 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x1d4>
fc402424:	00060513          	mv	a0,a2
fc402428:	418c8ab3          	sub	s5,s9,s8
fc40242c:	0ca5c263          	blt	a1,a0,fc4024f0 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x29c>
fc402430:	0c051c63          	bnez	a0,fc402508 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x2b4>
fc402434:	00000513          	li	a0,0
fc402438:	0d80006f          	j	fc402510 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x2bc>
fc40243c:	00200593          	li	a1,2
fc402440:	00b51a63          	bne	a0,a1,fc402454 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x200>
fc402444:	001cd513          	srli	a0,s9,0x1
fc402448:	001c8593          	addi	a1,s9,1
fc40244c:	0015dc93          	srli	s9,a1,0x1
fc402450:	00c0006f          	j	fc40245c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x208>
fc402454:	000c8513          	mv	a0,s9
fc402458:	00000c93          	li	s9,0
fc40245c:	00150493          	addi	s1,a0,1
fc402460:	fff48493          	addi	s1,s1,-1
fc402464:	02048063          	beqz	s1,fc402484 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x230>
fc402468:	004d2583          	lw	a1,4(s10)
fc40246c:	018d2503          	lw	a0,24(s10)
fc402470:	01cd2603          	lw	a2,28(s10)
fc402474:	01062603          	lw	a2,16(a2)
fc402478:	000600e7          	jalr	a2
fc40247c:	fe0502e3          	beqz	a0,fc402460 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x20c>
fc402480:	0b40006f          	j	fc402534 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x2e0>
fc402484:	004d2c03          	lw	s8,4(s10)
fc402488:	000d0513          	mv	a0,s10
fc40248c:	000b0593          	mv	a1,s6
fc402490:	000a8613          	mv	a2,s5
fc402494:	000a0693          	mv	a3,s4
fc402498:	00000097          	auipc	ra,0x0
fc40249c:	0fc080e7          	jalr	252(ra) # fc402594 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E>
fc4024a0:	00100b93          	li	s7,1
fc4024a4:	f00512e3          	bnez	a0,fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc4024a8:	018d2503          	lw	a0,24(s10)
fc4024ac:	01cd2583          	lw	a1,28(s10)
fc4024b0:	00c5a683          	lw	a3,12(a1)
fc4024b4:	00098593          	mv	a1,s3
fc4024b8:	00090613          	mv	a2,s2
fc4024bc:	000680e7          	jalr	a3
fc4024c0:	ee0514e3          	bnez	a0,fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc4024c4:	001c8493          	addi	s1,s9,1
fc4024c8:	01cd2983          	lw	s3,28(s10)
fc4024cc:	018d2903          	lw	s2,24(s10)
fc4024d0:	fff48493          	addi	s1,s1,-1
fc4024d4:	0a048c63          	beqz	s1,fc40258c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x338>
fc4024d8:	0109a603          	lw	a2,16(s3)
fc4024dc:	00090513          	mv	a0,s2
fc4024e0:	000c0593          	mv	a1,s8
fc4024e4:	000600e7          	jalr	a2
fc4024e8:	fe0504e3          	beqz	a0,fc4024d0 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x27c>
fc4024ec:	ebdff06f          	j	fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc4024f0:	00200593          	li	a1,2
fc4024f4:	00b51a63          	bne	a0,a1,fc402508 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x2b4>
fc4024f8:	001ad513          	srli	a0,s5,0x1
fc4024fc:	001a8593          	addi	a1,s5,1
fc402500:	0015da93          	srli	s5,a1,0x1
fc402504:	00c0006f          	j	fc402510 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x2bc>
fc402508:	000a8513          	mv	a0,s5
fc40250c:	00000a93          	li	s5,0
fc402510:	00150493          	addi	s1,a0,1
fc402514:	fff48493          	addi	s1,s1,-1
fc402518:	02048263          	beqz	s1,fc40253c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x2e8>
fc40251c:	004d2583          	lw	a1,4(s10)
fc402520:	018d2503          	lw	a0,24(s10)
fc402524:	01cd2603          	lw	a2,28(s10)
fc402528:	01062603          	lw	a2,16(a2)
fc40252c:	000600e7          	jalr	a2
fc402530:	fe0502e3          	beqz	a0,fc402514 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x2c0>
fc402534:	00100b93          	li	s7,1
fc402538:	e71ff06f          	j	fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc40253c:	004d2a03          	lw	s4,4(s10)
fc402540:	018d2503          	lw	a0,24(s10)
fc402544:	01cd2583          	lw	a1,28(s10)
fc402548:	00c5a683          	lw	a3,12(a1)
fc40254c:	00098593          	mv	a1,s3
fc402550:	00090613          	mv	a2,s2
fc402554:	000680e7          	jalr	a3
fc402558:	00100b93          	li	s7,1
fc40255c:	e40516e3          	bnez	a0,fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc402560:	001a8493          	addi	s1,s5,1
fc402564:	01cd2983          	lw	s3,28(s10)
fc402568:	018d2903          	lw	s2,24(s10)
fc40256c:	fff48493          	addi	s1,s1,-1
fc402570:	00048e63          	beqz	s1,fc40258c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x338>
fc402574:	0109a603          	lw	a2,16(s3)
fc402578:	00090513          	mv	a0,s2
fc40257c:	000a0593          	mv	a1,s4
fc402580:	000600e7          	jalr	a2
fc402584:	fe0504e3          	beqz	a0,fc40256c <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x318>
fc402588:	e21ff06f          	j	fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>
fc40258c:	00000b93          	li	s7,0
fc402590:	e19ff06f          	j	fc4023a8 <_ZN4core3fmt9Formatter12pad_integral17h2e49506b179504daE+0x154>

fc402594 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E>:
fc402594:	fe010113          	addi	sp,sp,-32
fc402598:	00112e23          	sw	ra,28(sp)
fc40259c:	00812c23          	sw	s0,24(sp)
fc4025a0:	00912a23          	sw	s1,20(sp)
fc4025a4:	01212823          	sw	s2,16(sp)
fc4025a8:	01312623          	sw	s3,12(sp)
fc4025ac:	02010413          	addi	s0,sp,32
fc4025b0:	00068913          	mv	s2,a3
fc4025b4:	00060993          	mv	s3,a2
fc4025b8:	00050493          	mv	s1,a0
fc4025bc:	00110537          	lui	a0,0x110
fc4025c0:	02a58063          	beq	a1,a0,fc4025e0 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E+0x4c>
fc4025c4:	0184a503          	lw	a0,24(s1)
fc4025c8:	01c4a603          	lw	a2,28(s1)
fc4025cc:	01062603          	lw	a2,16(a2)
fc4025d0:	000600e7          	jalr	a2
fc4025d4:	00050593          	mv	a1,a0
fc4025d8:	00100513          	li	a0,1
fc4025dc:	02059463          	bnez	a1,fc402604 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E+0x70>
fc4025e0:	02098063          	beqz	s3,fc402600 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E+0x6c>
fc4025e4:	0184a503          	lw	a0,24(s1)
fc4025e8:	01c4a583          	lw	a1,28(s1)
fc4025ec:	00c5a683          	lw	a3,12(a1)
fc4025f0:	00098593          	mv	a1,s3
fc4025f4:	00090613          	mv	a2,s2
fc4025f8:	000680e7          	jalr	a3
fc4025fc:	0080006f          	j	fc402604 <_ZN4core3fmt9Formatter12pad_integral12write_prefix17heb3e24b873d9d2f8E+0x70>
fc402600:	00000513          	li	a0,0
fc402604:	00c12983          	lw	s3,12(sp)
fc402608:	01012903          	lw	s2,16(sp)
fc40260c:	01412483          	lw	s1,20(sp)
fc402610:	01812403          	lw	s0,24(sp)
fc402614:	01c12083          	lw	ra,28(sp)
fc402618:	02010113          	addi	sp,sp,32
fc40261c:	00008067          	ret

fc402620 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE>:
fc402620:	fe010113          	addi	sp,sp,-32
fc402624:	00112e23          	sw	ra,28(sp)
fc402628:	00812c23          	sw	s0,24(sp)
fc40262c:	00912a23          	sw	s1,20(sp)
fc402630:	01212823          	sw	s2,16(sp)
fc402634:	01312623          	sw	s3,12(sp)
fc402638:	01412423          	sw	s4,8(sp)
fc40263c:	01512223          	sw	s5,4(sp)
fc402640:	01612023          	sw	s6,0(sp)
fc402644:	02010413          	addi	s0,sp,32
fc402648:	00060993          	mv	s3,a2
fc40264c:	00058913          	mv	s2,a1
fc402650:	00050b13          	mv	s6,a0
fc402654:	01052503          	lw	a0,16(a0) # 110010 <XLENB+0x11000c>
fc402658:	008b2383          	lw	t2,8(s6) # 110008 <XLENB+0x110004>
fc40265c:	00100593          	li	a1,1
fc402660:	00b39663          	bne	t2,a1,fc40266c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x4c>
fc402664:	00b50663          	beq	a0,a1,fc402670 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x50>
fc402668:	0540006f          	j	fc4026bc <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x9c>
fc40266c:	2eb51663          	bne	a0,a1,fc402958 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x338>
fc402670:	04098063          	beqz	s3,fc4026b0 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x90>
fc402674:	013904b3          	add	s1,s2,s3
fc402678:	014b2603          	lw	a2,20(s6)
fc40267c:	00190513          	addi	a0,s2,1
fc402680:	00090583          	lb	a1,0(s2)
fc402684:	fff00693          	li	a3,-1
fc402688:	22b6dc63          	bge	a3,a1,fc4028c0 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x2a0>
fc40268c:	26060863          	beqz	a2,fc4028fc <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x2dc>
fc402690:	412506b3          	sub	a3,a0,s2
fc402694:	fff00e13          	li	t3,-1
fc402698:	0df00813          	li	a6,223
fc40269c:	0f000893          	li	a7,240
fc4026a0:	001c02b7          	lui	t0,0x1c0
fc4026a4:	00110337          	lui	t1,0x110
fc4026a8:	0ea49e63          	bne	s1,a0,fc4027a4 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x184>
fc4026ac:	2a40006f          	j	fc402950 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x330>
fc4026b0:	00000993          	li	s3,0
fc4026b4:	00100513          	li	a0,1
fc4026b8:	2aa39063          	bne	t2,a0,fc402958 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x338>
fc4026bc:	08098e63          	beqz	s3,fc402758 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x138>
fc4026c0:	00098593          	mv	a1,s3
fc4026c4:	00000513          	li	a0,0
fc4026c8:	00090613          	mv	a2,s2
fc4026cc:	00064683          	lbu	a3,0(a2)
fc4026d0:	0c06f693          	andi	a3,a3,192
fc4026d4:	0806c693          	xori	a3,a3,128
fc4026d8:	0016b693          	seqz	a3,a3
fc4026dc:	00d50533          	add	a0,a0,a3
fc4026e0:	00160613          	addi	a2,a2,1
fc4026e4:	fff58593          	addi	a1,a1,-1
fc4026e8:	fe0592e3          	bnez	a1,fc4026cc <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0xac>
fc4026ec:	40a985b3          	sub	a1,s3,a0
fc4026f0:	00cb2503          	lw	a0,12(s6)
fc4026f4:	26a5f263          	bgeu	a1,a0,fc402958 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x338>
fc4026f8:	22098863          	beqz	s3,fc402928 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x308>
fc4026fc:	00098613          	mv	a2,s3
fc402700:	00000593          	li	a1,0
fc402704:	00090693          	mv	a3,s2
fc402708:	0006c703          	lbu	a4,0(a3)
fc40270c:	0c077713          	andi	a4,a4,192
fc402710:	08074713          	xori	a4,a4,128
fc402714:	00173713          	seqz	a4,a4
fc402718:	00e585b3          	add	a1,a1,a4
fc40271c:	00168693          	addi	a3,a3,1
fc402720:	fff60613          	addi	a2,a2,-1
fc402724:	fe0612e3          	bnez	a2,fc402708 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0xe8>
fc402728:	030b4683          	lbu	a3,48(s6)
fc40272c:	00300713          	li	a4,3
fc402730:	00000613          	li	a2,0
fc402734:	00e68463          	beq	a3,a4,fc40273c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x11c>
fc402738:	00068613          	mv	a2,a3
fc40273c:	413585b3          	sub	a1,a1,s3
fc402740:	00a58ab3          	add	s5,a1,a0
fc402744:	00100513          	li	a0,1
fc402748:	0cc54e63          	blt	a0,a2,fc402824 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x204>
fc40274c:	0e061863          	bnez	a2,fc40283c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x21c>
fc402750:	00000513          	li	a0,0
fc402754:	0f00006f          	j	fc402844 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x224>
fc402758:	00000513          	li	a0,0
fc40275c:	40a985b3          	sub	a1,s3,a0
fc402760:	00cb2503          	lw	a0,12(s6)
fc402764:	f8a5eae3          	bltu	a1,a0,fc4026f8 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0xd8>
fc402768:	1f00006f          	j	fc402958 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x338>
fc40276c:	00158513          	addi	a0,a1,1
fc402770:	0005c583          	lbu	a1,0(a1)
fc402774:	03f5ff13          	andi	t5,a1,63
fc402778:	012f9793          	slli	a5,t6,0x12
fc40277c:	0057f7b3          	and	a5,a5,t0
fc402780:	006e9593          	slli	a1,t4,0x6
fc402784:	00f5e5b3          	or	a1,a1,a5
fc402788:	01e5e5b3          	or	a1,a1,t5
fc40278c:	1c658263          	beq	a1,t1,fc402950 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x330>
fc402790:	fff60613          	addi	a2,a2,-1
fc402794:	40d705b3          	sub	a1,a4,a3
fc402798:	00a586b3          	add	a3,a1,a0
fc40279c:	16060263          	beqz	a2,fc402900 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x2e0>
fc4027a0:	1aa48863          	beq	s1,a0,fc402950 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x330>
fc4027a4:	00068713          	mv	a4,a3
fc4027a8:	00050693          	mv	a3,a0
fc4027ac:	00150513          	addi	a0,a0,1
fc4027b0:	00068583          	lb	a1,0(a3)
fc4027b4:	fcbe4ee3          	blt	t3,a1,fc402790 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x170>
fc4027b8:	0ff5f793          	andi	a5,a1,255
fc4027bc:	04950463          	beq	a0,s1,fc402804 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x1e4>
fc4027c0:	00268513          	addi	a0,a3,2
fc4027c4:	0016c583          	lbu	a1,1(a3)
fc4027c8:	03f5fe93          	andi	t4,a1,63
fc4027cc:	00050593          	mv	a1,a0
fc4027d0:	fcf870e3          	bgeu	a6,a5,fc402790 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x170>
fc4027d4:	04958063          	beq	a1,s1,fc402814 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x1f4>
fc4027d8:	00158513          	addi	a0,a1,1
fc4027dc:	0005c583          	lbu	a1,0(a1)
fc4027e0:	03f5ff13          	andi	t5,a1,63
fc4027e4:	00050593          	mv	a1,a0
fc4027e8:	fb17e4e3          	bltu	a5,a7,fc402790 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x170>
fc4027ec:	01f7ff93          	andi	t6,a5,31
fc4027f0:	006e9793          	slli	a5,t4,0x6
fc4027f4:	00ff6eb3          	or	t4,t5,a5
fc4027f8:	f6959ae3          	bne	a1,s1,fc40276c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x14c>
fc4027fc:	00000f13          	li	t5,0
fc402800:	f79ff06f          	j	fc402778 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x158>
fc402804:	00048593          	mv	a1,s1
fc402808:	00000e93          	li	t4,0
fc40280c:	f8f872e3          	bgeu	a6,a5,fc402790 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x170>
fc402810:	fc5ff06f          	j	fc4027d4 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x1b4>
fc402814:	00048593          	mv	a1,s1
fc402818:	00000f13          	li	t5,0
fc40281c:	f717eae3          	bltu	a5,a7,fc402790 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x170>
fc402820:	fcdff06f          	j	fc4027ec <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x1cc>
fc402824:	00200513          	li	a0,2
fc402828:	00a61a63          	bne	a2,a0,fc40283c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x21c>
fc40282c:	001ad513          	srli	a0,s5,0x1
fc402830:	001a8593          	addi	a1,s5,1
fc402834:	0015da93          	srli	s5,a1,0x1
fc402838:	00c0006f          	j	fc402844 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x224>
fc40283c:	000a8513          	mv	a0,s5
fc402840:	00000a93          	li	s5,0
fc402844:	00150493          	addi	s1,a0,1
fc402848:	fff48493          	addi	s1,s1,-1
fc40284c:	02048263          	beqz	s1,fc402870 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x250>
fc402850:	004b2583          	lw	a1,4(s6)
fc402854:	018b2503          	lw	a0,24(s6)
fc402858:	01cb2603          	lw	a2,28(s6)
fc40285c:	01062603          	lw	a2,16(a2)
fc402860:	000600e7          	jalr	a2
fc402864:	fe0502e3          	beqz	a0,fc402848 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x228>
fc402868:	00100913          	li	s2,1
fc40286c:	1080006f          	j	fc402974 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x354>
fc402870:	004b2a03          	lw	s4,4(s6)
fc402874:	018b2503          	lw	a0,24(s6)
fc402878:	01cb2583          	lw	a1,28(s6)
fc40287c:	00c5a683          	lw	a3,12(a1)
fc402880:	00090593          	mv	a1,s2
fc402884:	00098613          	mv	a2,s3
fc402888:	000680e7          	jalr	a3
fc40288c:	00100913          	li	s2,1
fc402890:	0e051263          	bnez	a0,fc402974 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x354>
fc402894:	001a8493          	addi	s1,s5,1
fc402898:	01cb2a83          	lw	s5,28(s6)
fc40289c:	018b2983          	lw	s3,24(s6)
fc4028a0:	fff48493          	addi	s1,s1,-1
fc4028a4:	10048c63          	beqz	s1,fc4029bc <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x39c>
fc4028a8:	010aa603          	lw	a2,16(s5)
fc4028ac:	00098513          	mv	a0,s3
fc4028b0:	000a0593          	mv	a1,s4
fc4028b4:	000600e7          	jalr	a2
fc4028b8:	fe0504e3          	beqz	a0,fc4028a0 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x280>
fc4028bc:	0b80006f          	j	fc402974 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x354>
fc4028c0:	0ff5f693          	andi	a3,a1,255
fc4028c4:	00100593          	li	a1,1
fc4028c8:	0cb99c63          	bne	s3,a1,fc4029a0 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x380>
fc4028cc:	00048593          	mv	a1,s1
fc4028d0:	00000713          	li	a4,0
fc4028d4:	0df00793          	li	a5,223
fc4028d8:	dad7fae3          	bgeu	a5,a3,fc40268c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x6c>
fc4028dc:	0e958463          	beq	a1,s1,fc4029c4 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x3a4>
fc4028e0:	00158513          	addi	a0,a1,1
fc4028e4:	0005c583          	lbu	a1,0(a1)
fc4028e8:	03f5f813          	andi	a6,a1,63
fc4028ec:	00050593          	mv	a1,a0
fc4028f0:	0f000793          	li	a5,240
fc4028f4:	0ef6f063          	bgeu	a3,a5,fc4029d4 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x3b4>
fc4028f8:	d95ff06f          	j	fc40268c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x6c>
fc4028fc:	00000713          	li	a4,0
fc402900:	00070e63          	beqz	a4,fc40291c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x2fc>
fc402904:	01370c63          	beq	a4,s3,fc40291c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x2fc>
fc402908:	03377c63          	bgeu	a4,s3,fc402940 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x320>
fc40290c:	00e90533          	add	a0,s2,a4
fc402910:	00050503          	lb	a0,0(a0)
fc402914:	fc000593          	li	a1,-64
fc402918:	02b54463          	blt	a0,a1,fc402940 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x320>
fc40291c:	00090513          	mv	a0,s2
fc402920:	02050863          	beqz	a0,fc402950 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x330>
fc402924:	0240006f          	j	fc402948 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x328>
fc402928:	00000593          	li	a1,0
fc40292c:	030b4683          	lbu	a3,48(s6)
fc402930:	00300713          	li	a4,3
fc402934:	00000613          	li	a2,0
fc402938:	e0e690e3          	bne	a3,a4,fc402738 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x118>
fc40293c:	e01ff06f          	j	fc40273c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x11c>
fc402940:	00000513          	li	a0,0
fc402944:	00050663          	beqz	a0,fc402950 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x330>
fc402948:	00070993          	mv	s3,a4
fc40294c:	00050913          	mv	s2,a0
fc402950:	00100513          	li	a0,1
fc402954:	d6a384e3          	beq	t2,a0,fc4026bc <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x9c>
fc402958:	018b2503          	lw	a0,24(s6)
fc40295c:	01cb2583          	lw	a1,28(s6)
fc402960:	00c5a683          	lw	a3,12(a1)
fc402964:	00090593          	mv	a1,s2
fc402968:	00098613          	mv	a2,s3
fc40296c:	000680e7          	jalr	a3
fc402970:	00050913          	mv	s2,a0
fc402974:	00090513          	mv	a0,s2
fc402978:	00012b03          	lw	s6,0(sp)
fc40297c:	00412a83          	lw	s5,4(sp)
fc402980:	00812a03          	lw	s4,8(sp)
fc402984:	00c12983          	lw	s3,12(sp)
fc402988:	01012903          	lw	s2,16(sp)
fc40298c:	01412483          	lw	s1,20(sp)
fc402990:	01812403          	lw	s0,24(sp)
fc402994:	01c12083          	lw	ra,28(sp)
fc402998:	02010113          	addi	sp,sp,32
fc40299c:	00008067          	ret
fc4029a0:	00290513          	addi	a0,s2,2
fc4029a4:	00194583          	lbu	a1,1(s2)
fc4029a8:	03f5f713          	andi	a4,a1,63
fc4029ac:	00050593          	mv	a1,a0
fc4029b0:	0df00793          	li	a5,223
fc4029b4:	f2d7e4e3          	bltu	a5,a3,fc4028dc <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x2bc>
fc4029b8:	cd5ff06f          	j	fc40268c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x6c>
fc4029bc:	00000913          	li	s2,0
fc4029c0:	fb5ff06f          	j	fc402974 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x354>
fc4029c4:	00048593          	mv	a1,s1
fc4029c8:	00000813          	li	a6,0
fc4029cc:	0f000793          	li	a5,240
fc4029d0:	caf6eee3          	bltu	a3,a5,fc40268c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x6c>
fc4029d4:	01f6f693          	andi	a3,a3,31
fc4029d8:	00671713          	slli	a4,a4,0x6
fc4029dc:	00e86733          	or	a4,a6,a4
fc4029e0:	00958a63          	beq	a1,s1,fc4029f4 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x3d4>
fc4029e4:	00158513          	addi	a0,a1,1
fc4029e8:	0005c583          	lbu	a1,0(a1)
fc4029ec:	03f5f593          	andi	a1,a1,63
fc4029f0:	0080006f          	j	fc4029f8 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x3d8>
fc4029f4:	00000593          	li	a1,0
fc4029f8:	01269693          	slli	a3,a3,0x12
fc4029fc:	001c07b7          	lui	a5,0x1c0
fc402a00:	00f6f6b3          	and	a3,a3,a5
fc402a04:	00671713          	slli	a4,a4,0x6
fc402a08:	00d766b3          	or	a3,a4,a3
fc402a0c:	00b6e5b3          	or	a1,a3,a1
fc402a10:	001106b7          	lui	a3,0x110
fc402a14:	f2d58ee3          	beq	a1,a3,fc402950 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x330>
fc402a18:	c75ff06f          	j	fc40268c <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE+0x6c>

fc402a1c <_ZN4core3fmt9Formatter9alternate17h0035ebcf3bc23da9E>:
fc402a1c:	ff010113          	addi	sp,sp,-16
fc402a20:	00112623          	sw	ra,12(sp)
fc402a24:	00812423          	sw	s0,8(sp)
fc402a28:	01010413          	addi	s0,sp,16
fc402a2c:	00054503          	lbu	a0,0(a0)
fc402a30:	00457513          	andi	a0,a0,4
fc402a34:	00255513          	srli	a0,a0,0x2
fc402a38:	00812403          	lw	s0,8(sp)
fc402a3c:	00c12083          	lw	ra,12(sp)
fc402a40:	01010113          	addi	sp,sp,16
fc402a44:	00008067          	ret

fc402a48 <_ZN4core3fmt9Formatter15debug_lower_hex17h81d0e42eb02b2754E>:
fc402a48:	ff010113          	addi	sp,sp,-16
fc402a4c:	00112623          	sw	ra,12(sp)
fc402a50:	00812423          	sw	s0,8(sp)
fc402a54:	01010413          	addi	s0,sp,16
fc402a58:	00054503          	lbu	a0,0(a0)
fc402a5c:	01057513          	andi	a0,a0,16
fc402a60:	00455513          	srli	a0,a0,0x4
fc402a64:	00812403          	lw	s0,8(sp)
fc402a68:	00c12083          	lw	ra,12(sp)
fc402a6c:	01010113          	addi	sp,sp,16
fc402a70:	00008067          	ret

fc402a74 <_ZN4core3fmt9Formatter15debug_upper_hex17h0a4339c6e2a93655E>:
fc402a74:	ff010113          	addi	sp,sp,-16
fc402a78:	00112623          	sw	ra,12(sp)
fc402a7c:	00812423          	sw	s0,8(sp)
fc402a80:	01010413          	addi	s0,sp,16
fc402a84:	00054503          	lbu	a0,0(a0)
fc402a88:	02057513          	andi	a0,a0,32
fc402a8c:	00555513          	srli	a0,a0,0x5
fc402a90:	00812403          	lw	s0,8(sp)
fc402a94:	00c12083          	lw	ra,12(sp)
fc402a98:	01010113          	addi	sp,sp,16
fc402a9c:	00008067          	ret

fc402aa0 <_ZN4core3fmt9Formatter12debug_struct17h94e731b2ac64d90aE>:
fc402aa0:	ff010113          	addi	sp,sp,-16
fc402aa4:	00112623          	sw	ra,12(sp)
fc402aa8:	00812423          	sw	s0,8(sp)
fc402aac:	00912223          	sw	s1,4(sp)
fc402ab0:	01212023          	sw	s2,0(sp)
fc402ab4:	01010413          	addi	s0,sp,16
fc402ab8:	00058913          	mv	s2,a1
fc402abc:	00050493          	mv	s1,a0
fc402ac0:	01c5a503          	lw	a0,28(a1)
fc402ac4:	00c52703          	lw	a4,12(a0)
fc402ac8:	0185a503          	lw	a0,24(a1)
fc402acc:	00060593          	mv	a1,a2
fc402ad0:	00068613          	mv	a2,a3
fc402ad4:	000700e7          	jalr	a4
fc402ad8:	000482a3          	sb	zero,5(s1)
fc402adc:	00a48223          	sb	a0,4(s1)
fc402ae0:	0124a023          	sw	s2,0(s1)
fc402ae4:	00012903          	lw	s2,0(sp)
fc402ae8:	00412483          	lw	s1,4(sp)
fc402aec:	00812403          	lw	s0,8(sp)
fc402af0:	00c12083          	lw	ra,12(sp)
fc402af4:	01010113          	addi	sp,sp,16
fc402af8:	00008067          	ret

fc402afc <_ZN4core3fmt9Formatter11debug_tuple17hc19b76b3cd1ae61aE>:
fc402afc:	fe010113          	addi	sp,sp,-32
fc402b00:	00112e23          	sw	ra,28(sp)
fc402b04:	00812c23          	sw	s0,24(sp)
fc402b08:	00912a23          	sw	s1,20(sp)
fc402b0c:	01212823          	sw	s2,16(sp)
fc402b10:	01312623          	sw	s3,12(sp)
fc402b14:	02010413          	addi	s0,sp,32
fc402b18:	00068913          	mv	s2,a3
fc402b1c:	00058993          	mv	s3,a1
fc402b20:	00050493          	mv	s1,a0
fc402b24:	01c5a503          	lw	a0,28(a1)
fc402b28:	00c52683          	lw	a3,12(a0)
fc402b2c:	0185a503          	lw	a0,24(a1)
fc402b30:	00060593          	mv	a1,a2
fc402b34:	00090613          	mv	a2,s2
fc402b38:	000680e7          	jalr	a3 # 110000 <XLENB+0x10fffc>
fc402b3c:	00a48423          	sb	a0,8(s1)
fc402b40:	0134a023          	sw	s3,0(s1)
fc402b44:	00193513          	seqz	a0,s2
fc402b48:	00a484a3          	sb	a0,9(s1)
fc402b4c:	0004a223          	sw	zero,4(s1)
fc402b50:	00c12983          	lw	s3,12(sp)
fc402b54:	01012903          	lw	s2,16(sp)
fc402b58:	01412483          	lw	s1,20(sp)
fc402b5c:	01812403          	lw	s0,24(sp)
fc402b60:	01c12083          	lw	ra,28(sp)
fc402b64:	02010113          	addi	sp,sp,32
fc402b68:	00008067          	ret

fc402b6c <_ZN4core3fmt9Formatter10debug_list17hc82fe61f61403e49E>:
fc402b6c:	ff010113          	addi	sp,sp,-16
fc402b70:	00112623          	sw	ra,12(sp)
fc402b74:	00812423          	sw	s0,8(sp)
fc402b78:	00912223          	sw	s1,4(sp)
fc402b7c:	01212023          	sw	s2,0(sp)
fc402b80:	01010413          	addi	s0,sp,16
fc402b84:	00058913          	mv	s2,a1
fc402b88:	00050493          	mv	s1,a0
fc402b8c:	01c5a503          	lw	a0,28(a1)
fc402b90:	00c52683          	lw	a3,12(a0)
fc402b94:	0185a503          	lw	a0,24(a1)
fc402b98:	fc4085b7          	lui	a1,0xfc408
fc402b9c:	c3a58593          	addi	a1,a1,-966 # fc407c3a <ebss+0xfffe8b9a>
fc402ba0:	00100613          	li	a2,1
fc402ba4:	000680e7          	jalr	a3
fc402ba8:	000482a3          	sb	zero,5(s1)
fc402bac:	00a48223          	sb	a0,4(s1)
fc402bb0:	0124a023          	sw	s2,0(s1)
fc402bb4:	00012903          	lw	s2,0(sp)
fc402bb8:	00412483          	lw	s1,4(sp)
fc402bbc:	00812403          	lw	s0,8(sp)
fc402bc0:	00c12083          	lw	ra,12(sp)
fc402bc4:	01010113          	addi	sp,sp,16
fc402bc8:	00008067          	ret

fc402bcc <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE>:
fc402bcc:	fd010113          	addi	sp,sp,-48
fc402bd0:	02112623          	sw	ra,44(sp)
fc402bd4:	02812423          	sw	s0,40(sp)
fc402bd8:	02912223          	sw	s1,36(sp)
fc402bdc:	03212023          	sw	s2,32(sp)
fc402be0:	01312e23          	sw	s3,28(sp)
fc402be4:	01412c23          	sw	s4,24(sp)
fc402be8:	01512a23          	sw	s5,20(sp)
fc402bec:	01612823          	sw	s6,16(sp)
fc402bf0:	01712623          	sw	s7,12(sp)
fc402bf4:	01812423          	sw	s8,8(sp)
fc402bf8:	01912223          	sw	s9,4(sp)
fc402bfc:	01a12023          	sw	s10,0(sp)
fc402c00:	03010413          	addi	s0,sp,48
fc402c04:	00058993          	mv	s3,a1
fc402c08:	00050493          	mv	s1,a0
fc402c0c:	0185a503          	lw	a0,24(a1)
fc402c10:	01c5a583          	lw	a1,28(a1)
fc402c14:	0105a603          	lw	a2,16(a1)
fc402c18:	02700593          	li	a1,39
fc402c1c:	000600e7          	jalr	a2
fc402c20:	00050593          	mv	a1,a0
fc402c24:	00100513          	li	a0,1
fc402c28:	1a059663          	bnez	a1,fc402dd4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x208>
fc402c2c:	00200a13          	li	s4,2
fc402c30:	0004a903          	lw	s2,0(s1)
fc402c34:	02100513          	li	a0,33
fc402c38:	03254263          	blt	a0,s2,fc402c5c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x90>
fc402c3c:	00900513          	li	a0,9
fc402c40:	08a90663          	beq	s2,a0,fc402ccc <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x100>
fc402c44:	00a00513          	li	a0,10
fc402c48:	08a90663          	beq	s2,a0,fc402cd4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x108>
fc402c4c:	00d00513          	li	a0,13
fc402c50:	02a91263          	bne	s2,a0,fc402c74 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0xa8>
fc402c54:	07200913          	li	s2,114
fc402c58:	0800006f          	j	fc402cd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x10c>
fc402c5c:	02200513          	li	a0,34
fc402c60:	06a90c63          	beq	s2,a0,fc402cd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x10c>
fc402c64:	02700513          	li	a0,39
fc402c68:	06a90863          	beq	s2,a0,fc402cd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x10c>
fc402c6c:	05c00513          	li	a0,92
fc402c70:	06a90463          	beq	s2,a0,fc402cd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x10c>
fc402c74:	fc407537          	lui	a0,0xfc407
fc402c78:	4c850513          	addi	a0,a0,1224 # fc4074c8 <ebss+0xfffe8428>
fc402c7c:	00090593          	mv	a1,s2
fc402c80:	fffff097          	auipc	ra,0xfffff
fc402c84:	c44080e7          	jalr	-956(ra) # fc4018c4 <_ZN4core7unicode9bool_trie8BoolTrie6lookup17h98aa268d69c753e5E>
fc402c88:	26051863          	bnez	a0,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402c8c:	01095513          	srli	a0,s2,0x10
fc402c90:	18051263          	bnez	a0,fc402e14 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x248>
fc402c94:	fc407537          	lui	a0,0xfc407
fc402c98:	96c50593          	addi	a1,a0,-1684 # fc40696c <ebss+0xfffe78cc>
fc402c9c:	fc407537          	lui	a0,0xfc407
fc402ca0:	9be50693          	addi	a3,a0,-1602 # fc4069be <ebss+0xfffe791e>
fc402ca4:	fc407537          	lui	a0,0xfc407
fc402ca8:	ae350793          	addi	a5,a0,-1309 # fc406ae3 <ebss+0xfffe7a43>
fc402cac:	00090513          	mv	a0,s2
fc402cb0:	02900613          	li	a2,41
fc402cb4:	12500713          	li	a4,293
fc402cb8:	13a00813          	li	a6,314
fc402cbc:	fffff097          	auipc	ra,0xfffff
fc402cc0:	d98080e7          	jalr	-616(ra) # fc401a54 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110>
fc402cc4:	22051663          	bnez	a0,fc402ef0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x324>
fc402cc8:	2300006f          	j	fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402ccc:	07400913          	li	s2,116
fc402cd0:	0080006f          	j	fc402cd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x10c>
fc402cd4:	06e00913          	li	s2,110
fc402cd8:	00200b13          	li	s6,2
fc402cdc:	00100493          	li	s1,1
fc402ce0:	00a00c13          	li	s8,10
fc402ce4:	00300c93          	li	s9,3
fc402ce8:	00400d13          	li	s10,4
fc402cec:	0344ca63          	blt	s1,s4,fc402d20 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x154>
fc402cf0:	0200006f          	j	fc402d10 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x144>
fc402cf4:	00100a13          	li	s4,1
fc402cf8:	0189a503          	lw	a0,24(s3)
fc402cfc:	01c9a603          	lw	a2,28(s3)
fc402d00:	01062603          	lw	a2,16(a2)
fc402d04:	000600e7          	jalr	a2
fc402d08:	10051263          	bnez	a0,fc402e0c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x240>
fc402d0c:	0144ca63          	blt	s1,s4,fc402d20 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x154>
fc402d10:	0a0a0863          	beqz	s4,fc402dc0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x1f4>
fc402d14:	00000a13          	li	s4,0
fc402d18:	00090593          	mv	a1,s2
fc402d1c:	fddff06f          	j	fc402cf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x12c>
fc402d20:	05c00593          	li	a1,92
fc402d24:	fd6a08e3          	beq	s4,s6,fc402cf4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x128>
fc402d28:	0ffbf613          	andi	a2,s7,255
fc402d2c:	00cb4e63          	blt	s6,a2,fc402d48 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x17c>
fc402d30:	08060863          	beqz	a2,fc402dc0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x1f4>
fc402d34:	02961863          	bne	a2,s1,fc402d64 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x198>
fc402d38:	07d00593          	li	a1,125
fc402d3c:	00300a13          	li	s4,3
fc402d40:	f00bfb93          	andi	s7,s7,-256
fc402d44:	fb5ff06f          	j	fc402cf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x12c>
fc402d48:	f00bf513          	andi	a0,s7,-256
fc402d4c:	05960063          	beq	a2,s9,fc402d8c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x1c0>
fc402d50:	05a61663          	bne	a2,s10,fc402d9c <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x1d0>
fc402d54:	07500593          	li	a1,117
fc402d58:	00300a13          	li	s4,3
fc402d5c:	00356b93          	ori	s7,a0,3
fc402d60:	f99ff06f          	j	fc402cf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x12c>
fc402d64:	002a9513          	slli	a0,s5,0x2
fc402d68:	01c57513          	andi	a0,a0,28
fc402d6c:	00a95533          	srl	a0,s2,a0
fc402d70:	00f57513          	andi	a0,a0,15
fc402d74:	03856a63          	bltu	a0,s8,fc402da8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x1dc>
fc402d78:	05750593          	addi	a1,a0,87
fc402d7c:	00300a13          	li	s4,3
fc402d80:	020a8a63          	beqz	s5,fc402db4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x1e8>
fc402d84:	fffa8a93          	addi	s5,s5,-1
fc402d88:	f71ff06f          	j	fc402cf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x12c>
fc402d8c:	07b00593          	li	a1,123
fc402d90:	00300a13          	li	s4,3
fc402d94:	00256b93          	ori	s7,a0,2
fc402d98:	f61ff06f          	j	fc402cf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x12c>
fc402d9c:	00300a13          	li	s4,3
fc402da0:	00456b93          	ori	s7,a0,4
fc402da4:	f55ff06f          	j	fc402cf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x12c>
fc402da8:	03056593          	ori	a1,a0,48
fc402dac:	00300a13          	li	s4,3
fc402db0:	fc0a9ae3          	bnez	s5,fc402d84 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x1b8>
fc402db4:	f00bf513          	andi	a0,s7,-256
fc402db8:	00156b93          	ori	s7,a0,1
fc402dbc:	f3dff06f          	j	fc402cf8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x12c>
fc402dc0:	0189a503          	lw	a0,24(s3)
fc402dc4:	01c9a583          	lw	a1,28(s3)
fc402dc8:	0105a603          	lw	a2,16(a1)
fc402dcc:	02700593          	li	a1,39
fc402dd0:	000600e7          	jalr	a2
fc402dd4:	00012d03          	lw	s10,0(sp)
fc402dd8:	00412c83          	lw	s9,4(sp)
fc402ddc:	00812c03          	lw	s8,8(sp)
fc402de0:	00c12b83          	lw	s7,12(sp)
fc402de4:	01012b03          	lw	s6,16(sp)
fc402de8:	01412a83          	lw	s5,20(sp)
fc402dec:	01812a03          	lw	s4,24(sp)
fc402df0:	01c12983          	lw	s3,28(sp)
fc402df4:	02012903          	lw	s2,32(sp)
fc402df8:	02412483          	lw	s1,36(sp)
fc402dfc:	02812403          	lw	s0,40(sp)
fc402e00:	02c12083          	lw	ra,44(sp)
fc402e04:	03010113          	addi	sp,sp,48
fc402e08:	00008067          	ret
fc402e0c:	00100513          	li	a0,1
fc402e10:	fc5ff06f          	j	fc402dd4 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x208>
fc402e14:	01195513          	srli	a0,s2,0x11
fc402e18:	02051e63          	bnez	a0,fc402e54 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x288>
fc402e1c:	fc407537          	lui	a0,0xfc407
fc402e20:	c1d50593          	addi	a1,a0,-995 # fc406c1d <ebss+0xfffe7b7d>
fc402e24:	fc407537          	lui	a0,0xfc407
fc402e28:	c6350693          	addi	a3,a0,-925 # fc406c63 <ebss+0xfffe7bc3>
fc402e2c:	fc407537          	lui	a0,0xfc407
fc402e30:	d0950793          	addi	a5,a0,-759 # fc406d09 <ebss+0xfffe7c69>
fc402e34:	00090513          	mv	a0,s2
fc402e38:	02300613          	li	a2,35
fc402e3c:	0a600713          	li	a4,166
fc402e40:	19800813          	li	a6,408
fc402e44:	fffff097          	auipc	ra,0xfffff
fc402e48:	c10080e7          	jalr	-1008(ra) # fc401a54 <_ZN4core7unicode9printable5check17hec478c8886e4ecddE.llvm.7276170047363281110>
fc402e4c:	0a051263          	bnez	a0,fc402ef0 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x324>
fc402e50:	0a80006f          	j	fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402e54:	fff20537          	lui	a0,0xfff20
fc402e58:	e1050513          	addi	a0,a0,-496 # fff1fe10 <ebss+0x3b00d70>
fc402e5c:	00a90533          	add	a0,s2,a0
fc402e60:	000305b7          	lui	a1,0x30
fc402e64:	e1058593          	addi	a1,a1,-496 # 2fe10 <XLENB+0x2fe0c>
fc402e68:	08b56863          	bltu	a0,a1,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402e6c:	fffd0537          	lui	a0,0xfffd0
fc402e70:	5e250513          	addi	a0,a0,1506 # fffd05e2 <ebss+0x3bb1542>
fc402e74:	00a90533          	add	a0,s2,a0
fc402e78:	000b05b7          	lui	a1,0xb0
fc402e7c:	6e258593          	addi	a1,a1,1762 # b06e2 <XLENB+0xb06de>
fc402e80:	06b56c63          	bltu	a0,a1,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402e84:	fffd1537          	lui	a0,0xfffd1
fc402e88:	41f50513          	addi	a0,a0,1055 # fffd141f <ebss+0x3bb237f>
fc402e8c:	00a90533          	add	a0,s2,a0
fc402e90:	000015b7          	lui	a1,0x1
fc402e94:	c1f58593          	addi	a1,a1,-993 # c1f <XLENB+0xc1b>
fc402e98:	06b56063          	bltu	a0,a1,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402e9c:	fffd3537          	lui	a0,0xfffd3
fc402ea0:	15e50513          	addi	a0,a0,350 # fffd315e <ebss+0x3bb40be>
fc402ea4:	00a90533          	add	a0,s2,a0
fc402ea8:	00e00593          	li	a1,14
fc402eac:	04b56663          	bltu	a0,a1,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402eb0:	00200537          	lui	a0,0x200
fc402eb4:	ffe50513          	addi	a0,a0,-2 # 1ffffe <XLENB+0x1ffffa>
fc402eb8:	00a97533          	and	a0,s2,a0
fc402ebc:	0002c5b7          	lui	a1,0x2c
fc402ec0:	81e58593          	addi	a1,a1,-2018 # 2b81e <XLENB+0x2b81a>
fc402ec4:	02b50a63          	beq	a0,a1,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402ec8:	fffd6537          	lui	a0,0xfffd6
fc402ecc:	92950513          	addi	a0,a0,-1751 # fffd5929 <ebss+0x3bb6889>
fc402ed0:	00a90533          	add	a0,s2,a0
fc402ed4:	02900593          	li	a1,41
fc402ed8:	02b56063          	bltu	a0,a1,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402edc:	fffd5537          	lui	a0,0xfffd5
fc402ee0:	8cb50513          	addi	a0,a0,-1845 # fffd48cb <ebss+0x3bb582b>
fc402ee4:	00a90533          	add	a0,s2,a0
fc402ee8:	00a00593          	li	a1,10
fc402eec:	00a5f663          	bgeu	a1,a0,fc402ef8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x32c>
fc402ef0:	00100a13          	li	s4,1
fc402ef4:	de5ff06f          	j	fc402cd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x10c>
fc402ef8:	00196513          	ori	a0,s2,1
fc402efc:	00155593          	srli	a1,a0,0x1
fc402f00:	00b56533          	or	a0,a0,a1
fc402f04:	00255593          	srli	a1,a0,0x2
fc402f08:	00b56533          	or	a0,a0,a1
fc402f0c:	00455593          	srli	a1,a0,0x4
fc402f10:	00b56533          	or	a0,a0,a1
fc402f14:	00855593          	srli	a1,a0,0x8
fc402f18:	00b56533          	or	a0,a0,a1
fc402f1c:	01055593          	srli	a1,a0,0x10
fc402f20:	00b56533          	or	a0,a0,a1
fc402f24:	555555b7          	lui	a1,0x55555
fc402f28:	55558593          	addi	a1,a1,1365 # 55555555 <XLENB+0x55555551>
fc402f2c:	fff54513          	not	a0,a0
fc402f30:	00155613          	srli	a2,a0,0x1
fc402f34:	00b675b3          	and	a1,a2,a1
fc402f38:	40b50533          	sub	a0,a0,a1
fc402f3c:	333335b7          	lui	a1,0x33333
fc402f40:	33358593          	addi	a1,a1,819 # 33333333 <XLENB+0x3333332f>
fc402f44:	00b57633          	and	a2,a0,a1
fc402f48:	00255513          	srli	a0,a0,0x2
fc402f4c:	00b57533          	and	a0,a0,a1
fc402f50:	00a60533          	add	a0,a2,a0
fc402f54:	00455593          	srli	a1,a0,0x4
fc402f58:	00b50533          	add	a0,a0,a1
fc402f5c:	0f0f15b7          	lui	a1,0xf0f1
fc402f60:	f0f58593          	addi	a1,a1,-241 # f0f0f0f <XLENB+0xf0f0f0b>
fc402f64:	00b57533          	and	a0,a0,a1
fc402f68:	010105b7          	lui	a1,0x1010
fc402f6c:	10158593          	addi	a1,a1,257 # 1010101 <XLENB+0x10100fd>
fc402f70:	02b50533          	mul	a0,a0,a1
fc402f74:	00500b93          	li	s7,5
fc402f78:	00300a13          	li	s4,3
fc402f7c:	01a55513          	srli	a0,a0,0x1a
fc402f80:	00754a93          	xori	s5,a0,7
fc402f84:	d55ff06f          	j	fc402cd8 <_ZN41_$LT$char$u20$as$u20$core..fmt..Debug$GT$3fmt17hc6342e01612d8bdfE+0x10c>

fc402f88 <_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17h0817227fd0aa64deE>:
fc402f88:	ff010113          	addi	sp,sp,-16
fc402f8c:	00112623          	sw	ra,12(sp)
fc402f90:	00812423          	sw	s0,8(sp)
fc402f94:	01010413          	addi	s0,sp,16
fc402f98:	0185a503          	lw	a0,24(a1)
fc402f9c:	01c5a583          	lw	a1,28(a1)
fc402fa0:	00c5a783          	lw	a5,12(a1)
fc402fa4:	fc4085b7          	lui	a1,0xfc408
fc402fa8:	c2058593          	addi	a1,a1,-992 # fc407c20 <ebss+0xfffe8b80>
fc402fac:	00500613          	li	a2,5
fc402fb0:	00812403          	lw	s0,8(sp)
fc402fb4:	00c12083          	lw	ra,12(sp)
fc402fb8:	01010113          	addi	sp,sp,16
fc402fbc:	00078067          	jr	a5 # 1c0000 <XLENB+0x1bfffc>

fc402fc0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h55692a30504e81a7E>:
fc402fc0:	ff010113          	addi	sp,sp,-16
fc402fc4:	00112623          	sw	ra,12(sp)
fc402fc8:	00812423          	sw	s0,8(sp)
fc402fcc:	01010413          	addi	s0,sp,16
fc402fd0:	00052603          	lw	a2,0(a0)
fc402fd4:	00452503          	lw	a0,4(a0)
fc402fd8:	00c52783          	lw	a5,12(a0)
fc402fdc:	00060513          	mv	a0,a2
fc402fe0:	00812403          	lw	s0,8(sp)
fc402fe4:	00c12083          	lw	ra,12(sp)
fc402fe8:	01010113          	addi	sp,sp,16
fc402fec:	00078067          	jr	a5

fc402ff0 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h076673aa03650c53E>:
fc402ff0:	ff010113          	addi	sp,sp,-16
fc402ff4:	00112623          	sw	ra,12(sp)
fc402ff8:	00812423          	sw	s0,8(sp)
fc402ffc:	01010413          	addi	s0,sp,16
fc403000:	00058693          	mv	a3,a1
fc403004:	00452603          	lw	a2,4(a0)
fc403008:	00052583          	lw	a1,0(a0)
fc40300c:	00068513          	mv	a0,a3
fc403010:	00812403          	lw	s0,8(sp)
fc403014:	00c12083          	lw	ra,12(sp)
fc403018:	01010113          	addi	sp,sp,16
fc40301c:	fffff317          	auipc	t1,0xfffff
fc403020:	60430067          	jr	1540(t1) # fc402620 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE>

fc403024 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h78eaf337a2d14e6bE>:
fc403024:	fe010113          	addi	sp,sp,-32
fc403028:	00112e23          	sw	ra,28(sp)
fc40302c:	00812c23          	sw	s0,24(sp)
fc403030:	02010413          	addi	s0,sp,32
fc403034:	01c5a683          	lw	a3,28(a1)
fc403038:	0185a583          	lw	a1,24(a1)
fc40303c:	00052503          	lw	a0,0(a0)
fc403040:	01452603          	lw	a2,20(a0)
fc403044:	fec42a23          	sw	a2,-12(s0)
fc403048:	01052603          	lw	a2,16(a0)
fc40304c:	fec42823          	sw	a2,-16(s0)
fc403050:	00c52603          	lw	a2,12(a0)
fc403054:	fec42623          	sw	a2,-20(s0)
fc403058:	00852603          	lw	a2,8(a0)
fc40305c:	fec42423          	sw	a2,-24(s0)
fc403060:	00452603          	lw	a2,4(a0)
fc403064:	fec42223          	sw	a2,-28(s0)
fc403068:	00052503          	lw	a0,0(a0)
fc40306c:	fea42023          	sw	a0,-32(s0)
fc403070:	fe040613          	addi	a2,s0,-32
fc403074:	00058513          	mv	a0,a1
fc403078:	00068593          	mv	a1,a3
fc40307c:	fffff097          	auipc	ra,0xfffff
fc403080:	dec080e7          	jalr	-532(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc403084:	01812403          	lw	s0,24(sp)
fc403088:	01c12083          	lw	ra,28(sp)
fc40308c:	02010113          	addi	sp,sp,32
fc403090:	00008067          	ret

fc403094 <_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h8fda4ae52766b991E>:
fc403094:	ff010113          	addi	sp,sp,-16
fc403098:	00112623          	sw	ra,12(sp)
fc40309c:	00812423          	sw	s0,8(sp)
fc4030a0:	01010413          	addi	s0,sp,16
fc4030a4:	00058693          	mv	a3,a1
fc4030a8:	00052503          	lw	a0,0(a0)
fc4030ac:	00452603          	lw	a2,4(a0)
fc4030b0:	00052583          	lw	a1,0(a0)
fc4030b4:	00068513          	mv	a0,a3
fc4030b8:	00812403          	lw	s0,8(sp)
fc4030bc:	00c12083          	lw	ra,12(sp)
fc4030c0:	01010113          	addi	sp,sp,16
fc4030c4:	fffff317          	auipc	t1,0xfffff
fc4030c8:	55c30067          	jr	1372(t1) # fc402620 <_ZN4core3fmt9Formatter3pad17h2b4a467874a2b37bE>

fc4030cc <_ZN4core3ptr18real_drop_in_place17h0838012fd3ac9836E>:
fc4030cc:	ff010113          	addi	sp,sp,-16
fc4030d0:	00112623          	sw	ra,12(sp)
fc4030d4:	00812423          	sw	s0,8(sp)
fc4030d8:	01010413          	addi	s0,sp,16
fc4030dc:	00812403          	lw	s0,8(sp)
fc4030e0:	00c12083          	lw	ra,12(sp)
fc4030e4:	01010113          	addi	sp,sp,16
fc4030e8:	00008067          	ret

fc4030ec <_ZN4core3str6traits103_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..RangeTo$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17hc874b5d1511343b8E>:
fc4030ec:	ff010113          	addi	sp,sp,-16
fc4030f0:	00112623          	sw	ra,12(sp)
fc4030f4:	00812423          	sw	s0,8(sp)
fc4030f8:	01010413          	addi	s0,sp,16
fc4030fc:	00058693          	mv	a3,a1
fc403100:	00452583          	lw	a1,4(a0)
fc403104:	00052503          	lw	a0,0(a0)
fc403108:	00000613          	li	a2,0
fc40310c:	ffffe097          	auipc	ra,0xffffe
fc403110:	2dc080e7          	jalr	732(ra) # fc4013e8 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE>
fc403114:	ffffd097          	auipc	ra,0xffffd
fc403118:	3a4080e7          	jalr	932(ra) # fc4004b8 <abort>

fc40311c <_ZN4core3str6traits105_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..RangeFrom$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17he25221f91c4f18dbE>:
fc40311c:	ff010113          	addi	sp,sp,-16
fc403120:	00112623          	sw	ra,12(sp)
fc403124:	00812423          	sw	s0,8(sp)
fc403128:	01010413          	addi	s0,sp,16
fc40312c:	00852583          	lw	a1,8(a0)
fc403130:	0005a683          	lw	a3,0(a1)
fc403134:	00452583          	lw	a1,4(a0)
fc403138:	0005a603          	lw	a2,0(a1)
fc40313c:	00052503          	lw	a0,0(a0)
fc403140:	00452583          	lw	a1,4(a0)
fc403144:	00052503          	lw	a0,0(a0)
fc403148:	ffffe097          	auipc	ra,0xffffe
fc40314c:	2a0080e7          	jalr	672(ra) # fc4013e8 <_ZN4core3str16slice_error_fail17h87a6c6c66f82c85eE>
fc403150:	ffffd097          	auipc	ra,0xffffd
fc403154:	368080e7          	jalr	872(ra) # fc4004b8 <abort>

fc403158 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E>:
fc403158:	f9010113          	addi	sp,sp,-112
fc40315c:	06112623          	sw	ra,108(sp)
fc403160:	06812423          	sw	s0,104(sp)
fc403164:	06912223          	sw	s1,100(sp)
fc403168:	07212023          	sw	s2,96(sp)
fc40316c:	05312e23          	sw	s3,92(sp)
fc403170:	05412c23          	sw	s4,88(sp)
fc403174:	05512a23          	sw	s5,84(sp)
fc403178:	05612823          	sw	s6,80(sp)
fc40317c:	05712623          	sw	s7,76(sp)
fc403180:	05812423          	sw	s8,72(sp)
fc403184:	05912223          	sw	s9,68(sp)
fc403188:	05a12023          	sw	s10,64(sp)
fc40318c:	03b12e23          	sw	s11,60(sp)
fc403190:	07010413          	addi	s0,sp,112
fc403194:	1c060463          	beqz	a2,fc40335c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x204>
fc403198:	00060b13          	mv	s6,a2
fc40319c:	00058a93          	mv	s5,a1
fc4031a0:	00050913          	mv	s2,a0
fc4031a4:	fc840993          	addi	s3,s0,-56
fc4031a8:	00a00b93          	li	s7,10
fc4031ac:	00100c13          	li	s8,1
fc4031b0:	fb040c93          	addi	s9,s0,-80
fc4031b4:	fc406537          	lui	a0,0xfc406
fc4031b8:	5fc50513          	addi	a0,a0,1532 # fc4065fc <ebss+0xfffe755c>
fc4031bc:	f8a42e23          	sw	a0,-100(s0)
fc4031c0:	00892503          	lw	a0,8(s2)
fc4031c4:	00054503          	lbu	a0,0(a0)
fc4031c8:	02051063          	bnez	a0,fc4031e8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x90>
fc4031cc:	0380006f          	j	fc403204 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0xac>
fc4031d0:	409b0b33          	sub	s6,s6,s1
fc4031d4:	000d8a93          	mv	s5,s11
fc4031d8:	180b0263          	beqz	s6,fc40335c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x204>
fc4031dc:	00892503          	lw	a0,8(s2)
fc4031e0:	00054503          	lbu	a0,0(a0)
fc4031e4:	02050063          	beqz	a0,fc403204 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0xac>
fc4031e8:	00092503          	lw	a0,0(s2)
fc4031ec:	00492583          	lw	a1,4(s2)
fc4031f0:	00c5a683          	lw	a3,12(a1)
fc4031f4:	f9c42583          	lw	a1,-100(s0)
fc4031f8:	00400613          	li	a2,4
fc4031fc:	000680e7          	jalr	a3
fc403200:	16051263          	bnez	a0,fc403364 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x20c>
fc403204:	fa042c23          	sw	zero,-72(s0)
fc403208:	fd742423          	sw	s7,-56(s0)
fc40320c:	fd842223          	sw	s8,-60(s0)
fc403210:	fd742023          	sw	s7,-64(s0)
fc403214:	fb642e23          	sw	s6,-68(s0)
fc403218:	fb642a23          	sw	s6,-76(s0)
fc40321c:	fb542823          	sw	s5,-80(s0)
fc403220:	00a00513          	li	a0,10
fc403224:	000a8593          	mv	a1,s5
fc403228:	000b0613          	mv	a2,s6
fc40322c:	ffffe097          	auipc	ra,0xffffe
fc403230:	064080e7          	jalr	100(ra) # fc401290 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E>
fc403234:	09851863          	bne	a0,s8,fc4032c4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x16c>
fc403238:	fb842503          	lw	a0,-72(s0)
fc40323c:	00a58533          	add	a0,a1,a0
fc403240:	00150d93          	addi	s11,a0,1
fc403244:	fbb42c23          	sw	s11,-72(s0)
fc403248:	fc442483          	lw	s1,-60(s0)
fc40324c:	029dfc63          	bgeu	s11,s1,fc403284 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x12c>
fc403250:	fb442a03          	lw	s4,-76(s0)
fc403254:	fbc42503          	lw	a0,-68(s0)
fc403258:	07b56a63          	bltu	a0,s11,fc4032cc <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x174>
fc40325c:	06aa6863          	bltu	s4,a0,fc4032cc <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x174>
fc403260:	fb042583          	lw	a1,-80(s0)
fc403264:	01b585b3          	add	a1,a1,s11
fc403268:	41b50633          	sub	a2,a0,s11
fc40326c:	01948533          	add	a0,s1,s9
fc403270:	01750503          	lb	a0,23(a0)
fc403274:	ffffe097          	auipc	ra,0xffffe
fc403278:	01c080e7          	jalr	28(ra) # fc401290 <_ZN4core5slice6memchr6memchr17h4d55ed56e643c700E>
fc40327c:	fb850ee3          	beq	a0,s8,fc403238 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0xe0>
fc403280:	0440006f          	j	fc4032c4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x16c>
fc403284:	fb442a03          	lw	s4,-76(s0)
fc403288:	03ba6863          	bltu	s4,s11,fc4032b8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x160>
fc40328c:	00500513          	li	a0,5
fc403290:	10a4fa63          	bgeu	s1,a0,fc4033a4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x24c>
fc403294:	409d8d33          	sub	s10,s11,s1
fc403298:	fb042503          	lw	a0,-80(s0)
fc40329c:	01a50533          	add	a0,a0,s10
fc4032a0:	0b350663          	beq	a0,s3,fc40334c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x1f4>
fc4032a4:	00098593          	mv	a1,s3
fc4032a8:	00048613          	mv	a2,s1
fc4032ac:	00001097          	auipc	ra,0x1
fc4032b0:	bc4080e7          	jalr	-1084(ra) # fc403e70 <bcmp>
fc4032b4:	08050c63          	beqz	a0,fc40334c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x1f4>
fc4032b8:	fbc42503          	lw	a0,-68(s0)
fc4032bc:	fbb570e3          	bgeu	a0,s11,fc40325c <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x104>
fc4032c0:	00c0006f          	j	fc4032cc <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x174>
fc4032c4:	fbc42503          	lw	a0,-68(s0)
fc4032c8:	faa42c23          	sw	a0,-72(s0)
fc4032cc:	00892503          	lw	a0,8(s2)
fc4032d0:	00050023          	sb	zero,0(a0)
fc4032d4:	000b0493          	mv	s1,s6
fc4032d8:	00492583          	lw	a1,4(s2)
fc4032dc:	00092503          	lw	a0,0(s2)
fc4032e0:	fb542823          	sw	s5,-80(s0)
fc4032e4:	fb642a23          	sw	s6,-76(s0)
fc4032e8:	009b4633          	xor	a2,s6,s1
fc4032ec:	00163613          	seqz	a2,a2
fc4032f0:	0014b693          	seqz	a3,s1
fc4032f4:	00c6ea33          	or	s4,a3,a2
fc4032f8:	009a8db3          	add	s11,s5,s1
fc4032fc:	000a1a63          	bnez	s4,fc403310 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x1b8>
fc403300:	0b64fe63          	bgeu	s1,s6,fc4033bc <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x264>
fc403304:	000d8603          	lb	a2,0(s11)
fc403308:	fbf00693          	li	a3,-65
fc40330c:	0ac6d863          	bge	a3,a2,fc4033bc <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x264>
fc403310:	00c5a683          	lw	a3,12(a1)
fc403314:	000a8593          	mv	a1,s5
fc403318:	00048613          	mv	a2,s1
fc40331c:	000680e7          	jalr	a3
fc403320:	04051263          	bnez	a0,fc403364 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x20c>
fc403324:	fb542023          	sw	s5,-96(s0)
fc403328:	fb642223          	sw	s6,-92(s0)
fc40332c:	fa942423          	sw	s1,-88(s0)
fc403330:	fb642623          	sw	s6,-84(s0)
fc403334:	e80a1ee3          	bnez	s4,fc4031d0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x78>
fc403338:	0964fe63          	bgeu	s1,s6,fc4033d4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x27c>
fc40333c:	000d8503          	lb	a0,0(s11)
fc403340:	fbf00593          	li	a1,-65
fc403344:	e8a5c6e3          	blt	a1,a0,fc4031d0 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x78>
fc403348:	08c0006f          	j	fc4033d4 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x27c>
fc40334c:	00892503          	lw	a0,8(s2)
fc403350:	01850023          	sb	s8,0(a0)
fc403354:	001d0493          	addi	s1,s10,1
fc403358:	f81ff06f          	j	fc4032d8 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x180>
fc40335c:	00000513          	li	a0,0
fc403360:	0080006f          	j	fc403368 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E+0x210>
fc403364:	00100513          	li	a0,1
fc403368:	03c12d83          	lw	s11,60(sp)
fc40336c:	04012d03          	lw	s10,64(sp)
fc403370:	04412c83          	lw	s9,68(sp)
fc403374:	04812c03          	lw	s8,72(sp)
fc403378:	04c12b83          	lw	s7,76(sp)
fc40337c:	05012b03          	lw	s6,80(sp)
fc403380:	05412a83          	lw	s5,84(sp)
fc403384:	05812a03          	lw	s4,88(sp)
fc403388:	05c12983          	lw	s3,92(sp)
fc40338c:	06012903          	lw	s2,96(sp)
fc403390:	06412483          	lw	s1,100(sp)
fc403394:	06812403          	lw	s0,104(sp)
fc403398:	06c12083          	lw	ra,108(sp)
fc40339c:	07010113          	addi	sp,sp,112
fc4033a0:	00008067          	ret
fc4033a4:	00048513          	mv	a0,s1
fc4033a8:	00400593          	li	a1,4
fc4033ac:	ffffe097          	auipc	ra,0xffffe
fc4033b0:	428080e7          	jalr	1064(ra) # fc4017d4 <_ZN4core5slice20slice_index_len_fail17h5666f5f91c34d162E>
fc4033b4:	ffffd097          	auipc	ra,0xffffd
fc4033b8:	104080e7          	jalr	260(ra) # fc4004b8 <abort>
fc4033bc:	fb040513          	addi	a0,s0,-80
fc4033c0:	00048593          	mv	a1,s1
fc4033c4:	00000097          	auipc	ra,0x0
fc4033c8:	d28080e7          	jalr	-728(ra) # fc4030ec <_ZN4core3str6traits103_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..RangeTo$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17hc874b5d1511343b8E>
fc4033cc:	ffffd097          	auipc	ra,0xffffd
fc4033d0:	0ec080e7          	jalr	236(ra) # fc4004b8 <abort>
fc4033d4:	fac40513          	addi	a0,s0,-84
fc4033d8:	faa42c23          	sw	a0,-72(s0)
fc4033dc:	fa840513          	addi	a0,s0,-88
fc4033e0:	faa42a23          	sw	a0,-76(s0)
fc4033e4:	fa040513          	addi	a0,s0,-96
fc4033e8:	faa42823          	sw	a0,-80(s0)
fc4033ec:	fb040513          	addi	a0,s0,-80
fc4033f0:	00000097          	auipc	ra,0x0
fc4033f4:	d2c080e7          	jalr	-724(ra) # fc40311c <_ZN4core3str6traits105_$LT$impl$u20$core..slice..SliceIndex$LT$str$GT$$u20$for$u20$core..ops..range..RangeFrom$LT$usize$GT$$GT$5index28_$u7b$$u7b$closure$u7d$$u7d$17he25221f91c4f18dbE>
fc4033f8:	ffffd097          	auipc	ra,0xffffd
fc4033fc:	0c0080e7          	jalr	192(ra) # fc4004b8 <abort>

fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>:
fc403400:	f9010113          	addi	sp,sp,-112
fc403404:	06112623          	sw	ra,108(sp)
fc403408:	06812423          	sw	s0,104(sp)
fc40340c:	06912223          	sw	s1,100(sp)
fc403410:	07212023          	sw	s2,96(sp)
fc403414:	05312e23          	sw	s3,92(sp)
fc403418:	05412c23          	sw	s4,88(sp)
fc40341c:	05512a23          	sw	s5,84(sp)
fc403420:	05612823          	sw	s6,80(sp)
fc403424:	05712623          	sw	s7,76(sp)
fc403428:	05812423          	sw	s8,72(sp)
fc40342c:	07010413          	addi	s0,sp,112
fc403430:	00050493          	mv	s1,a0
fc403434:	00100b93          	li	s7,1
fc403438:	00454503          	lbu	a0,4(a0)
fc40343c:	00100b13          	li	s6,1
fc403440:	04050063          	beqz	a0,fc403480 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x80>
fc403444:	017482a3          	sb	s7,5(s1)
fc403448:	01648223          	sb	s6,4(s1)
fc40344c:	00048513          	mv	a0,s1
fc403450:	04812c03          	lw	s8,72(sp)
fc403454:	04c12b83          	lw	s7,76(sp)
fc403458:	05012b03          	lw	s6,80(sp)
fc40345c:	05412a83          	lw	s5,84(sp)
fc403460:	05812a03          	lw	s4,88(sp)
fc403464:	05c12983          	lw	s3,92(sp)
fc403468:	06012903          	lw	s2,96(sp)
fc40346c:	06412483          	lw	s1,100(sp)
fc403470:	06812403          	lw	s0,104(sp)
fc403474:	06c12083          	lw	ra,108(sp)
fc403478:	07010113          	addi	sp,sp,112
fc40347c:	00008067          	ret
fc403480:	00070993          	mv	s3,a4
fc403484:	00068913          	mv	s2,a3
fc403488:	00060a13          	mv	s4,a2
fc40348c:	00058a93          	mv	s5,a1
fc403490:	0054c503          	lbu	a0,5(s1)
fc403494:	0004a683          	lw	a3,0(s1)
fc403498:	0006c583          	lbu	a1,0(a3)
fc40349c:	0045f593          	andi	a1,a1,4
fc4034a0:	00059c63          	bnez	a1,fc4034b8 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0xb8>
fc4034a4:	12050663          	beqz	a0,fc4035d0 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x1d0>
fc4034a8:	00200613          	li	a2,2
fc4034ac:	fc408537          	lui	a0,0xfc408
fc4034b0:	c2c50593          	addi	a1,a0,-980 # fc407c2c <ebss+0xfffe8b8c>
fc4034b4:	1280006f          	j	fc4035dc <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x1dc>
fc4034b8:	02051663          	bnez	a0,fc4034e4 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0xe4>
fc4034bc:	0186a503          	lw	a0,24(a3)
fc4034c0:	01c6a583          	lw	a1,28(a3)
fc4034c4:	00c5a683          	lw	a3,12(a1)
fc4034c8:	fc4085b7          	lui	a1,0xfc408
fc4034cc:	c2558593          	addi	a1,a1,-987 # fc407c25 <ebss+0xfffe8b85>
fc4034d0:	00300613          	li	a2,3
fc4034d4:	000680e7          	jalr	a3
fc4034d8:	00100b13          	li	s6,1
fc4034dc:	f60514e3          	bnez	a0,fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>
fc4034e0:	0004a683          	lw	a3,0(s1)
fc4034e4:	00100b13          	li	s6,1
fc4034e8:	f9640fa3          	sb	s6,-97(s0)
fc4034ec:	0186a503          	lw	a0,24(a3)
fc4034f0:	01c6a583          	lw	a1,28(a3)
fc4034f4:	f9f40613          	addi	a2,s0,-97
fc4034f8:	f8c42c23          	sw	a2,-104(s0)
fc4034fc:	f8b42a23          	sw	a1,-108(s0)
fc403500:	f8a42823          	sw	a0,-112(s0)
fc403504:	0086a803          	lw	a6,8(a3)
fc403508:	00c6a883          	lw	a7,12(a3)
fc40350c:	0106a283          	lw	t0,16(a3)
fc403510:	0146a303          	lw	t1,20(a3)
fc403514:	0206a383          	lw	t2,32(a3)
fc403518:	0246a503          	lw	a0,36(a3)
fc40351c:	0286a583          	lw	a1,40(a3)
fc403520:	02c6a603          	lw	a2,44(a3)
fc403524:	0006a703          	lw	a4,0(a3)
fc403528:	0046a783          	lw	a5,4(a3)
fc40352c:	03068683          	lb	a3,48(a3)
fc403530:	fcd40823          	sb	a3,-48(s0)
fc403534:	faf42223          	sw	a5,-92(s0)
fc403538:	fae42023          	sw	a4,-96(s0)
fc40353c:	fcc42623          	sw	a2,-52(s0)
fc403540:	fcb42423          	sw	a1,-56(s0)
fc403544:	fca42223          	sw	a0,-60(s0)
fc403548:	fc742023          	sw	t2,-64(s0)
fc40354c:	fa642a23          	sw	t1,-76(s0)
fc403550:	fa542823          	sw	t0,-80(s0)
fc403554:	fb142623          	sw	a7,-84(s0)
fc403558:	fb042423          	sw	a6,-88(s0)
fc40355c:	fc408537          	lui	a0,0xfc408
fc403560:	b7450513          	addi	a0,a0,-1164 # fc407b74 <ebss+0xfffe8ad4>
fc403564:	faa42e23          	sw	a0,-68(s0)
fc403568:	00c52c03          	lw	s8,12(a0)
fc40356c:	f9040513          	addi	a0,s0,-112
fc403570:	faa42c23          	sw	a0,-72(s0)
fc403574:	000a8593          	mv	a1,s5
fc403578:	000a0613          	mv	a2,s4
fc40357c:	000c00e7          	jalr	s8
fc403580:	ec0512e3          	bnez	a0,fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>
fc403584:	fc408537          	lui	a0,0xfc408
fc403588:	c2850593          	addi	a1,a0,-984 # fc407c28 <ebss+0xfffe8b88>
fc40358c:	f9040513          	addi	a0,s0,-112
fc403590:	00200613          	li	a2,2
fc403594:	000c00e7          	jalr	s8
fc403598:	ea0516e3          	bnez	a0,fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>
fc40359c:	00c9a603          	lw	a2,12(s3)
fc4035a0:	fa040593          	addi	a1,s0,-96
fc4035a4:	00090513          	mv	a0,s2
fc4035a8:	000600e7          	jalr	a2
fc4035ac:	e8051ce3          	bnez	a0,fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>
fc4035b0:	fbc42503          	lw	a0,-68(s0)
fc4035b4:	00c52683          	lw	a3,12(a0)
fc4035b8:	fb842503          	lw	a0,-72(s0)
fc4035bc:	fc4085b7          	lui	a1,0xfc408
fc4035c0:	c2a58593          	addi	a1,a1,-982 # fc407c2a <ebss+0xfffe8b8a>
fc4035c4:	00200613          	li	a2,2
fc4035c8:	000680e7          	jalr	a3
fc4035cc:	0840006f          	j	fc403650 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x250>
fc4035d0:	00300613          	li	a2,3
fc4035d4:	fc408537          	lui	a0,0xfc408
fc4035d8:	c2e50593          	addi	a1,a0,-978 # fc407c2e <ebss+0xfffe8b8e>
fc4035dc:	0186a503          	lw	a0,24(a3)
fc4035e0:	01c6a683          	lw	a3,28(a3)
fc4035e4:	00c6a683          	lw	a3,12(a3)
fc4035e8:	000680e7          	jalr	a3
fc4035ec:	00100b13          	li	s6,1
fc4035f0:	e4051ae3          	bnez	a0,fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>
fc4035f4:	0004a583          	lw	a1,0(s1)
fc4035f8:	0185a503          	lw	a0,24(a1)
fc4035fc:	01c5a583          	lw	a1,28(a1)
fc403600:	00c5a683          	lw	a3,12(a1)
fc403604:	000a8593          	mv	a1,s5
fc403608:	000a0613          	mv	a2,s4
fc40360c:	000680e7          	jalr	a3
fc403610:	00100b13          	li	s6,1
fc403614:	e20518e3          	bnez	a0,fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>
fc403618:	0004a583          	lw	a1,0(s1)
fc40361c:	0185a503          	lw	a0,24(a1)
fc403620:	01c5a583          	lw	a1,28(a1)
fc403624:	00c5a683          	lw	a3,12(a1)
fc403628:	fc4085b7          	lui	a1,0xfc408
fc40362c:	c2858593          	addi	a1,a1,-984 # fc407c28 <ebss+0xfffe8b88>
fc403630:	00200613          	li	a2,2
fc403634:	000680e7          	jalr	a3
fc403638:	00100b13          	li	s6,1
fc40363c:	e00514e3          	bnez	a0,fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>
fc403640:	00c9a603          	lw	a2,12(s3)
fc403644:	0004a583          	lw	a1,0(s1)
fc403648:	00090513          	mv	a0,s2
fc40364c:	000600e7          	jalr	a2
fc403650:	00050b13          	mv	s6,a0
fc403654:	df1ff06f          	j	fc403444 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E+0x44>

fc403658 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE>:
fc403658:	ff010113          	addi	sp,sp,-16
fc40365c:	00112623          	sw	ra,12(sp)
fc403660:	00812423          	sw	s0,8(sp)
fc403664:	00912223          	sw	s1,4(sp)
fc403668:	01010413          	addi	s0,sp,16
fc40366c:	00050493          	mv	s1,a0
fc403670:	00454583          	lbu	a1,4(a0)
fc403674:	00554503          	lbu	a0,5(a0)
fc403678:	02050c63          	beqz	a0,fc4036b0 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE+0x58>
fc40367c:	00100513          	li	a0,1
fc403680:	04059463          	bnez	a1,fc4036c8 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE+0x70>
fc403684:	0004a583          	lw	a1,0(s1)
fc403688:	0185a503          	lw	a0,24(a1)
fc40368c:	01c5a603          	lw	a2,28(a1)
fc403690:	00c62683          	lw	a3,12(a2)
fc403694:	0005c583          	lbu	a1,0(a1)
fc403698:	0045f593          	andi	a1,a1,4
fc40369c:	00059e63          	bnez	a1,fc4036b8 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE+0x60>
fc4036a0:	fc4085b7          	lui	a1,0xfc408
fc4036a4:	c3258593          	addi	a1,a1,-974 # fc407c32 <ebss+0xfffe8b92>
fc4036a8:	00200613          	li	a2,2
fc4036ac:	0180006f          	j	fc4036c4 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE+0x6c>
fc4036b0:	00058513          	mv	a0,a1
fc4036b4:	0180006f          	j	fc4036cc <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE+0x74>
fc4036b8:	fc4085b7          	lui	a1,0xfc408
fc4036bc:	c3158593          	addi	a1,a1,-975 # fc407c31 <ebss+0xfffe8b91>
fc4036c0:	00100613          	li	a2,1
fc4036c4:	000680e7          	jalr	a3
fc4036c8:	00a48223          	sb	a0,4(s1)
fc4036cc:	00a03533          	snez	a0,a0
fc4036d0:	00412483          	lw	s1,4(sp)
fc4036d4:	00812403          	lw	s0,8(sp)
fc4036d8:	00c12083          	lw	ra,12(sp)
fc4036dc:	01010113          	addi	sp,sp,16
fc4036e0:	00008067          	ret

fc4036e4 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E>:
fc4036e4:	fa010113          	addi	sp,sp,-96
fc4036e8:	04112e23          	sw	ra,92(sp)
fc4036ec:	04812c23          	sw	s0,88(sp)
fc4036f0:	04912a23          	sw	s1,84(sp)
fc4036f4:	05212823          	sw	s2,80(sp)
fc4036f8:	05312623          	sw	s3,76(sp)
fc4036fc:	05412423          	sw	s4,72(sp)
fc403700:	06010413          	addi	s0,sp,96
fc403704:	00050493          	mv	s1,a0
fc403708:	00100913          	li	s2,1
fc40370c:	00854503          	lbu	a0,8(a0)
fc403710:	14051a63          	bnez	a0,fc403864 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x180>
fc403714:	00060a13          	mv	s4,a2
fc403718:	00058993          	mv	s3,a1
fc40371c:	0044a503          	lw	a0,4(s1)
fc403720:	0004a683          	lw	a3,0(s1)
fc403724:	0006c583          	lbu	a1,0(a3)
fc403728:	0045f593          	andi	a1,a1,4
fc40372c:	00059e63          	bnez	a1,fc403748 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x64>
fc403730:	00100913          	li	s2,1
fc403734:	0e050e63          	beqz	a0,fc403830 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x14c>
fc403738:	fc408537          	lui	a0,0xfc408
fc40373c:	c2c50593          	addi	a1,a0,-980 # fc407c2c <ebss+0xfffe8b8c>
fc403740:	00200613          	li	a2,2
fc403744:	0f80006f          	j	fc40383c <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x158>
fc403748:	02051463          	bnez	a0,fc403770 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x8c>
fc40374c:	0186a503          	lw	a0,24(a3)
fc403750:	01c6a583          	lw	a1,28(a3)
fc403754:	00c5a683          	lw	a3,12(a1)
fc403758:	fc4085b7          	lui	a1,0xfc408
fc40375c:	c3458593          	addi	a1,a1,-972 # fc407c34 <ebss+0xfffe8b94>
fc403760:	00200613          	li	a2,2
fc403764:	000680e7          	jalr	a3
fc403768:	0e051e63          	bnez	a0,fc403864 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x180>
fc40376c:	0004a683          	lw	a3,0(s1)
fc403770:	00100913          	li	s2,1
fc403774:	fb2407a3          	sb	s2,-81(s0)
fc403778:	0186a503          	lw	a0,24(a3)
fc40377c:	01c6a583          	lw	a1,28(a3)
fc403780:	faf40613          	addi	a2,s0,-81
fc403784:	fac42423          	sw	a2,-88(s0)
fc403788:	fab42223          	sw	a1,-92(s0)
fc40378c:	faa42023          	sw	a0,-96(s0)
fc403790:	0086a803          	lw	a6,8(a3)
fc403794:	00c6a883          	lw	a7,12(a3)
fc403798:	0106a283          	lw	t0,16(a3)
fc40379c:	0146a303          	lw	t1,20(a3)
fc4037a0:	0206a383          	lw	t2,32(a3)
fc4037a4:	0246a503          	lw	a0,36(a3)
fc4037a8:	0286a583          	lw	a1,40(a3)
fc4037ac:	02c6a603          	lw	a2,44(a3)
fc4037b0:	0006a703          	lw	a4,0(a3)
fc4037b4:	0046a783          	lw	a5,4(a3)
fc4037b8:	03068683          	lb	a3,48(a3)
fc4037bc:	fed40023          	sb	a3,-32(s0)
fc4037c0:	faf42a23          	sw	a5,-76(s0)
fc4037c4:	fae42823          	sw	a4,-80(s0)
fc4037c8:	fcc42e23          	sw	a2,-36(s0)
fc4037cc:	fcb42c23          	sw	a1,-40(s0)
fc4037d0:	fca42a23          	sw	a0,-44(s0)
fc4037d4:	fc742823          	sw	t2,-48(s0)
fc4037d8:	fc408537          	lui	a0,0xfc408
fc4037dc:	b7450513          	addi	a0,a0,-1164 # fc407b74 <ebss+0xfffe8ad4>
fc4037e0:	fca42623          	sw	a0,-52(s0)
fc4037e4:	fa040513          	addi	a0,s0,-96
fc4037e8:	fca42423          	sw	a0,-56(s0)
fc4037ec:	fc642223          	sw	t1,-60(s0)
fc4037f0:	fc542023          	sw	t0,-64(s0)
fc4037f4:	fb142e23          	sw	a7,-68(s0)
fc4037f8:	fb042c23          	sw	a6,-72(s0)
fc4037fc:	00ca2603          	lw	a2,12(s4)
fc403800:	fb040593          	addi	a1,s0,-80
fc403804:	00098513          	mv	a0,s3
fc403808:	000600e7          	jalr	a2
fc40380c:	04051c63          	bnez	a0,fc403864 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x180>
fc403810:	fcc42503          	lw	a0,-52(s0)
fc403814:	00c52683          	lw	a3,12(a0)
fc403818:	fc842503          	lw	a0,-56(s0)
fc40381c:	fc4085b7          	lui	a1,0xfc408
fc403820:	c2a58593          	addi	a1,a1,-982 # fc407c2a <ebss+0xfffe8b8a>
fc403824:	00200613          	li	a2,2
fc403828:	000680e7          	jalr	a3
fc40382c:	0340006f          	j	fc403860 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x17c>
fc403830:	fc408537          	lui	a0,0xfc408
fc403834:	c3650593          	addi	a1,a0,-970 # fc407c36 <ebss+0xfffe8b96>
fc403838:	00100613          	li	a2,1
fc40383c:	0186a503          	lw	a0,24(a3)
fc403840:	01c6a683          	lw	a3,28(a3)
fc403844:	00c6a683          	lw	a3,12(a3)
fc403848:	000680e7          	jalr	a3
fc40384c:	00051c63          	bnez	a0,fc403864 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E+0x180>
fc403850:	00ca2603          	lw	a2,12(s4)
fc403854:	0004a583          	lw	a1,0(s1)
fc403858:	00098513          	mv	a0,s3
fc40385c:	000600e7          	jalr	a2
fc403860:	00050913          	mv	s2,a0
fc403864:	01248423          	sb	s2,8(s1)
fc403868:	0044a503          	lw	a0,4(s1)
fc40386c:	00150513          	addi	a0,a0,1
fc403870:	00a4a223          	sw	a0,4(s1)
fc403874:	00048513          	mv	a0,s1
fc403878:	04812a03          	lw	s4,72(sp)
fc40387c:	04c12983          	lw	s3,76(sp)
fc403880:	05012903          	lw	s2,80(sp)
fc403884:	05412483          	lw	s1,84(sp)
fc403888:	05812403          	lw	s0,88(sp)
fc40388c:	05c12083          	lw	ra,92(sp)
fc403890:	06010113          	addi	sp,sp,96
fc403894:	00008067          	ret

fc403898 <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E>:
fc403898:	ff010113          	addi	sp,sp,-16
fc40389c:	00112623          	sw	ra,12(sp)
fc4038a0:	00812423          	sw	s0,8(sp)
fc4038a4:	00912223          	sw	s1,4(sp)
fc4038a8:	01212023          	sw	s2,0(sp)
fc4038ac:	01010413          	addi	s0,sp,16
fc4038b0:	00050913          	mv	s2,a0
fc4038b4:	00854583          	lbu	a1,8(a0)
fc4038b8:	00452503          	lw	a0,4(a0)
fc4038bc:	06050e63          	beqz	a0,fc403938 <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E+0xa0>
fc4038c0:	00100493          	li	s1,1
fc4038c4:	06059663          	bnez	a1,fc403930 <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E+0x98>
fc4038c8:	00100593          	li	a1,1
fc4038cc:	04b51063          	bne	a0,a1,fc40390c <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E+0x74>
fc4038d0:	00994503          	lbu	a0,9(s2)
fc4038d4:	02050c63          	beqz	a0,fc40390c <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E+0x74>
fc4038d8:	00092583          	lw	a1,0(s2)
fc4038dc:	0005c503          	lbu	a0,0(a1)
fc4038e0:	00457513          	andi	a0,a0,4
fc4038e4:	02051463          	bnez	a0,fc40390c <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E+0x74>
fc4038e8:	0185a503          	lw	a0,24(a1)
fc4038ec:	01c5a583          	lw	a1,28(a1)
fc4038f0:	00c5a683          	lw	a3,12(a1)
fc4038f4:	fc4085b7          	lui	a1,0xfc408
fc4038f8:	c3758593          	addi	a1,a1,-969 # fc407c37 <ebss+0xfffe8b97>
fc4038fc:	00100493          	li	s1,1
fc403900:	00100613          	li	a2,1
fc403904:	000680e7          	jalr	a3
fc403908:	02051463          	bnez	a0,fc403930 <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E+0x98>
fc40390c:	00092583          	lw	a1,0(s2)
fc403910:	0185a503          	lw	a0,24(a1)
fc403914:	01c5a583          	lw	a1,28(a1)
fc403918:	00c5a683          	lw	a3,12(a1)
fc40391c:	fc4085b7          	lui	a1,0xfc408
fc403920:	c3858593          	addi	a1,a1,-968 # fc407c38 <ebss+0xfffe8b98>
fc403924:	00100613          	li	a2,1
fc403928:	000680e7          	jalr	a3
fc40392c:	00050493          	mv	s1,a0
fc403930:	00990423          	sb	s1,8(s2)
fc403934:	0080006f          	j	fc40393c <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E+0xa4>
fc403938:	00058493          	mv	s1,a1
fc40393c:	00903533          	snez	a0,s1
fc403940:	00012903          	lw	s2,0(sp)
fc403944:	00412483          	lw	s1,4(sp)
fc403948:	00812403          	lw	s0,8(sp)
fc40394c:	00c12083          	lw	ra,12(sp)
fc403950:	01010113          	addi	sp,sp,16
fc403954:	00008067          	ret

fc403958 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485>:
fc403958:	fa010113          	addi	sp,sp,-96
fc40395c:	04112e23          	sw	ra,92(sp)
fc403960:	04812c23          	sw	s0,88(sp)
fc403964:	04912a23          	sw	s1,84(sp)
fc403968:	05212823          	sw	s2,80(sp)
fc40396c:	05312623          	sw	s3,76(sp)
fc403970:	05412423          	sw	s4,72(sp)
fc403974:	05512223          	sw	s5,68(sp)
fc403978:	06010413          	addi	s0,sp,96
fc40397c:	00050493          	mv	s1,a0
fc403980:	00100a93          	li	s5,1
fc403984:	00454503          	lbu	a0,4(a0)
fc403988:	00100a13          	li	s4,1
fc40398c:	14051463          	bnez	a0,fc403ad4 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0x17c>
fc403990:	00060993          	mv	s3,a2
fc403994:	00058913          	mv	s2,a1
fc403998:	0054c503          	lbu	a0,5(s1)
fc40399c:	0004a583          	lw	a1,0(s1)
fc4039a0:	0005c603          	lbu	a2,0(a1)
fc4039a4:	00467613          	andi	a2,a2,4
fc4039a8:	04061063          	bnez	a2,fc4039e8 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0x90>
fc4039ac:	02050663          	beqz	a0,fc4039d8 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0x80>
fc4039b0:	0185a503          	lw	a0,24(a1)
fc4039b4:	01c5a583          	lw	a1,28(a1)
fc4039b8:	00c5a683          	lw	a3,12(a1)
fc4039bc:	fc4085b7          	lui	a1,0xfc408
fc4039c0:	c2c58593          	addi	a1,a1,-980 # fc407c2c <ebss+0xfffe8b8c>
fc4039c4:	00200613          	li	a2,2
fc4039c8:	000680e7          	jalr	a3
fc4039cc:	00100a13          	li	s4,1
fc4039d0:	10051263          	bnez	a0,fc403ad4 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0x17c>
fc4039d4:	0004a583          	lw	a1,0(s1)
fc4039d8:	00c9a603          	lw	a2,12(s3)
fc4039dc:	00090513          	mv	a0,s2
fc4039e0:	000600e7          	jalr	a2
fc4039e4:	0ec0006f          	j	fc403ad0 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0x178>
fc4039e8:	02051663          	bnez	a0,fc403a14 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0xbc>
fc4039ec:	0185a503          	lw	a0,24(a1)
fc4039f0:	01c5a583          	lw	a1,28(a1)
fc4039f4:	00c5a683          	lw	a3,12(a1)
fc4039f8:	fc4085b7          	lui	a1,0xfc408
fc4039fc:	c3958593          	addi	a1,a1,-967 # fc407c39 <ebss+0xfffe8b99>
fc403a00:	00100a13          	li	s4,1
fc403a04:	00100613          	li	a2,1
fc403a08:	000680e7          	jalr	a3
fc403a0c:	0c051463          	bnez	a0,fc403ad4 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0x17c>
fc403a10:	0004a583          	lw	a1,0(s1)
fc403a14:	00100a13          	li	s4,1
fc403a18:	fb4407a3          	sb	s4,-81(s0)
fc403a1c:	0185a503          	lw	a0,24(a1)
fc403a20:	01c5a603          	lw	a2,28(a1)
fc403a24:	faf40693          	addi	a3,s0,-81
fc403a28:	fad42423          	sw	a3,-88(s0)
fc403a2c:	fac42223          	sw	a2,-92(s0)
fc403a30:	faa42023          	sw	a0,-96(s0)
fc403a34:	0085a803          	lw	a6,8(a1)
fc403a38:	00c5a883          	lw	a7,12(a1)
fc403a3c:	0105a283          	lw	t0,16(a1)
fc403a40:	0145a303          	lw	t1,20(a1)
fc403a44:	0205a383          	lw	t2,32(a1)
fc403a48:	0245a503          	lw	a0,36(a1)
fc403a4c:	0285a603          	lw	a2,40(a1)
fc403a50:	02c5a683          	lw	a3,44(a1)
fc403a54:	0005a703          	lw	a4,0(a1)
fc403a58:	0045a783          	lw	a5,4(a1)
fc403a5c:	03058583          	lb	a1,48(a1)
fc403a60:	feb40023          	sb	a1,-32(s0)
fc403a64:	faf42a23          	sw	a5,-76(s0)
fc403a68:	fae42823          	sw	a4,-80(s0)
fc403a6c:	fcd42e23          	sw	a3,-36(s0)
fc403a70:	fcc42c23          	sw	a2,-40(s0)
fc403a74:	fca42a23          	sw	a0,-44(s0)
fc403a78:	fc742823          	sw	t2,-48(s0)
fc403a7c:	fc408537          	lui	a0,0xfc408
fc403a80:	b7450513          	addi	a0,a0,-1164 # fc407b74 <ebss+0xfffe8ad4>
fc403a84:	fca42623          	sw	a0,-52(s0)
fc403a88:	fa040513          	addi	a0,s0,-96
fc403a8c:	fca42423          	sw	a0,-56(s0)
fc403a90:	fc642223          	sw	t1,-60(s0)
fc403a94:	fc542023          	sw	t0,-64(s0)
fc403a98:	fb142e23          	sw	a7,-68(s0)
fc403a9c:	fb042c23          	sw	a6,-72(s0)
fc403aa0:	00c9a603          	lw	a2,12(s3)
fc403aa4:	fb040593          	addi	a1,s0,-80
fc403aa8:	00090513          	mv	a0,s2
fc403aac:	000600e7          	jalr	a2
fc403ab0:	02051263          	bnez	a0,fc403ad4 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485+0x17c>
fc403ab4:	fcc42503          	lw	a0,-52(s0)
fc403ab8:	00c52683          	lw	a3,12(a0)
fc403abc:	fc842503          	lw	a0,-56(s0)
fc403ac0:	fc4085b7          	lui	a1,0xfc408
fc403ac4:	c2a58593          	addi	a1,a1,-982 # fc407c2a <ebss+0xfffe8b8a>
fc403ac8:	00200613          	li	a2,2
fc403acc:	000680e7          	jalr	a3
fc403ad0:	00050a13          	mv	s4,a0
fc403ad4:	015482a3          	sb	s5,5(s1)
fc403ad8:	01448223          	sb	s4,4(s1)
fc403adc:	04412a83          	lw	s5,68(sp)
fc403ae0:	04812a03          	lw	s4,72(sp)
fc403ae4:	04c12983          	lw	s3,76(sp)
fc403ae8:	05012903          	lw	s2,80(sp)
fc403aec:	05412483          	lw	s1,84(sp)
fc403af0:	05812403          	lw	s0,88(sp)
fc403af4:	05c12083          	lw	ra,92(sp)
fc403af8:	06010113          	addi	sp,sp,96
fc403afc:	00008067          	ret

fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>:
fc403b00:	ff010113          	addi	sp,sp,-16
fc403b04:	00112623          	sw	ra,12(sp)
fc403b08:	00812423          	sw	s0,8(sp)
fc403b0c:	00912223          	sw	s1,4(sp)
fc403b10:	01010413          	addi	s0,sp,16
fc403b14:	00050493          	mv	s1,a0
fc403b18:	00000097          	auipc	ra,0x0
fc403b1c:	e40080e7          	jalr	-448(ra) # fc403958 <_ZN4core3fmt8builders10DebugInner5entry17h5c282bdd026c7c4bE.llvm.3292268272379612485>
fc403b20:	00048513          	mv	a0,s1
fc403b24:	00412483          	lw	s1,4(sp)
fc403b28:	00812403          	lw	s0,8(sp)
fc403b2c:	00c12083          	lw	ra,12(sp)
fc403b30:	01010113          	addi	sp,sp,16
fc403b34:	00008067          	ret

fc403b38 <_ZN4core3fmt8builders9DebugList6finish17h9c4a8b3e027a94e4E>:
fc403b38:	ff010113          	addi	sp,sp,-16
fc403b3c:	00112623          	sw	ra,12(sp)
fc403b40:	00812423          	sw	s0,8(sp)
fc403b44:	01010413          	addi	s0,sp,16
fc403b48:	00050593          	mv	a1,a0
fc403b4c:	00100513          	li	a0,1
fc403b50:	0045c603          	lbu	a2,4(a1)
fc403b54:	00060a63          	beqz	a2,fc403b68 <_ZN4core3fmt8builders9DebugList6finish17h9c4a8b3e027a94e4E+0x30>
fc403b58:	00812403          	lw	s0,8(sp)
fc403b5c:	00c12083          	lw	ra,12(sp)
fc403b60:	01010113          	addi	sp,sp,16
fc403b64:	00008067          	ret
fc403b68:	0005a583          	lw	a1,0(a1)
fc403b6c:	0185a503          	lw	a0,24(a1)
fc403b70:	01c5a583          	lw	a1,28(a1)
fc403b74:	00c5a683          	lw	a3,12(a1)
fc403b78:	fc4085b7          	lui	a1,0xfc408
fc403b7c:	c3b58593          	addi	a1,a1,-965 # fc407c3b <ebss+0xfffe8b9b>
fc403b80:	00100613          	li	a2,1
fc403b84:	000680e7          	jalr	a3
fc403b88:	00812403          	lw	s0,8(sp)
fc403b8c:	00c12083          	lw	ra,12(sp)
fc403b90:	01010113          	addi	sp,sp,16
fc403b94:	00008067          	ret

fc403b98 <_ZN4core3fmt5Write10write_char17h98acc9ed7e301390E>:
fc403b98:	ff010113          	addi	sp,sp,-16
fc403b9c:	00112623          	sw	ra,12(sp)
fc403ba0:	00812423          	sw	s0,8(sp)
fc403ba4:	01010413          	addi	s0,sp,16
fc403ba8:	fe042a23          	sw	zero,-12(s0)
fc403bac:	08000613          	li	a2,128
fc403bb0:	00c5f863          	bgeu	a1,a2,fc403bc0 <_ZN4core3fmt5Write10write_char17h98acc9ed7e301390E+0x28>
fc403bb4:	feb40a23          	sb	a1,-12(s0)
fc403bb8:	00100613          	li	a2,1
fc403bbc:	0a80006f          	j	fc403c64 <_ZN4core3fmt5Write10write_char17h98acc9ed7e301390E+0xcc>
fc403bc0:	00b5d613          	srli	a2,a1,0xb
fc403bc4:	02061463          	bnez	a2,fc403bec <_ZN4core3fmt5Write10write_char17h98acc9ed7e301390E+0x54>
fc403bc8:	03f5f613          	andi	a2,a1,63
fc403bcc:	08066613          	ori	a2,a2,128
fc403bd0:	fec40aa3          	sb	a2,-11(s0)
fc403bd4:	0065d593          	srli	a1,a1,0x6
fc403bd8:	01f5f593          	andi	a1,a1,31
fc403bdc:	0c05e593          	ori	a1,a1,192
fc403be0:	feb40a23          	sb	a1,-12(s0)
fc403be4:	00200613          	li	a2,2
fc403be8:	07c0006f          	j	fc403c64 <_ZN4core3fmt5Write10write_char17h98acc9ed7e301390E+0xcc>
fc403bec:	0105d613          	srli	a2,a1,0x10
fc403bf0:	02061c63          	bnez	a2,fc403c28 <_ZN4core3fmt5Write10write_char17h98acc9ed7e301390E+0x90>
fc403bf4:	03f5f613          	andi	a2,a1,63
fc403bf8:	08066613          	ori	a2,a2,128
fc403bfc:	fec40b23          	sb	a2,-10(s0)
fc403c00:	0065d613          	srli	a2,a1,0x6
fc403c04:	03f67613          	andi	a2,a2,63
fc403c08:	08066613          	ori	a2,a2,128
fc403c0c:	fec40aa3          	sb	a2,-11(s0)
fc403c10:	00c5d593          	srli	a1,a1,0xc
fc403c14:	00f5f593          	andi	a1,a1,15
fc403c18:	0e05e593          	ori	a1,a1,224
fc403c1c:	feb40a23          	sb	a1,-12(s0)
fc403c20:	00300613          	li	a2,3
fc403c24:	0400006f          	j	fc403c64 <_ZN4core3fmt5Write10write_char17h98acc9ed7e301390E+0xcc>
fc403c28:	03f5f613          	andi	a2,a1,63
fc403c2c:	08066613          	ori	a2,a2,128
fc403c30:	fec40ba3          	sb	a2,-9(s0)
fc403c34:	0125d613          	srli	a2,a1,0x12
fc403c38:	0f066613          	ori	a2,a2,240
fc403c3c:	fec40a23          	sb	a2,-12(s0)
fc403c40:	0065d613          	srli	a2,a1,0x6
fc403c44:	03f67613          	andi	a2,a2,63
fc403c48:	08066613          	ori	a2,a2,128
fc403c4c:	fec40b23          	sb	a2,-10(s0)
fc403c50:	00c5d593          	srli	a1,a1,0xc
fc403c54:	03f5f593          	andi	a1,a1,63
fc403c58:	0805e593          	ori	a1,a1,128
fc403c5c:	feb40aa3          	sb	a1,-11(s0)
fc403c60:	00400613          	li	a2,4
fc403c64:	ff440593          	addi	a1,s0,-12
fc403c68:	fffff097          	auipc	ra,0xfffff
fc403c6c:	4f0080e7          	jalr	1264(ra) # fc403158 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E>
fc403c70:	00812403          	lw	s0,8(sp)
fc403c74:	00c12083          	lw	ra,12(sp)
fc403c78:	01010113          	addi	sp,sp,16
fc403c7c:	00008067          	ret

fc403c80 <_ZN4core3fmt5Write9write_fmt17h8fb3a696d7edd1cdE>:
fc403c80:	fd010113          	addi	sp,sp,-48
fc403c84:	02112623          	sw	ra,44(sp)
fc403c88:	02812423          	sw	s0,40(sp)
fc403c8c:	03010413          	addi	s0,sp,48
fc403c90:	fca42e23          	sw	a0,-36(s0)
fc403c94:	0145a503          	lw	a0,20(a1)
fc403c98:	fea42a23          	sw	a0,-12(s0)
fc403c9c:	0105a503          	lw	a0,16(a1)
fc403ca0:	fea42823          	sw	a0,-16(s0)
fc403ca4:	00c5a503          	lw	a0,12(a1)
fc403ca8:	fea42623          	sw	a0,-20(s0)
fc403cac:	0085a503          	lw	a0,8(a1)
fc403cb0:	fea42423          	sw	a0,-24(s0)
fc403cb4:	0045a503          	lw	a0,4(a1)
fc403cb8:	fea42223          	sw	a0,-28(s0)
fc403cbc:	0005a503          	lw	a0,0(a1)
fc403cc0:	fea42023          	sw	a0,-32(s0)
fc403cc4:	fc408537          	lui	a0,0xfc408
fc403cc8:	c3c50593          	addi	a1,a0,-964 # fc407c3c <ebss+0xfffe8b9c>
fc403ccc:	fdc40513          	addi	a0,s0,-36
fc403cd0:	fe040613          	addi	a2,s0,-32
fc403cd4:	ffffe097          	auipc	ra,0xffffe
fc403cd8:	194080e7          	jalr	404(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc403cdc:	02812403          	lw	s0,40(sp)
fc403ce0:	02c12083          	lw	ra,44(sp)
fc403ce4:	03010113          	addi	sp,sp,48
fc403ce8:	00008067          	ret

fc403cec <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_str17hbfd98be47e7afe6eE>:
fc403cec:	ff010113          	addi	sp,sp,-16
fc403cf0:	00112623          	sw	ra,12(sp)
fc403cf4:	00812423          	sw	s0,8(sp)
fc403cf8:	01010413          	addi	s0,sp,16
fc403cfc:	00052503          	lw	a0,0(a0)
fc403d00:	00812403          	lw	s0,8(sp)
fc403d04:	00c12083          	lw	ra,12(sp)
fc403d08:	01010113          	addi	sp,sp,16
fc403d0c:	fffff317          	auipc	t1,0xfffff
fc403d10:	44c30067          	jr	1100(t1) # fc403158 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E>

fc403d14 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h3a8013bc1b20e328E>:
fc403d14:	ff010113          	addi	sp,sp,-16
fc403d18:	00112623          	sw	ra,12(sp)
fc403d1c:	00812423          	sw	s0,8(sp)
fc403d20:	01010413          	addi	s0,sp,16
fc403d24:	00052503          	lw	a0,0(a0)
fc403d28:	fe042a23          	sw	zero,-12(s0)
fc403d2c:	08000613          	li	a2,128
fc403d30:	00c5f863          	bgeu	a1,a2,fc403d40 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h3a8013bc1b20e328E+0x2c>
fc403d34:	feb40a23          	sb	a1,-12(s0)
fc403d38:	00100613          	li	a2,1
fc403d3c:	0a80006f          	j	fc403de4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h3a8013bc1b20e328E+0xd0>
fc403d40:	00b5d613          	srli	a2,a1,0xb
fc403d44:	02061463          	bnez	a2,fc403d6c <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h3a8013bc1b20e328E+0x58>
fc403d48:	03f5f613          	andi	a2,a1,63
fc403d4c:	08066613          	ori	a2,a2,128
fc403d50:	fec40aa3          	sb	a2,-11(s0)
fc403d54:	0065d593          	srli	a1,a1,0x6
fc403d58:	01f5f593          	andi	a1,a1,31
fc403d5c:	0c05e593          	ori	a1,a1,192
fc403d60:	feb40a23          	sb	a1,-12(s0)
fc403d64:	00200613          	li	a2,2
fc403d68:	07c0006f          	j	fc403de4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h3a8013bc1b20e328E+0xd0>
fc403d6c:	0105d613          	srli	a2,a1,0x10
fc403d70:	02061c63          	bnez	a2,fc403da8 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h3a8013bc1b20e328E+0x94>
fc403d74:	03f5f613          	andi	a2,a1,63
fc403d78:	08066613          	ori	a2,a2,128
fc403d7c:	fec40b23          	sb	a2,-10(s0)
fc403d80:	0065d613          	srli	a2,a1,0x6
fc403d84:	03f67613          	andi	a2,a2,63
fc403d88:	08066613          	ori	a2,a2,128
fc403d8c:	fec40aa3          	sb	a2,-11(s0)
fc403d90:	00c5d593          	srli	a1,a1,0xc
fc403d94:	00f5f593          	andi	a1,a1,15
fc403d98:	0e05e593          	ori	a1,a1,224
fc403d9c:	feb40a23          	sb	a1,-12(s0)
fc403da0:	00300613          	li	a2,3
fc403da4:	0400006f          	j	fc403de4 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$10write_char17h3a8013bc1b20e328E+0xd0>
fc403da8:	03f5f613          	andi	a2,a1,63
fc403dac:	08066613          	ori	a2,a2,128
fc403db0:	fec40ba3          	sb	a2,-9(s0)
fc403db4:	0125d613          	srli	a2,a1,0x12
fc403db8:	0f066613          	ori	a2,a2,240
fc403dbc:	fec40a23          	sb	a2,-12(s0)
fc403dc0:	0065d613          	srli	a2,a1,0x6
fc403dc4:	03f67613          	andi	a2,a2,63
fc403dc8:	08066613          	ori	a2,a2,128
fc403dcc:	fec40b23          	sb	a2,-10(s0)
fc403dd0:	00c5d593          	srli	a1,a1,0xc
fc403dd4:	03f5f593          	andi	a1,a1,63
fc403dd8:	0805e593          	ori	a1,a1,128
fc403ddc:	feb40aa3          	sb	a1,-11(s0)
fc403de0:	00400613          	li	a2,4
fc403de4:	ff440593          	addi	a1,s0,-12
fc403de8:	fffff097          	auipc	ra,0xfffff
fc403dec:	370080e7          	jalr	880(ra) # fc403158 <_ZN68_$LT$core..fmt..builders..PadAdapter$u20$as$u20$core..fmt..Write$GT$9write_str17h9e23fffaf31b3467E>
fc403df0:	00812403          	lw	s0,8(sp)
fc403df4:	00c12083          	lw	ra,12(sp)
fc403df8:	01010113          	addi	sp,sp,16
fc403dfc:	00008067          	ret

fc403e00 <_ZN50_$LT$$RF$mut$u20$W$u20$as$u20$core..fmt..Write$GT$9write_fmt17h58d51fbaa38a1ca8E>:
fc403e00:	fd010113          	addi	sp,sp,-48
fc403e04:	02112623          	sw	ra,44(sp)
fc403e08:	02812423          	sw	s0,40(sp)
fc403e0c:	03010413          	addi	s0,sp,48
fc403e10:	00052503          	lw	a0,0(a0)
fc403e14:	fca42e23          	sw	a0,-36(s0)
fc403e18:	0145a503          	lw	a0,20(a1)
fc403e1c:	fea42a23          	sw	a0,-12(s0)
fc403e20:	0105a503          	lw	a0,16(a1)
fc403e24:	fea42823          	sw	a0,-16(s0)
fc403e28:	00c5a503          	lw	a0,12(a1)
fc403e2c:	fea42623          	sw	a0,-20(s0)
fc403e30:	0085a503          	lw	a0,8(a1)
fc403e34:	fea42423          	sw	a0,-24(s0)
fc403e38:	0045a503          	lw	a0,4(a1)
fc403e3c:	fea42223          	sw	a0,-28(s0)
fc403e40:	0005a503          	lw	a0,0(a1)
fc403e44:	fea42023          	sw	a0,-32(s0)
fc403e48:	fc408537          	lui	a0,0xfc408
fc403e4c:	c3c50593          	addi	a1,a0,-964 # fc407c3c <ebss+0xfffe8b9c>
fc403e50:	fdc40513          	addi	a0,s0,-36
fc403e54:	fe040613          	addi	a2,s0,-32
fc403e58:	ffffe097          	auipc	ra,0xffffe
fc403e5c:	010080e7          	jalr	16(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc403e60:	02812403          	lw	s0,40(sp)
fc403e64:	02c12083          	lw	ra,44(sp)
fc403e68:	03010113          	addi	sp,sp,48
fc403e6c:	00008067          	ret

fc403e70 <bcmp>:
fc403e70:	ff010113          	addi	sp,sp,-16
fc403e74:	00112623          	sw	ra,12(sp)
fc403e78:	00812423          	sw	s0,8(sp)
fc403e7c:	01010413          	addi	s0,sp,16
fc403e80:	02060063          	beqz	a2,fc403ea0 <bcmp+0x30>
fc403e84:	0005c683          	lbu	a3,0(a1)
fc403e88:	00054703          	lbu	a4,0(a0)
fc403e8c:	02d71463          	bne	a4,a3,fc403eb4 <bcmp+0x44>
fc403e90:	00150513          	addi	a0,a0,1
fc403e94:	00158593          	addi	a1,a1,1
fc403e98:	fff60613          	addi	a2,a2,-1
fc403e9c:	fe0614e3          	bnez	a2,fc403e84 <bcmp+0x14>
fc403ea0:	00000513          	li	a0,0
fc403ea4:	00812403          	lw	s0,8(sp)
fc403ea8:	00c12083          	lw	ra,12(sp)
fc403eac:	01010113          	addi	sp,sp,16
fc403eb0:	00008067          	ret
fc403eb4:	40d70533          	sub	a0,a4,a3
fc403eb8:	00812403          	lw	s0,8(sp)
fc403ebc:	00c12083          	lw	ra,12(sp)
fc403ec0:	01010113          	addi	sp,sp,16
fc403ec4:	00008067          	ret

fc403ec8 <rust_main>:
fc403ec8:	f8010113          	addi	sp,sp,-128
fc403ecc:	06112e23          	sw	ra,124(sp)
fc403ed0:	06812c23          	sw	s0,120(sp)
fc403ed4:	06912a23          	sw	s1,116(sp)
fc403ed8:	07212823          	sw	s2,112(sp)
fc403edc:	07312623          	sw	s3,108(sp)
fc403ee0:	07412423          	sw	s4,104(sp)
fc403ee4:	07512223          	sw	s5,100(sp)
fc403ee8:	07612023          	sw	s6,96(sp)
fc403eec:	05712e23          	sw	s7,92(sp)
fc403ef0:	05812c23          	sw	s8,88(sp)
fc403ef4:	05912a23          	sw	s9,84(sp)
fc403ef8:	05a12823          	sw	s10,80(sp)
fc403efc:	05b12623          	sw	s11,76(sp)
fc403f00:	08010413          	addi	s0,sp,128
fc403f04:	fb840913          	addi	s2,s0,-72
fc403f08:	f9242823          	sw	s2,-112(s0)
fc403f0c:	fa040993          	addi	s3,s0,-96
fc403f10:	fb342c23          	sw	s3,-72(s0)
fc403f14:	00400513          	li	a0,4
fc403f18:	faa42823          	sw	a0,-80(s0)
fc403f1c:	fc408537          	lui	a0,0xfc408
fc403f20:	c8c50513          	addi	a0,a0,-884 # fc407c8c <ebss+0xfffe8bec>
fc403f24:	faa42023          	sw	a0,-96(s0)
fc403f28:	fc402537          	lui	a0,0xfc402
fc403f2c:	dfc50a93          	addi	s5,a0,-516 # fc401dfc <ebss+0xfffe2d5c>
fc403f30:	00100a13          	li	s4,1
fc403f34:	f9442a23          	sw	s4,-108(s0)
fc403f38:	f8042423          	sw	zero,-120(s0)
fc403f3c:	00200b13          	li	s6,2
fc403f40:	f9642223          	sw	s6,-124(s0)
fc403f44:	fb542e23          	sw	s5,-68(s0)
fc403f48:	fc408537          	lui	a0,0xfc408
fc403f4c:	c5850d13          	addi	s10,a0,-936 # fc407c58 <ebss+0xfffe8bb8>
fc403f50:	f9a42023          	sw	s10,-128(s0)
fc403f54:	fa042a23          	sw	zero,-76(s0)
fc403f58:	fa042423          	sw	zero,-88(s0)
fc403f5c:	fb442223          	sw	s4,-92(s0)
fc403f60:	f8040513          	addi	a0,s0,-128
fc403f64:	ffffd097          	auipc	ra,0xffffd
fc403f68:	950080e7          	jalr	-1712(ra) # fc4008b4 <_ZN2os2io6_print17h5deb1cd274d85726E>
fc403f6c:	bc41f537          	lui	a0,0xbc41f
fc403f70:	0a050b93          	addi	s7,a0,160 # bc41f0a0 <ebss+0xc0000000>
fc403f74:	00000097          	auipc	ra,0x0
fc403f78:	51c080e7          	jalr	1308(ra) # fc404490 <_ZN2os9interrupt4init17hcf56f6dec65f6944E>
fc403f7c:	f9840c13          	addi	s8,s0,-104
fc403f80:	f9842823          	sw	s8,-112(s0)
fc403f84:	f9342c23          	sw	s3,-104(s0)
fc403f88:	fb242823          	sw	s2,-80(s0)
fc403f8c:	fc408537          	lui	a0,0xfc408
fc403f90:	cac50513          	addi	a0,a0,-852 # fc407cac <ebss+0xfffe8c0c>
fc403f94:	faa42023          	sw	a0,-96(s0)
fc403f98:	fc406537          	lui	a0,0xfc406
fc403f9c:	60450513          	addi	a0,a0,1540 # fc406604 <ebss+0xfffe7564>
fc403fa0:	fca42023          	sw	a0,-64(s0)
fc403fa4:	fc840c93          	addi	s9,s0,-56
fc403fa8:	fb942c23          	sw	s9,-72(s0)
fc403fac:	fc401537          	lui	a0,0xfc401
fc403fb0:	b2450493          	addi	s1,a0,-1244 # fc400b24 <ebss+0xfffe1a84>
fc403fb4:	fc408537          	lui	a0,0xfc408
fc403fb8:	cbc50d93          	addi	s11,a0,-836 # fc407cbc <ebss+0xfffe8c1c>
fc403fbc:	f9442a23          	sw	s4,-108(s0)
fc403fc0:	f8042423          	sw	zero,-120(s0)
fc403fc4:	f9642223          	sw	s6,-124(s0)
fc403fc8:	f9a42023          	sw	s10,-128(s0)
fc403fcc:	f9542e23          	sw	s5,-100(s0)
fc403fd0:	fb642a23          	sw	s6,-76(s0)
fc403fd4:	fb642623          	sw	s6,-84(s0)
fc403fd8:	fbb42423          	sw	s11,-88(s0)
fc403fdc:	fb642223          	sw	s6,-92(s0)
fc403fe0:	fc942223          	sw	s1,-60(s0)
fc403fe4:	fa942e23          	sw	s1,-68(s0)
fc403fe8:	fd742423          	sw	s7,-56(s0)
fc403fec:	f8040513          	addi	a0,s0,-128
fc403ff0:	ffffd097          	auipc	ra,0xffffd
fc403ff4:	8c4080e7          	jalr	-1852(ra) # fc4008b4 <_ZN2os2io6_print17h5deb1cd274d85726E>
fc403ff8:	f9442a23          	sw	s4,-108(s0)
fc403ffc:	f9842823          	sw	s8,-112(s0)
fc404000:	f8042423          	sw	zero,-120(s0)
fc404004:	f9a42023          	sw	s10,-128(s0)
fc404008:	f9542e23          	sw	s5,-100(s0)
fc40400c:	f9342c23          	sw	s3,-104(s0)
fc404010:	fb242823          	sw	s2,-80(s0)
fc404014:	f9642223          	sw	s6,-124(s0)
fc404018:	fb642a23          	sw	s6,-76(s0)
fc40401c:	fb642623          	sw	s6,-84(s0)
fc404020:	fbb42423          	sw	s11,-88(s0)
fc404024:	00300513          	li	a0,3
fc404028:	faa42223          	sw	a0,-92(s0)
fc40402c:	fc408537          	lui	a0,0xfc408
fc404030:	d2450513          	addi	a0,a0,-732 # fc407d24 <ebss+0xfffe8c84>
fc404034:	faa42023          	sw	a0,-96(s0)
fc404038:	fc406537          	lui	a0,0xfc406
fc40403c:	60850513          	addi	a0,a0,1544 # fc406608 <ebss+0xfffe7568>
fc404040:	fca42023          	sw	a0,-64(s0)
fc404044:	fc942223          	sw	s1,-60(s0)
fc404048:	fa942e23          	sw	s1,-68(s0)
fc40404c:	fb942c23          	sw	s9,-72(s0)
fc404050:	00cbd513          	srli	a0,s7,0xc
fc404054:	00250493          	addi	s1,a0,2
fc404058:	fc942423          	sw	s1,-56(s0)
fc40405c:	f8040513          	addi	a0,s0,-128
fc404060:	ffffd097          	auipc	ra,0xffffd
fc404064:	854080e7          	jalr	-1964(ra) # fc4008b4 <_ZN2os2io6_print17h5deb1cd274d85726E>
fc404068:	00081537          	lui	a0,0x81
fc40406c:	80050593          	addi	a1,a0,-2048 # 80800 <XLENB+0x807fc>
fc404070:	00048513          	mv	a0,s1
fc404074:	ffffc097          	auipc	ra,0xffffc
fc404078:	fcc080e7          	jalr	-52(ra) # fc400040 <_ZN2os6memory4init17h83fdcd4a151097b4E>
fc40407c:	00000097          	auipc	ra,0x0
fc404080:	02c080e7          	jalr	44(ra) # fc4040a8 <_ZN2os4init15test_page_table17h4eb441ce4caabc4eE>
fc404084:	00000097          	auipc	ra,0x0
fc404088:	138080e7          	jalr	312(ra) # fc4041bc <_ZN2os5clock4init17h96b1e36cfc31bf8eE>
fc40408c:	fc408537          	lui	a0,0xfc408
fc404090:	d4850513          	addi	a0,a0,-696 # fc407d48 <ebss+0xfffe8ca8>
fc404094:	00100073          	ebreak
fc404098:	ffffd097          	auipc	ra,0xffffd
fc40409c:	024080e7          	jalr	36(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc4040a0:	ffffc097          	auipc	ra,0xffffc
fc4040a4:	418080e7          	jalr	1048(ra) # fc4004b8 <abort>

fc4040a8 <_ZN2os4init15test_page_table17h4eb441ce4caabc4eE>:
fc4040a8:	fa010113          	addi	sp,sp,-96
fc4040ac:	04112e23          	sw	ra,92(sp)
fc4040b0:	04812c23          	sw	s0,88(sp)
fc4040b4:	06010413          	addi	s0,sp,96
fc4040b8:	c0400537          	lui	a0,0xc0400
fc4040bc:	faa42023          	sw	a0,-96(s0)
fc4040c0:	00052503          	lw	a0,0(a0) # c0400000 <ebss+0xc3fe0f60>
fc4040c4:	faa42223          	sw	a0,-92(s0)
fc4040c8:	fc402537          	lui	a0,0xfc402
fc4040cc:	dfc50513          	addi	a0,a0,-516 # fc401dfc <ebss+0xfffe2d5c>
fc4040d0:	faa42623          	sw	a0,-84(s0)
fc4040d4:	fb040513          	addi	a0,s0,-80
fc4040d8:	faa42423          	sw	a0,-88(s0)
fc4040dc:	fc840513          	addi	a0,s0,-56
fc4040e0:	fca42023          	sw	a0,-64(s0)
fc4040e4:	fc408537          	lui	a0,0xfc408
fc4040e8:	d8050513          	addi	a0,a0,-640 # fc407d80 <ebss+0xfffe8ce0>
fc4040ec:	faa42c23          	sw	a0,-72(s0)
fc4040f0:	fc408537          	lui	a0,0xfc408
fc4040f4:	d7050513          	addi	a0,a0,-656 # fc407d70 <ebss+0xfffe8cd0>
fc4040f8:	faa42823          	sw	a0,-80(s0)
fc4040fc:	fc401537          	lui	a0,0xfc401
fc404100:	b2450513          	addi	a0,a0,-1244 # fc400b24 <ebss+0xfffe1a84>
fc404104:	fca42a23          	sw	a0,-44(s0)
fc404108:	fa440513          	addi	a0,s0,-92
fc40410c:	fca42823          	sw	a0,-48(s0)
fc404110:	fc405537          	lui	a0,0xfc405
fc404114:	34450513          	addi	a0,a0,836 # fc405344 <ebss+0xfffe62a4>
fc404118:	fca42623          	sw	a0,-52(s0)
fc40411c:	fa040513          	addi	a0,s0,-96
fc404120:	fca42423          	sw	a0,-56(s0)
fc404124:	00200513          	li	a0,2
fc404128:	fca42223          	sw	a0,-60(s0)
fc40412c:	faa42e23          	sw	a0,-68(s0)
fc404130:	faa42a23          	sw	a0,-76(s0)
fc404134:	fe040593          	addi	a1,s0,-32
fc404138:	fcb42e23          	sw	a1,-36(s0)
fc40413c:	00100593          	li	a1,1
fc404140:	feb42a23          	sw	a1,-12(s0)
fc404144:	fa840593          	addi	a1,s0,-88
fc404148:	feb42823          	sw	a1,-16(s0)
fc40414c:	fea42223          	sw	a0,-28(s0)
fc404150:	fc408537          	lui	a0,0xfc408
fc404154:	c5850513          	addi	a0,a0,-936 # fc407c58 <ebss+0xfffe8bb8>
fc404158:	fea42023          	sw	a0,-32(s0)
fc40415c:	fc406537          	lui	a0,0xfc406
fc404160:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc404164:	fe042423          	sw	zero,-24(s0)
fc404168:	fdc40513          	addi	a0,s0,-36
fc40416c:	fe040613          	addi	a2,s0,-32
fc404170:	ffffe097          	auipc	ra,0xffffe
fc404174:	cf8080e7          	jalr	-776(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc404178:	00051e63          	bnez	a0,fc404194 <_ZN2os4init15test_page_table17h4eb441ce4caabc4eE+0xec>
fc40417c:	c0000537          	lui	a0,0xc0000
fc404180:	00052023          	sw	zero,0(a0) # c0000000 <ebss+0xc3be0f60>
fc404184:	05812403          	lw	s0,88(sp)
fc404188:	05c12083          	lw	ra,92(sp)
fc40418c:	06010113          	addi	sp,sp,96
fc404190:	00008067          	ret
fc404194:	fc406537          	lui	a0,0xfc406
fc404198:	11450513          	addi	a0,a0,276 # fc406114 <ebss+0xfffe7074>
fc40419c:	fc4065b7          	lui	a1,0xfc406
fc4041a0:	14058693          	addi	a3,a1,320 # fc406140 <ebss+0xfffe70a0>
fc4041a4:	fe040613          	addi	a2,s0,-32
fc4041a8:	02b00593          	li	a1,43
fc4041ac:	ffffd097          	auipc	ra,0xffffd
fc4041b0:	05c080e7          	jalr	92(ra) # fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>
fc4041b4:	ffffc097          	auipc	ra,0xffffc
fc4041b8:	304080e7          	jalr	772(ra) # fc4004b8 <abort>

fc4041bc <_ZN2os5clock4init17h96b1e36cfc31bf8eE>:
fc4041bc:	fb010113          	addi	sp,sp,-80
fc4041c0:	04112623          	sw	ra,76(sp)
fc4041c4:	04812423          	sw	s0,72(sp)
fc4041c8:	05010413          	addi	s0,sp,80
fc4041cc:	fc41f537          	lui	a0,0xfc41f
fc4041d0:	0a052023          	sw	zero,160(a0) # fc41f0a0 <ebss+0x0>
fc4041d4:	02000513          	li	a0,32
fc4041d8:	10452073          	csrs	sie,a0
fc4041dc:	c81025f3          	rdtimeh	a1
fc4041e0:	c0102673          	rdtime	a2
fc4041e4:	c8102573          	rdtimeh	a0
fc4041e8:	fea59ae3          	bne	a1,a0,fc4041dc <_ZN2os5clock4init17h96b1e36cfc31bf8eE+0x20>
fc4041ec:	3e860513          	addi	a0,a2,1000
fc4041f0:	00c53633          	sltu	a2,a0,a2
fc4041f4:	00c585b3          	add	a1,a1,a2
fc4041f8:	00000613          	li	a2,0
fc4041fc:	00000893          	li	a7,0
fc404200:	00000073          	ecall
fc404204:	fc402537          	lui	a0,0xfc402
fc404208:	dfc50513          	addi	a0,a0,-516 # fc401dfc <ebss+0xfffe2d5c>
fc40420c:	faa42e23          	sw	a0,-68(s0)
fc404210:	fc040513          	addi	a0,s0,-64
fc404214:	faa42c23          	sw	a0,-72(s0)
fc404218:	00400513          	li	a0,4
fc40421c:	fca42823          	sw	a0,-48(s0)
fc404220:	fc408537          	lui	a0,0xfc408
fc404224:	df450513          	addi	a0,a0,-524 # fc407df4 <ebss+0xfffe8d54>
fc404228:	fca42023          	sw	a0,-64(s0)
fc40422c:	fc042a23          	sw	zero,-44(s0)
fc404230:	fc042423          	sw	zero,-56(s0)
fc404234:	00100513          	li	a0,1
fc404238:	fca42223          	sw	a0,-60(s0)
fc40423c:	fe040593          	addi	a1,s0,-32
fc404240:	fcb42e23          	sw	a1,-36(s0)
fc404244:	fea42a23          	sw	a0,-12(s0)
fc404248:	fb840513          	addi	a0,s0,-72
fc40424c:	fea42823          	sw	a0,-16(s0)
fc404250:	00200513          	li	a0,2
fc404254:	fea42223          	sw	a0,-28(s0)
fc404258:	fc408537          	lui	a0,0xfc408
fc40425c:	dcc50513          	addi	a0,a0,-564 # fc407dcc <ebss+0xfffe8d2c>
fc404260:	fea42023          	sw	a0,-32(s0)
fc404264:	fc406537          	lui	a0,0xfc406
fc404268:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc40426c:	fe042423          	sw	zero,-24(s0)
fc404270:	fdc40513          	addi	a0,s0,-36
fc404274:	fe040613          	addi	a2,s0,-32
fc404278:	ffffe097          	auipc	ra,0xffffe
fc40427c:	bf0080e7          	jalr	-1040(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc404280:	00051a63          	bnez	a0,fc404294 <_ZN2os5clock4init17h96b1e36cfc31bf8eE+0xd8>
fc404284:	04812403          	lw	s0,72(sp)
fc404288:	04c12083          	lw	ra,76(sp)
fc40428c:	05010113          	addi	sp,sp,80
fc404290:	00008067          	ret
fc404294:	fc406537          	lui	a0,0xfc406
fc404298:	11450513          	addi	a0,a0,276 # fc406114 <ebss+0xfffe7074>
fc40429c:	fc4065b7          	lui	a1,0xfc406
fc4042a0:	14058693          	addi	a3,a1,320 # fc406140 <ebss+0xfffe70a0>
fc4042a4:	fe040613          	addi	a2,s0,-32
fc4042a8:	02b00593          	li	a1,43
fc4042ac:	ffffd097          	auipc	ra,0xffffd
fc4042b0:	f5c080e7          	jalr	-164(ra) # fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>
fc4042b4:	ffffc097          	auipc	ra,0xffffc
fc4042b8:	204080e7          	jalr	516(ra) # fc4004b8 <abort>

fc4042bc <__alltraps>:
fc4042bc:	14011173          	csrrw	sp,sscratch,sp
fc4042c0:	00011463          	bnez	sp,fc4042c8 <trap_from_user>

fc4042c4 <trap_from_kernel>:
fc4042c4:	14002173          	csrr	sp,sscratch

fc4042c8 <trap_from_user>:
fc4042c8:	f7010113          	addi	sp,sp,-144
fc4042cc:	00112223          	sw	ra,4(sp)
fc4042d0:	00312623          	sw	gp,12(sp)
fc4042d4:	00412823          	sw	tp,16(sp)
fc4042d8:	00512a23          	sw	t0,20(sp)
fc4042dc:	00612c23          	sw	t1,24(sp)
fc4042e0:	00712e23          	sw	t2,28(sp)
fc4042e4:	02812023          	sw	s0,32(sp)
fc4042e8:	02912223          	sw	s1,36(sp)
fc4042ec:	02a12423          	sw	a0,40(sp)
fc4042f0:	02b12623          	sw	a1,44(sp)
fc4042f4:	02c12823          	sw	a2,48(sp)
fc4042f8:	02d12a23          	sw	a3,52(sp)
fc4042fc:	02e12c23          	sw	a4,56(sp)
fc404300:	02f12e23          	sw	a5,60(sp)
fc404304:	05012023          	sw	a6,64(sp)
fc404308:	05112223          	sw	a7,68(sp)
fc40430c:	05212423          	sw	s2,72(sp)
fc404310:	05312623          	sw	s3,76(sp)
fc404314:	05412823          	sw	s4,80(sp)
fc404318:	05512a23          	sw	s5,84(sp)
fc40431c:	05612c23          	sw	s6,88(sp)
fc404320:	05712e23          	sw	s7,92(sp)
fc404324:	07812023          	sw	s8,96(sp)
fc404328:	07912223          	sw	s9,100(sp)
fc40432c:	07a12423          	sw	s10,104(sp)
fc404330:	07b12623          	sw	s11,108(sp)
fc404334:	07c12823          	sw	t3,112(sp)
fc404338:	07d12a23          	sw	t4,116(sp)
fc40433c:	07e12c23          	sw	t5,120(sp)
fc404340:	07f12e23          	sw	t6,124(sp)
fc404344:	14001473          	csrrw	s0,sscratch,zero
fc404348:	100024f3          	csrr	s1,sstatus
fc40434c:	14102973          	csrr	s2,sepc
fc404350:	143029f3          	csrr	s3,stval
fc404354:	14202a73          	csrr	s4,scause
fc404358:	00812423          	sw	s0,8(sp)
fc40435c:	08912023          	sw	s1,128(sp)
fc404360:	09212223          	sw	s2,132(sp)
fc404364:	09312423          	sw	s3,136(sp)
fc404368:	09412623          	sw	s4,140(sp)
fc40436c:	00010513          	mv	a0,sp
fc404370:	1fc000ef          	jal	ra,fc40456c <rust_trap>

fc404374 <__trapret>:
fc404374:	08012483          	lw	s1,128(sp)
fc404378:	08412903          	lw	s2,132(sp)
fc40437c:	1004f413          	andi	s0,s1,256
fc404380:	00041663          	bnez	s0,fc40438c <_to_kernel>

fc404384 <_to_user>:
fc404384:	09010413          	addi	s0,sp,144
fc404388:	14041073          	csrw	sscratch,s0

fc40438c <_to_kernel>:
fc40438c:	10049073          	csrw	sstatus,s1
fc404390:	14191073          	csrw	sepc,s2
fc404394:	00412083          	lw	ra,4(sp)
fc404398:	00c12183          	lw	gp,12(sp)
fc40439c:	01012203          	lw	tp,16(sp)
fc4043a0:	01412283          	lw	t0,20(sp)
fc4043a4:	01812303          	lw	t1,24(sp)
fc4043a8:	01c12383          	lw	t2,28(sp)
fc4043ac:	02012403          	lw	s0,32(sp)
fc4043b0:	02412483          	lw	s1,36(sp)
fc4043b4:	02812503          	lw	a0,40(sp)
fc4043b8:	02c12583          	lw	a1,44(sp)
fc4043bc:	03012603          	lw	a2,48(sp)
fc4043c0:	03412683          	lw	a3,52(sp)
fc4043c4:	03812703          	lw	a4,56(sp)
fc4043c8:	03c12783          	lw	a5,60(sp)
fc4043cc:	04012803          	lw	a6,64(sp)
fc4043d0:	04412883          	lw	a7,68(sp)
fc4043d4:	04812903          	lw	s2,72(sp)
fc4043d8:	04c12983          	lw	s3,76(sp)
fc4043dc:	05012a03          	lw	s4,80(sp)
fc4043e0:	05412a83          	lw	s5,84(sp)
fc4043e4:	05812b03          	lw	s6,88(sp)
fc4043e8:	05c12b83          	lw	s7,92(sp)
fc4043ec:	06012c03          	lw	s8,96(sp)
fc4043f0:	06412c83          	lw	s9,100(sp)
fc4043f4:	06812d03          	lw	s10,104(sp)
fc4043f8:	06c12d83          	lw	s11,108(sp)
fc4043fc:	07012e03          	lw	t3,112(sp)
fc404400:	07412e83          	lw	t4,116(sp)
fc404404:	07812f03          	lw	t5,120(sp)
fc404408:	07c12f83          	lw	t6,124(sp)
fc40440c:	00812103          	lw	sp,8(sp)
fc404410:	10200073          	sret

fc404414 <_ZN5riscv8register6scause6Scause5cause17h294b8e154401e826E>:
fc404414:	ff010113          	addi	sp,sp,-16
fc404418:	00112623          	sw	ra,12(sp)
fc40441c:	00812423          	sw	s0,8(sp)
fc404420:	00912223          	sw	s1,4(sp)
fc404424:	01212023          	sw	s2,0(sp)
fc404428:	01010413          	addi	s0,sp,16
fc40442c:	00050493          	mv	s1,a0
fc404430:	01f00593          	li	a1,31
fc404434:	00000097          	auipc	ra,0x0
fc404438:	478080e7          	jalr	1144(ra) # fc4048ac <_ZN43_$LT$i32$u20$as$u20$bit_field..BitField$GT$7get_bit17h50438ade6d2400e9E>
fc40443c:	00050913          	mv	s2,a0
fc404440:	00048513          	mv	a0,s1
fc404444:	00001097          	auipc	ra,0x1
fc404448:	8fc080e7          	jalr	-1796(ra) # fc404d40 <_ZN5riscv8register6scause6Scause4code17hb73ccdeaa2d722c2E>
fc40444c:	00090c63          	beqz	s2,fc404464 <_ZN5riscv8register6scause6Scause5cause17h294b8e154401e826E+0x50>
fc404450:	00000097          	auipc	ra,0x0
fc404454:	6cc080e7          	jalr	1740(ra) # fc404b1c <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE>
fc404458:	0ff57593          	andi	a1,a0,255
fc40445c:	00000513          	li	a0,0
fc404460:	0180006f          	j	fc404478 <_ZN5riscv8register6scause6Scause5cause17h294b8e154401e826E+0x64>
fc404464:	00000097          	auipc	ra,0x0
fc404468:	77c080e7          	jalr	1916(ra) # fc404be0 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE>
fc40446c:	00050593          	mv	a1,a0
fc404470:	00100513          	li	a0,1
fc404474:	0ff5f593          	andi	a1,a1,255
fc404478:	00012903          	lw	s2,0(sp)
fc40447c:	00412483          	lw	s1,4(sp)
fc404480:	00812403          	lw	s0,8(sp)
fc404484:	00c12083          	lw	ra,12(sp)
fc404488:	01010113          	addi	sp,sp,16
fc40448c:	00008067          	ret

fc404490 <_ZN2os9interrupt4init17hcf56f6dec65f6944E>:
fc404490:	fb010113          	addi	sp,sp,-80
fc404494:	04112623          	sw	ra,76(sp)
fc404498:	04812423          	sw	s0,72(sp)
fc40449c:	05010413          	addi	s0,sp,80
fc4044a0:	14001073          	csrw	sscratch,zero
fc4044a4:	fc404537          	lui	a0,0xfc404
fc4044a8:	2bc50513          	addi	a0,a0,700 # fc4042bc <ebss+0xfffe521c>
fc4044ac:	10551073          	csrw	stvec,a0
fc4044b0:	00200513          	li	a0,2
fc4044b4:	10052073          	csrs	sstatus,a0
fc4044b8:	fc4025b7          	lui	a1,0xfc402
fc4044bc:	dfc58593          	addi	a1,a1,-516 # fc401dfc <ebss+0xfffe2d5c>
fc4044c0:	fab42e23          	sw	a1,-68(s0)
fc4044c4:	fc040593          	addi	a1,s0,-64
fc4044c8:	fab42c23          	sw	a1,-72(s0)
fc4044cc:	00400593          	li	a1,4
fc4044d0:	fcb42823          	sw	a1,-48(s0)
fc4044d4:	fc4085b7          	lui	a1,0xfc408
fc4044d8:	e2c58593          	addi	a1,a1,-468 # fc407e2c <ebss+0xfffe8d8c>
fc4044dc:	fcb42023          	sw	a1,-64(s0)
fc4044e0:	fc042a23          	sw	zero,-44(s0)
fc4044e4:	fc042423          	sw	zero,-56(s0)
fc4044e8:	00100593          	li	a1,1
fc4044ec:	fcb42223          	sw	a1,-60(s0)
fc4044f0:	fe040613          	addi	a2,s0,-32
fc4044f4:	fcc42e23          	sw	a2,-36(s0)
fc4044f8:	feb42a23          	sw	a1,-12(s0)
fc4044fc:	fb840593          	addi	a1,s0,-72
fc404500:	feb42823          	sw	a1,-16(s0)
fc404504:	fea42223          	sw	a0,-28(s0)
fc404508:	fc408537          	lui	a0,0xfc408
fc40450c:	e0050513          	addi	a0,a0,-512 # fc407e00 <ebss+0xfffe8d60>
fc404510:	fea42023          	sw	a0,-32(s0)
fc404514:	fc406537          	lui	a0,0xfc406
fc404518:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc40451c:	fe042423          	sw	zero,-24(s0)
fc404520:	fdc40513          	addi	a0,s0,-36
fc404524:	fe040613          	addi	a2,s0,-32
fc404528:	ffffe097          	auipc	ra,0xffffe
fc40452c:	940080e7          	jalr	-1728(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc404530:	00051a63          	bnez	a0,fc404544 <_ZN2os9interrupt4init17hcf56f6dec65f6944E+0xb4>
fc404534:	04812403          	lw	s0,72(sp)
fc404538:	04c12083          	lw	ra,76(sp)
fc40453c:	05010113          	addi	sp,sp,80
fc404540:	00008067          	ret
fc404544:	fc406537          	lui	a0,0xfc406
fc404548:	11450513          	addi	a0,a0,276 # fc406114 <ebss+0xfffe7074>
fc40454c:	fc4065b7          	lui	a1,0xfc406
fc404550:	14058693          	addi	a3,a1,320 # fc406140 <ebss+0xfffe70a0>
fc404554:	fe040613          	addi	a2,s0,-32
fc404558:	02b00593          	li	a1,43
fc40455c:	ffffd097          	auipc	ra,0xffffd
fc404560:	cac080e7          	jalr	-852(ra) # fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>
fc404564:	ffffc097          	auipc	ra,0xffffc
fc404568:	f54080e7          	jalr	-172(ra) # fc4004b8 <abort>

fc40456c <rust_trap>:
fc40456c:	fa010113          	addi	sp,sp,-96
fc404570:	04112e23          	sw	ra,92(sp)
fc404574:	04812c23          	sw	s0,88(sp)
fc404578:	04912a23          	sw	s1,84(sp)
fc40457c:	05212823          	sw	s2,80(sp)
fc404580:	05312623          	sw	s3,76(sp)
fc404584:	06010413          	addi	s0,sp,96
fc404588:	00050913          	mv	s2,a0
fc40458c:	faa42223          	sw	a0,-92(s0)
fc404590:	08c50493          	addi	s1,a0,140
fc404594:	00048513          	mv	a0,s1
fc404598:	01f00593          	li	a1,31
fc40459c:	00000097          	auipc	ra,0x0
fc4045a0:	310080e7          	jalr	784(ra) # fc4048ac <_ZN43_$LT$i32$u20$as$u20$bit_field..BitField$GT$7get_bit17h50438ade6d2400e9E>
fc4045a4:	00050993          	mv	s3,a0
fc4045a8:	00048513          	mv	a0,s1
fc4045ac:	00000097          	auipc	ra,0x0
fc4045b0:	794080e7          	jalr	1940(ra) # fc404d40 <_ZN5riscv8register6scause6Scause4code17hb73ccdeaa2d722c2E>
fc4045b4:	10098663          	beqz	s3,fc4046c0 <rust_trap+0x154>
fc4045b8:	00000097          	auipc	ra,0x0
fc4045bc:	564080e7          	jalr	1380(ra) # fc404b1c <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE>
fc4045c0:	0ff57513          	andi	a0,a0,255
fc4045c4:	00300593          	li	a1,3
fc4045c8:	14b51263          	bne	a0,a1,fc40470c <rust_trap+0x1a0>
fc4045cc:	c81025f3          	rdtimeh	a1
fc4045d0:	c0102673          	rdtime	a2
fc4045d4:	c8102573          	rdtimeh	a0
fc4045d8:	fea59ae3          	bne	a1,a0,fc4045cc <rust_trap+0x60>
fc4045dc:	3e860513          	addi	a0,a2,1000
fc4045e0:	00c53633          	sltu	a2,a0,a2
fc4045e4:	00c585b3          	add	a1,a1,a2
fc4045e8:	00000613          	li	a2,0
fc4045ec:	00000893          	li	a7,0
fc4045f0:	00000073          	ecall
fc4045f4:	fc41f537          	lui	a0,0xfc41f
fc4045f8:	0a052583          	lw	a1,160(a0) # fc41f0a0 <ebss+0x0>
fc4045fc:	00158593          	addi	a1,a1,1
fc404600:	0ab52023          	sw	a1,160(a0)
fc404604:	ccccd537          	lui	a0,0xccccd
fc404608:	ccd50513          	addi	a0,a0,-819 # cccccccd <ebss+0xd08adc2d>
fc40460c:	02a5b533          	mulhu	a0,a1,a0
fc404610:	00355513          	srli	a0,a0,0x3
fc404614:	00a00613          	li	a2,10
fc404618:	02c50533          	mul	a0,a0,a2
fc40461c:	40a58533          	sub	a0,a1,a0
fc404620:	08051263          	bnez	a0,fc4046a4 <rust_trap+0x138>
fc404624:	fb040513          	addi	a0,s0,-80
fc404628:	faa42423          	sw	a0,-88(s0)
fc40462c:	00400513          	li	a0,4
fc404630:	fca42023          	sw	a0,-64(s0)
fc404634:	fc408537          	lui	a0,0xfc408
fc404638:	f4450513          	addi	a0,a0,-188 # fc407f44 <ebss+0xfffe8ea4>
fc40463c:	faa42823          	sw	a0,-80(s0)
fc404640:	fc402537          	lui	a0,0xfc402
fc404644:	dfc50513          	addi	a0,a0,-516 # fc401dfc <ebss+0xfffe2d5c>
fc404648:	faa42623          	sw	a0,-84(s0)
fc40464c:	fc042223          	sw	zero,-60(s0)
fc404650:	fa042c23          	sw	zero,-72(s0)
fc404654:	00100513          	li	a0,1
fc404658:	faa42a23          	sw	a0,-76(s0)
fc40465c:	fd040593          	addi	a1,s0,-48
fc404660:	fcb42623          	sw	a1,-52(s0)
fc404664:	fea42223          	sw	a0,-28(s0)
fc404668:	fa840513          	addi	a0,s0,-88
fc40466c:	fea42023          	sw	a0,-32(s0)
fc404670:	00200513          	li	a0,2
fc404674:	fca42a23          	sw	a0,-44(s0)
fc404678:	fc408537          	lui	a0,0xfc408
fc40467c:	e0050513          	addi	a0,a0,-512 # fc407e00 <ebss+0xfffe8d60>
fc404680:	fca42823          	sw	a0,-48(s0)
fc404684:	fc042c23          	sw	zero,-40(s0)
fc404688:	fc406537          	lui	a0,0xfc406
fc40468c:	0fc50593          	addi	a1,a0,252 # fc4060fc <ebss+0xfffe705c>
fc404690:	fcc40513          	addi	a0,s0,-52
fc404694:	fd040613          	addi	a2,s0,-48
fc404698:	ffffd097          	auipc	ra,0xffffd
fc40469c:	7d0080e7          	jalr	2000(ra) # fc401e68 <_ZN4core3fmt5write17h92d9c3fe00bde39aE>
fc4046a0:	0c051663          	bnez	a0,fc40476c <rust_trap+0x200>
fc4046a4:	04c12983          	lw	s3,76(sp)
fc4046a8:	05012903          	lw	s2,80(sp)
fc4046ac:	05412483          	lw	s1,84(sp)
fc4046b0:	05812403          	lw	s0,88(sp)
fc4046b4:	05c12083          	lw	ra,92(sp)
fc4046b8:	06010113          	addi	sp,sp,96
fc4046bc:	00008067          	ret
fc4046c0:	00000097          	auipc	ra,0x0
fc4046c4:	520080e7          	jalr	1312(ra) # fc404be0 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE>
fc4046c8:	0ff57513          	andi	a0,a0,255
fc4046cc:	00800593          	li	a1,8
fc4046d0:	00a5cc63          	blt	a1,a0,fc4046e8 <rust_trap+0x17c>
fc4046d4:	00300593          	li	a1,3
fc4046d8:	0ab50e63          	beq	a0,a1,fc404794 <rust_trap+0x228>
fc4046dc:	00800593          	li	a1,8
fc4046e0:	00b50c63          	beq	a0,a1,fc4046f8 <rust_trap+0x18c>
fc4046e4:	0280006f          	j	fc40470c <rust_trap+0x1a0>
fc4046e8:	00900593          	li	a1,9
fc4046ec:	00b50663          	beq	a0,a1,fc4046f8 <rust_trap+0x18c>
fc4046f0:	00a00593          	li	a1,10
fc4046f4:	00b51c63          	bne	a0,a1,fc40470c <rust_trap+0x1a0>
fc4046f8:	00090513          	mv	a0,s2
fc4046fc:	00000097          	auipc	ra,0x0
fc404700:	0a8080e7          	jalr	168(ra) # fc4047a4 <_ZN2os9interrupt10page_fault17hd8b443a723544aa7E>
fc404704:	ffffc097          	auipc	ra,0xffffc
fc404708:	db4080e7          	jalr	-588(ra) # fc4004b8 <abort>
fc40470c:	fb040513          	addi	a0,s0,-80
fc404710:	fea42023          	sw	a0,-32(s0)
fc404714:	00100513          	li	a0,1
fc404718:	fea42223          	sw	a0,-28(s0)
fc40471c:	fca42e23          	sw	a0,-36(s0)
fc404720:	fca42a23          	sw	a0,-44(s0)
fc404724:	fc405537          	lui	a0,0xfc405
fc404728:	92050513          	addi	a0,a0,-1760 # fc404920 <ebss+0xfffe5880>
fc40472c:	faa42a23          	sw	a0,-76(s0)
fc404730:	fa440513          	addi	a0,s0,-92
fc404734:	faa42823          	sw	a0,-80(s0)
fc404738:	fc408537          	lui	a0,0xfc408
fc40473c:	e5050513          	addi	a0,a0,-432 # fc407e50 <ebss+0xfffe8db0>
fc404740:	fca42c23          	sw	a0,-40(s0)
fc404744:	fc408537          	lui	a0,0xfc408
fc404748:	e4850513          	addi	a0,a0,-440 # fc407e48 <ebss+0xfffe8da8>
fc40474c:	fca42823          	sw	a0,-48(s0)
fc404750:	fc408537          	lui	a0,0xfc408
fc404754:	e7450593          	addi	a1,a0,-396 # fc407e74 <ebss+0xfffe8dd4>
fc404758:	fd040513          	addi	a0,s0,-48
fc40475c:	ffffd097          	auipc	ra,0xffffd
fc404760:	a50080e7          	jalr	-1456(ra) # fc4011ac <_ZN4core9panicking9panic_fmt17h6559b191f43a095dE>
fc404764:	ffffc097          	auipc	ra,0xffffc
fc404768:	d54080e7          	jalr	-684(ra) # fc4004b8 <abort>
fc40476c:	fc406537          	lui	a0,0xfc406
fc404770:	11450513          	addi	a0,a0,276 # fc406114 <ebss+0xfffe7074>
fc404774:	fc4065b7          	lui	a1,0xfc406
fc404778:	14058693          	addi	a3,a1,320 # fc406140 <ebss+0xfffe70a0>
fc40477c:	fd040613          	addi	a2,s0,-48
fc404780:	02b00593          	li	a1,43
fc404784:	ffffd097          	auipc	ra,0xffffd
fc404788:	a84080e7          	jalr	-1404(ra) # fc401208 <_ZN4core6result13unwrap_failed17h8a5d95869270729dE>
fc40478c:	ffffc097          	auipc	ra,0xffffc
fc404790:	d2c080e7          	jalr	-724(ra) # fc4004b8 <abort>
fc404794:	00000097          	auipc	ra,0x0
fc404798:	0f0080e7          	jalr	240(ra) # fc404884 <_ZN2os9interrupt10breakpoint17hb67617b9ebb3ba9cE>
fc40479c:	ffffc097          	auipc	ra,0xffffc
fc4047a0:	d1c080e7          	jalr	-740(ra) # fc4004b8 <abort>

fc4047a4 <_ZN2os9interrupt10page_fault17hd8b443a723544aa7E>:
fc4047a4:	fa010113          	addi	sp,sp,-96
fc4047a8:	04112e23          	sw	ra,92(sp)
fc4047ac:	04812c23          	sw	s0,88(sp)
fc4047b0:	04912a23          	sw	s1,84(sp)
fc4047b4:	06010413          	addi	s0,sp,96
fc4047b8:	00050493          	mv	s1,a0
fc4047bc:	08c50513          	addi	a0,a0,140
fc4047c0:	00000097          	auipc	ra,0x0
fc4047c4:	c54080e7          	jalr	-940(ra) # fc404414 <_ZN5riscv8register6scause6Scause5cause17h294b8e154401e826E>
fc4047c8:	feb408a3          	sb	a1,-15(s0)
fc4047cc:	fea40823          	sb	a0,-16(s0)
fc4047d0:	fc401537          	lui	a0,0xfc401
fc4047d4:	b2450513          	addi	a0,a0,-1244 # fc400b24 <ebss+0xfffe1a84>
fc4047d8:	fea42623          	sw	a0,-20(s0)
fc4047dc:	08848513          	addi	a0,s1,136
fc4047e0:	fea42423          	sw	a0,-24(s0)
fc4047e4:	fc405537          	lui	a0,0xfc405
fc4047e8:	df450513          	addi	a0,a0,-524 # fc404df4 <ebss+0xfffe5d54>
fc4047ec:	fea42223          	sw	a0,-28(s0)
fc4047f0:	ff040513          	addi	a0,s0,-16
fc4047f4:	fea42023          	sw	a0,-32(s0)
fc4047f8:	fe040513          	addi	a0,s0,-32
fc4047fc:	fca42c23          	sw	a0,-40(s0)
fc404800:	fc408537          	lui	a0,0xfc408
fc404804:	e9850513          	addi	a0,a0,-360 # fc407e98 <ebss+0xfffe8df8>
fc404808:	fca42823          	sw	a0,-48(s0)
fc40480c:	fc408537          	lui	a0,0xfc408
fc404810:	e8850513          	addi	a0,a0,-376 # fc407e88 <ebss+0xfffe8de8>
fc404814:	fca42423          	sw	a0,-56(s0)
fc404818:	fc402537          	lui	a0,0xfc402
fc40481c:	dfc50513          	addi	a0,a0,-516 # fc401dfc <ebss+0xfffe2d5c>
fc404820:	fca42223          	sw	a0,-60(s0)
fc404824:	fc840513          	addi	a0,s0,-56
fc404828:	fca42023          	sw	a0,-64(s0)
fc40482c:	00100513          	li	a0,1
fc404830:	faa42e23          	sw	a0,-68(s0)
fc404834:	fc040513          	addi	a0,s0,-64
fc404838:	faa42c23          	sw	a0,-72(s0)
fc40483c:	fa042823          	sw	zero,-80(s0)
fc404840:	00200513          	li	a0,2
fc404844:	fca42e23          	sw	a0,-36(s0)
fc404848:	fca42a23          	sw	a0,-44(s0)
fc40484c:	fca42623          	sw	a0,-52(s0)
fc404850:	faa42623          	sw	a0,-84(s0)
fc404854:	fc408537          	lui	a0,0xfc408
fc404858:	e0050513          	addi	a0,a0,-512 # fc407e00 <ebss+0xfffe8d60>
fc40485c:	faa42423          	sw	a0,-88(s0)
fc404860:	fa840513          	addi	a0,s0,-88
fc404864:	ffffc097          	auipc	ra,0xffffc
fc404868:	050080e7          	jalr	80(ra) # fc4008b4 <_ZN2os2io6_print17h5deb1cd274d85726E>
fc40486c:	fc408537          	lui	a0,0xfc408
fc404870:	eec50513          	addi	a0,a0,-276 # fc407eec <ebss+0xfffe8e4c>
fc404874:	ffffd097          	auipc	ra,0xffffd
fc404878:	848080e7          	jalr	-1976(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc40487c:	ffffc097          	auipc	ra,0xffffc
fc404880:	c3c080e7          	jalr	-964(ra) # fc4004b8 <abort>

fc404884 <_ZN2os9interrupt10breakpoint17hb67617b9ebb3ba9cE>:
fc404884:	ff010113          	addi	sp,sp,-16
fc404888:	00112623          	sw	ra,12(sp)
fc40488c:	00812423          	sw	s0,8(sp)
fc404890:	01010413          	addi	s0,sp,16
fc404894:	fc408537          	lui	a0,0xfc408
fc404898:	f2050513          	addi	a0,a0,-224 # fc407f20 <ebss+0xfffe8e80>
fc40489c:	ffffd097          	auipc	ra,0xffffd
fc4048a0:	820080e7          	jalr	-2016(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc4048a4:	ffffc097          	auipc	ra,0xffffc
fc4048a8:	c14080e7          	jalr	-1004(ra) # fc4004b8 <abort>

fc4048ac <_ZN43_$LT$i32$u20$as$u20$bit_field..BitField$GT$7get_bit17h50438ade6d2400e9E>:
fc4048ac:	ff010113          	addi	sp,sp,-16
fc4048b0:	00112623          	sw	ra,12(sp)
fc4048b4:	00812423          	sw	s0,8(sp)
fc4048b8:	01010413          	addi	s0,sp,16
fc4048bc:	01f00613          	li	a2,31
fc4048c0:	02b66463          	bltu	a2,a1,fc4048e8 <_ZN43_$LT$i32$u20$as$u20$bit_field..BitField$GT$7get_bit17h50438ade6d2400e9E+0x3c>
fc4048c4:	00100613          	li	a2,1
fc4048c8:	00b615b3          	sll	a1,a2,a1
fc4048cc:	00052503          	lw	a0,0(a0)
fc4048d0:	00b57533          	and	a0,a0,a1
fc4048d4:	00a03533          	snez	a0,a0
fc4048d8:	00812403          	lw	s0,8(sp)
fc4048dc:	00c12083          	lw	ra,12(sp)
fc4048e0:	01010113          	addi	sp,sp,16
fc4048e4:	00008067          	ret
fc4048e8:	fc408537          	lui	a0,0xfc408
fc4048ec:	fd450513          	addi	a0,a0,-44 # fc407fd4 <ebss+0xfffe8f34>
fc4048f0:	ffffc097          	auipc	ra,0xffffc
fc4048f4:	7cc080e7          	jalr	1996(ra) # fc4010bc <_ZN4core9panicking5panic17haab66657684ab8a8E>
fc4048f8:	ffffc097          	auipc	ra,0xffffc
fc4048fc:	bc0080e7          	jalr	-1088(ra) # fc4004b8 <abort>

fc404900 <_ZN4core3ptr18real_drop_in_place17h1eb29c105c3a55cfE>:
fc404900:	ff010113          	addi	sp,sp,-16
fc404904:	00112623          	sw	ra,12(sp)
fc404908:	00812423          	sw	s0,8(sp)
fc40490c:	01010413          	addi	s0,sp,16
fc404910:	00812403          	lw	s0,8(sp)
fc404914:	00c12083          	lw	ra,12(sp)
fc404918:	01010113          	addi	sp,sp,16
fc40491c:	00008067          	ret

fc404920 <_ZN50_$LT$$RF$mut$u20$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h909f96e0105f1c6aE>:
fc404920:	fe010113          	addi	sp,sp,-32
fc404924:	00112e23          	sw	ra,28(sp)
fc404928:	00812c23          	sw	s0,24(sp)
fc40492c:	00912a23          	sw	s1,20(sp)
fc404930:	01212823          	sw	s2,16(sp)
fc404934:	01312623          	sw	s3,12(sp)
fc404938:	02010413          	addi	s0,sp,32
fc40493c:	00052983          	lw	s3,0(a0)
fc404940:	fc408537          	lui	a0,0xfc408
fc404944:	fec50613          	addi	a2,a0,-20 # fc407fec <ebss+0xfffe8f4c>
fc404948:	fe040913          	addi	s2,s0,-32
fc40494c:	00090513          	mv	a0,s2
fc404950:	00900693          	li	a3,9
fc404954:	ffffe097          	auipc	ra,0xffffe
fc404958:	14c080e7          	jalr	332(ra) # fc402aa0 <_ZN4core3fmt9Formatter12debug_struct17h94e731b2ac64d90aE>
fc40495c:	ff342423          	sw	s3,-24(s0)
fc404960:	fc408537          	lui	a0,0xfc408
fc404964:	ff550593          	addi	a1,a0,-11 # fc407ff5 <ebss+0xfffe8f55>
fc404968:	fc408537          	lui	a0,0xfc408
fc40496c:	ff850713          	addi	a4,a0,-8 # fc407ff8 <ebss+0xfffe8f58>
fc404970:	fe840693          	addi	a3,s0,-24
fc404974:	00090513          	mv	a0,s2
fc404978:	00100613          	li	a2,1
fc40497c:	fffff097          	auipc	ra,0xfffff
fc404980:	a84080e7          	jalr	-1404(ra) # fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>
fc404984:	08098513          	addi	a0,s3,128
fc404988:	fea42423          	sw	a0,-24(s0)
fc40498c:	fc408537          	lui	a0,0xfc408
fc404990:	00850593          	addi	a1,a0,8 # fc408008 <ebss+0xfffe8f68>
fc404994:	fc408537          	lui	a0,0xfc408
fc404998:	01050713          	addi	a4,a0,16 # fc408010 <ebss+0xfffe8f70>
fc40499c:	fe840693          	addi	a3,s0,-24
fc4049a0:	00090513          	mv	a0,s2
fc4049a4:	00700613          	li	a2,7
fc4049a8:	fffff097          	auipc	ra,0xfffff
fc4049ac:	a58080e7          	jalr	-1448(ra) # fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>
fc4049b0:	08498513          	addi	a0,s3,132
fc4049b4:	fea42423          	sw	a0,-24(s0)
fc4049b8:	fc406537          	lui	a0,0xfc406
fc4049bc:	60c50593          	addi	a1,a0,1548 # fc40660c <ebss+0xfffe756c>
fc4049c0:	fc408537          	lui	a0,0xfc408
fc4049c4:	02050493          	addi	s1,a0,32 # fc408020 <ebss+0xfffe8f80>
fc4049c8:	fe840693          	addi	a3,s0,-24
fc4049cc:	00090513          	mv	a0,s2
fc4049d0:	00400613          	li	a2,4
fc4049d4:	00048713          	mv	a4,s1
fc4049d8:	fffff097          	auipc	ra,0xfffff
fc4049dc:	a28080e7          	jalr	-1496(ra) # fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>
fc4049e0:	08898513          	addi	a0,s3,136
fc4049e4:	fea42423          	sw	a0,-24(s0)
fc4049e8:	fc408537          	lui	a0,0xfc408
fc4049ec:	03050593          	addi	a1,a0,48 # fc408030 <ebss+0xfffe8f90>
fc4049f0:	fe840693          	addi	a3,s0,-24
fc4049f4:	00090513          	mv	a0,s2
fc4049f8:	00500613          	li	a2,5
fc4049fc:	00048713          	mv	a4,s1
fc404a00:	fffff097          	auipc	ra,0xfffff
fc404a04:	a00080e7          	jalr	-1536(ra) # fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>
fc404a08:	08c98513          	addi	a0,s3,140
fc404a0c:	fea42423          	sw	a0,-24(s0)
fc404a10:	fc408537          	lui	a0,0xfc408
fc404a14:	03550593          	addi	a1,a0,53 # fc408035 <ebss+0xfffe8f95>
fc404a18:	fc408537          	lui	a0,0xfc408
fc404a1c:	03c50713          	addi	a4,a0,60 # fc40803c <ebss+0xfffe8f9c>
fc404a20:	fe840693          	addi	a3,s0,-24
fc404a24:	00090513          	mv	a0,s2
fc404a28:	00600613          	li	a2,6
fc404a2c:	fffff097          	auipc	ra,0xfffff
fc404a30:	9d4080e7          	jalr	-1580(ra) # fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>
fc404a34:	00090513          	mv	a0,s2
fc404a38:	fffff097          	auipc	ra,0xfffff
fc404a3c:	c20080e7          	jalr	-992(ra) # fc403658 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE>
fc404a40:	00c12983          	lw	s3,12(sp)
fc404a44:	01012903          	lw	s2,16(sp)
fc404a48:	01412483          	lw	s1,20(sp)
fc404a4c:	01812403          	lw	s0,24(sp)
fc404a50:	01c12083          	lw	ra,28(sp)
fc404a54:	02010113          	addi	sp,sp,32
fc404a58:	00008067          	ret

fc404a5c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h10720d3b421ae385E>:
fc404a5c:	ff010113          	addi	sp,sp,-16
fc404a60:	00112623          	sw	ra,12(sp)
fc404a64:	00812423          	sw	s0,8(sp)
fc404a68:	01010413          	addi	s0,sp,16
fc404a6c:	00052503          	lw	a0,0(a0)
fc404a70:	00812403          	lw	s0,8(sp)
fc404a74:	00c12083          	lw	ra,12(sp)
fc404a78:	01010113          	addi	sp,sp,16
fc404a7c:	00000317          	auipc	t1,0x0
fc404a80:	2f430067          	jr	756(t1) # fc404d70 <_ZN68_$LT$riscv..register..scause..Scause$u20$as$u20$core..fmt..Debug$GT$3fmt17h1446fba0abbab7d6E>

fc404a84 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h92b39b269d374ff7E>:
fc404a84:	ff010113          	addi	sp,sp,-16
fc404a88:	00112623          	sw	ra,12(sp)
fc404a8c:	00812423          	sw	s0,8(sp)
fc404a90:	01010413          	addi	s0,sp,16
fc404a94:	00052503          	lw	a0,0(a0)
fc404a98:	00812403          	lw	s0,8(sp)
fc404a9c:	00c12083          	lw	ra,12(sp)
fc404aa0:	01010113          	addi	sp,sp,16
fc404aa4:	00000317          	auipc	t1,0x0
fc404aa8:	76430067          	jr	1892(t1) # fc405208 <_ZN70_$LT$riscv..register..sstatus..Sstatus$u20$as$u20$core..fmt..Debug$GT$3fmt17ha81aa24b05c4134dE>

fc404aac <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h00bfd99e7f26ff0dE>:
fc404aac:	ff010113          	addi	sp,sp,-16
fc404ab0:	00112623          	sw	ra,12(sp)
fc404ab4:	00812423          	sw	s0,8(sp)
fc404ab8:	01010413          	addi	s0,sp,16
fc404abc:	00052503          	lw	a0,0(a0)
fc404ac0:	00812403          	lw	s0,8(sp)
fc404ac4:	00c12083          	lw	ra,12(sp)
fc404ac8:	01010113          	addi	sp,sp,16
fc404acc:	00000317          	auipc	t1,0x0
fc404ad0:	3d830067          	jr	984(t1) # fc404ea4 <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E>

fc404ad4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h4b69d7148e6d201aE>:
fc404ad4:	ff010113          	addi	sp,sp,-16
fc404ad8:	00112623          	sw	ra,12(sp)
fc404adc:	00812423          	sw	s0,8(sp)
fc404ae0:	01010413          	addi	s0,sp,16
fc404ae4:	00052503          	lw	a0,0(a0)
fc404ae8:	00812403          	lw	s0,8(sp)
fc404aec:	00c12083          	lw	ra,12(sp)
fc404af0:	01010113          	addi	sp,sp,16
fc404af4:	00000317          	auipc	t1,0x0
fc404af8:	4c030067          	jr	1216(t1) # fc404fb4 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE>

fc404afc <_ZN4core3ptr18real_drop_in_place17h3832df34db79e071E>:
fc404afc:	ff010113          	addi	sp,sp,-16
fc404b00:	00112623          	sw	ra,12(sp)
fc404b04:	00812423          	sw	s0,8(sp)
fc404b08:	01010413          	addi	s0,sp,16
fc404b0c:	00812403          	lw	s0,8(sp)
fc404b10:	00c12083          	lw	ra,12(sp)
fc404b14:	01010113          	addi	sp,sp,16
fc404b18:	00008067          	ret

fc404b1c <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE>:
fc404b1c:	ff010113          	addi	sp,sp,-16
fc404b20:	00112623          	sw	ra,12(sp)
fc404b24:	00812423          	sw	s0,8(sp)
fc404b28:	01010413          	addi	s0,sp,16
fc404b2c:	00050593          	mv	a1,a0
fc404b30:	00600513          	li	a0,6
fc404b34:	00400613          	li	a2,4
fc404b38:	02b64663          	blt	a2,a1,fc404b64 <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE+0x48>
fc404b3c:	04058a63          	beqz	a1,fc404b90 <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE+0x74>
fc404b40:	00100613          	li	a2,1
fc404b44:	06c58063          	beq	a1,a2,fc404ba4 <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE+0x88>
fc404b48:	00400613          	li	a2,4
fc404b4c:	02c59a63          	bne	a1,a2,fc404b80 <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE+0x64>
fc404b50:	00200513          	li	a0,2
fc404b54:	00812403          	lw	s0,8(sp)
fc404b58:	00c12083          	lw	ra,12(sp)
fc404b5c:	01010113          	addi	sp,sp,16
fc404b60:	00008067          	ret
fc404b64:	00500613          	li	a2,5
fc404b68:	04c58863          	beq	a1,a2,fc404bb8 <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE+0x9c>
fc404b6c:	00800613          	li	a2,8
fc404b70:	04c58e63          	beq	a1,a2,fc404bcc <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE+0xb0>
fc404b74:	00900613          	li	a2,9
fc404b78:	00c59463          	bne	a1,a2,fc404b80 <_ZN5riscv8register6scause9Interrupt4from17h9e9a539d29d8834bE+0x64>
fc404b7c:	00500513          	li	a0,5
fc404b80:	00812403          	lw	s0,8(sp)
fc404b84:	00c12083          	lw	ra,12(sp)
fc404b88:	01010113          	addi	sp,sp,16
fc404b8c:	00008067          	ret
fc404b90:	00000513          	li	a0,0
fc404b94:	00812403          	lw	s0,8(sp)
fc404b98:	00c12083          	lw	ra,12(sp)
fc404b9c:	01010113          	addi	sp,sp,16
fc404ba0:	00008067          	ret
fc404ba4:	00100513          	li	a0,1
fc404ba8:	00812403          	lw	s0,8(sp)
fc404bac:	00c12083          	lw	ra,12(sp)
fc404bb0:	01010113          	addi	sp,sp,16
fc404bb4:	00008067          	ret
fc404bb8:	00300513          	li	a0,3
fc404bbc:	00812403          	lw	s0,8(sp)
fc404bc0:	00c12083          	lw	ra,12(sp)
fc404bc4:	01010113          	addi	sp,sp,16
fc404bc8:	00008067          	ret
fc404bcc:	00400513          	li	a0,4
fc404bd0:	00812403          	lw	s0,8(sp)
fc404bd4:	00c12083          	lw	ra,12(sp)
fc404bd8:	01010113          	addi	sp,sp,16
fc404bdc:	00008067          	ret

fc404be0 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE>:
fc404be0:	ff010113          	addi	sp,sp,-16
fc404be4:	00112623          	sw	ra,12(sp)
fc404be8:	00812423          	sw	s0,8(sp)
fc404bec:	01010413          	addi	s0,sp,16
fc404bf0:	00050593          	mv	a1,a0
fc404bf4:	00b00513          	li	a0,11
fc404bf8:	00500613          	li	a2,5
fc404bfc:	02b65c63          	bge	a2,a1,fc404c34 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0x54>
fc404c00:	00b00613          	li	a2,11
fc404c04:	06b64263          	blt	a2,a1,fc404c68 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0x88>
fc404c08:	00600613          	li	a2,6
fc404c0c:	0ac58463          	beq	a1,a2,fc404cb4 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xd4>
fc404c10:	00700613          	li	a2,7
fc404c14:	0ac58a63          	beq	a1,a2,fc404cc8 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xe8>
fc404c18:	00800613          	li	a2,8
fc404c1c:	08c59463          	bne	a1,a2,fc404ca4 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xc4>
fc404c20:	00700513          	li	a0,7
fc404c24:	00812403          	lw	s0,8(sp)
fc404c28:	00c12083          	lw	ra,12(sp)
fc404c2c:	01010113          	addi	sp,sp,16
fc404c30:	00008067          	ret
fc404c34:	00100613          	li	a2,1
fc404c38:	04b65e63          	bge	a2,a1,fc404c94 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xb4>
fc404c3c:	00200613          	li	a2,2
fc404c40:	08c58e63          	beq	a1,a2,fc404cdc <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xfc>
fc404c44:	00300613          	li	a2,3
fc404c48:	0ac58463          	beq	a1,a2,fc404cf0 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0x110>
fc404c4c:	00500613          	li	a2,5
fc404c50:	04c59a63          	bne	a1,a2,fc404ca4 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xc4>
fc404c54:	00400513          	li	a0,4
fc404c58:	00812403          	lw	s0,8(sp)
fc404c5c:	00c12083          	lw	ra,12(sp)
fc404c60:	01010113          	addi	sp,sp,16
fc404c64:	00008067          	ret
fc404c68:	00c00613          	li	a2,12
fc404c6c:	08c58c63          	beq	a1,a2,fc404d04 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0x124>
fc404c70:	00d00613          	li	a2,13
fc404c74:	0ac58263          	beq	a1,a2,fc404d18 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0x138>
fc404c78:	00f00613          	li	a2,15
fc404c7c:	02c59463          	bne	a1,a2,fc404ca4 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xc4>
fc404c80:	00a00513          	li	a0,10
fc404c84:	00812403          	lw	s0,8(sp)
fc404c88:	00c12083          	lw	ra,12(sp)
fc404c8c:	01010113          	addi	sp,sp,16
fc404c90:	00008067          	ret
fc404c94:	08058c63          	beqz	a1,fc404d2c <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0x14c>
fc404c98:	00100613          	li	a2,1
fc404c9c:	00c59463          	bne	a1,a2,fc404ca4 <_ZN5riscv8register6scause9Exception4from17h1c8f645d8df8091cE+0xc4>
fc404ca0:	00100513          	li	a0,1
fc404ca4:	00812403          	lw	s0,8(sp)
fc404ca8:	00c12083          	lw	ra,12(sp)
fc404cac:	01010113          	addi	sp,sp,16
fc404cb0:	00008067          	ret
fc404cb4:	00500513          	li	a0,5
fc404cb8:	00812403          	lw	s0,8(sp)
fc404cbc:	00c12083          	lw	ra,12(sp)
fc404cc0:	01010113          	addi	sp,sp,16
fc404cc4:	00008067          	ret
fc404cc8:	00600513          	li	a0,6
fc404ccc:	00812403          	lw	s0,8(sp)
fc404cd0:	00c12083          	lw	ra,12(sp)
fc404cd4:	01010113          	addi	sp,sp,16
fc404cd8:	00008067          	ret
fc404cdc:	00200513          	li	a0,2
fc404ce0:	00812403          	lw	s0,8(sp)
fc404ce4:	00c12083          	lw	ra,12(sp)
fc404ce8:	01010113          	addi	sp,sp,16
fc404cec:	00008067          	ret
fc404cf0:	00300513          	li	a0,3
fc404cf4:	00812403          	lw	s0,8(sp)
fc404cf8:	00c12083          	lw	ra,12(sp)
fc404cfc:	01010113          	addi	sp,sp,16
fc404d00:	00008067          	ret
fc404d04:	00800513          	li	a0,8
fc404d08:	00812403          	lw	s0,8(sp)
fc404d0c:	00c12083          	lw	ra,12(sp)
fc404d10:	01010113          	addi	sp,sp,16
fc404d14:	00008067          	ret
fc404d18:	00900513          	li	a0,9
fc404d1c:	00812403          	lw	s0,8(sp)
fc404d20:	00c12083          	lw	ra,12(sp)
fc404d24:	01010113          	addi	sp,sp,16
fc404d28:	00008067          	ret
fc404d2c:	00000513          	li	a0,0
fc404d30:	00812403          	lw	s0,8(sp)
fc404d34:	00c12083          	lw	ra,12(sp)
fc404d38:	01010113          	addi	sp,sp,16
fc404d3c:	00008067          	ret

fc404d40 <_ZN5riscv8register6scause6Scause4code17hb73ccdeaa2d722c2E>:
fc404d40:	ff010113          	addi	sp,sp,-16
fc404d44:	00112623          	sw	ra,12(sp)
fc404d48:	00812423          	sw	s0,8(sp)
fc404d4c:	01010413          	addi	s0,sp,16
fc404d50:	800005b7          	lui	a1,0x80000
fc404d54:	fff58593          	addi	a1,a1,-1 # 7fffffff <ebss+0x83be0f5f>
fc404d58:	00052503          	lw	a0,0(a0)
fc404d5c:	00b57533          	and	a0,a0,a1
fc404d60:	00812403          	lw	s0,8(sp)
fc404d64:	00c12083          	lw	ra,12(sp)
fc404d68:	01010113          	addi	sp,sp,16
fc404d6c:	00008067          	ret

fc404d70 <_ZN68_$LT$riscv..register..scause..Scause$u20$as$u20$core..fmt..Debug$GT$3fmt17h1446fba0abbab7d6E>:
fc404d70:	fe010113          	addi	sp,sp,-32
fc404d74:	00112e23          	sw	ra,28(sp)
fc404d78:	00812c23          	sw	s0,24(sp)
fc404d7c:	00912a23          	sw	s1,20(sp)
fc404d80:	01212823          	sw	s2,16(sp)
fc404d84:	02010413          	addi	s0,sp,32
fc404d88:	00050493          	mv	s1,a0
fc404d8c:	fc408537          	lui	a0,0xfc408
fc404d90:	04c50613          	addi	a2,a0,76 # fc40804c <ebss+0xfffe8fac>
fc404d94:	fe040913          	addi	s2,s0,-32
fc404d98:	00090513          	mv	a0,s2
fc404d9c:	00600693          	li	a3,6
fc404da0:	ffffe097          	auipc	ra,0xffffe
fc404da4:	d00080e7          	jalr	-768(ra) # fc402aa0 <_ZN4core3fmt9Formatter12debug_struct17h94e731b2ac64d90aE>
fc404da8:	fe942623          	sw	s1,-20(s0)
fc404dac:	fc406537          	lui	a0,0xfc406
fc404db0:	61050593          	addi	a1,a0,1552 # fc406610 <ebss+0xfffe7570>
fc404db4:	fc408537          	lui	a0,0xfc408
fc404db8:	05450713          	addi	a4,a0,84 # fc408054 <ebss+0xfffe8fb4>
fc404dbc:	fec40693          	addi	a3,s0,-20
fc404dc0:	00090513          	mv	a0,s2
fc404dc4:	00400613          	li	a2,4
fc404dc8:	ffffe097          	auipc	ra,0xffffe
fc404dcc:	638080e7          	jalr	1592(ra) # fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>
fc404dd0:	00090513          	mv	a0,s2
fc404dd4:	fffff097          	auipc	ra,0xfffff
fc404dd8:	884080e7          	jalr	-1916(ra) # fc403658 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE>
fc404ddc:	01012903          	lw	s2,16(sp)
fc404de0:	01412483          	lw	s1,20(sp)
fc404de4:	01812403          	lw	s0,24(sp)
fc404de8:	01c12083          	lw	ra,28(sp)
fc404dec:	02010113          	addi	sp,sp,32
fc404df0:	00008067          	ret

fc404df4 <_ZN66_$LT$riscv..register..scause..Trap$u20$as$u20$core..fmt..Debug$GT$3fmt17h7922058b299fa4a2E>:
fc404df4:	fe010113          	addi	sp,sp,-32
fc404df8:	00112e23          	sw	ra,28(sp)
fc404dfc:	00812c23          	sw	s0,24(sp)
fc404e00:	00912a23          	sw	s1,20(sp)
fc404e04:	01212823          	sw	s2,16(sp)
fc404e08:	02010413          	addi	s0,sp,32
fc404e0c:	00150913          	addi	s2,a0,1
fc404e10:	00054503          	lbu	a0,0(a0)
fc404e14:	00100613          	li	a2,1
fc404e18:	02c51863          	bne	a0,a2,fc404e48 <_ZN66_$LT$riscv..register..scause..Trap$u20$as$u20$core..fmt..Debug$GT$3fmt17h7922058b299fa4a2E+0x54>
fc404e1c:	fc408537          	lui	a0,0xfc408
fc404e20:	06450613          	addi	a2,a0,100 # fc408064 <ebss+0xfffe8fc4>
fc404e24:	fe040493          	addi	s1,s0,-32
fc404e28:	00048513          	mv	a0,s1
fc404e2c:	00900693          	li	a3,9
fc404e30:	ffffe097          	auipc	ra,0xffffe
fc404e34:	ccc080e7          	jalr	-820(ra) # fc402afc <_ZN4core3fmt9Formatter11debug_tuple17hc19b76b3cd1ae61aE>
fc404e38:	ff242623          	sw	s2,-20(s0)
fc404e3c:	fc408537          	lui	a0,0xfc408
fc404e40:	07050613          	addi	a2,a0,112 # fc408070 <ebss+0xfffe8fd0>
fc404e44:	02c0006f          	j	fc404e70 <_ZN66_$LT$riscv..register..scause..Trap$u20$as$u20$core..fmt..Debug$GT$3fmt17h7922058b299fa4a2E+0x7c>
fc404e48:	fc408537          	lui	a0,0xfc408
fc404e4c:	08050613          	addi	a2,a0,128 # fc408080 <ebss+0xfffe8fe0>
fc404e50:	fe040493          	addi	s1,s0,-32
fc404e54:	00048513          	mv	a0,s1
fc404e58:	00900693          	li	a3,9
fc404e5c:	ffffe097          	auipc	ra,0xffffe
fc404e60:	ca0080e7          	jalr	-864(ra) # fc402afc <_ZN4core3fmt9Formatter11debug_tuple17hc19b76b3cd1ae61aE>
fc404e64:	ff242623          	sw	s2,-20(s0)
fc404e68:	fc408537          	lui	a0,0xfc408
fc404e6c:	08c50613          	addi	a2,a0,140 # fc40808c <ebss+0xfffe8fec>
fc404e70:	fec40593          	addi	a1,s0,-20
fc404e74:	00048513          	mv	a0,s1
fc404e78:	fffff097          	auipc	ra,0xfffff
fc404e7c:	86c080e7          	jalr	-1940(ra) # fc4036e4 <_ZN4core3fmt8builders10DebugTuple5field17h10d3e599eeb8b1b3E>
fc404e80:	00048513          	mv	a0,s1
fc404e84:	fffff097          	auipc	ra,0xfffff
fc404e88:	a14080e7          	jalr	-1516(ra) # fc403898 <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E>
fc404e8c:	01012903          	lw	s2,16(sp)
fc404e90:	01412483          	lw	s1,20(sp)
fc404e94:	01812403          	lw	s0,24(sp)
fc404e98:	01c12083          	lw	ra,28(sp)
fc404e9c:	02010113          	addi	sp,sp,32
fc404ea0:	00008067          	ret

fc404ea4 <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E>:
fc404ea4:	fe010113          	addi	sp,sp,-32
fc404ea8:	00112e23          	sw	ra,28(sp)
fc404eac:	00812c23          	sw	s0,24(sp)
fc404eb0:	00912a23          	sw	s1,20(sp)
fc404eb4:	02010413          	addi	s0,sp,32
fc404eb8:	00054503          	lbu	a0,0(a0)
fc404ebc:	00200613          	li	a2,2
fc404ec0:	02a65663          	bge	a2,a0,fc404eec <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0x48>
fc404ec4:	00400613          	li	a2,4
fc404ec8:	04a64463          	blt	a2,a0,fc404f10 <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0x6c>
fc404ecc:	00300613          	li	a2,3
fc404ed0:	06c51063          	bne	a0,a2,fc404f30 <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0x8c>
fc404ed4:	fc408537          	lui	a0,0xfc408
fc404ed8:	0c150613          	addi	a2,a0,193 # fc4080c1 <ebss+0xfffe9021>
fc404edc:	fe840493          	addi	s1,s0,-24
fc404ee0:	00048513          	mv	a0,s1
fc404ee4:	00f00693          	li	a3,15
fc404ee8:	0a40006f          	j	fc404f8c <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xe8>
fc404eec:	04050e63          	beqz	a0,fc404f48 <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xa4>
fc404ef0:	00100613          	li	a2,1
fc404ef4:	06c51663          	bne	a0,a2,fc404f60 <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xbc>
fc404ef8:	fc408537          	lui	a0,0xfc408
fc404efc:	0d950613          	addi	a2,a0,217 # fc4080d9 <ebss+0xfffe9039>
fc404f00:	fe840493          	addi	s1,s0,-24
fc404f04:	00048513          	mv	a0,s1
fc404f08:	00e00693          	li	a3,14
fc404f0c:	0800006f          	j	fc404f8c <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xe8>
fc404f10:	00500613          	li	a2,5
fc404f14:	06c51263          	bne	a0,a2,fc404f78 <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xd4>
fc404f18:	fc408537          	lui	a0,0xfc408
fc404f1c:	0a350613          	addi	a2,a0,163 # fc4080a3 <ebss+0xfffe9003>
fc404f20:	fe840493          	addi	s1,s0,-24
fc404f24:	00048513          	mv	a0,s1
fc404f28:	01200693          	li	a3,18
fc404f2c:	0600006f          	j	fc404f8c <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xe8>
fc404f30:	fc408537          	lui	a0,0xfc408
fc404f34:	0b550613          	addi	a2,a0,181 # fc4080b5 <ebss+0xfffe9015>
fc404f38:	fe840493          	addi	s1,s0,-24
fc404f3c:	00048513          	mv	a0,s1
fc404f40:	00c00693          	li	a3,12
fc404f44:	0480006f          	j	fc404f8c <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xe8>
fc404f48:	fc406537          	lui	a0,0xfc406
fc404f4c:	52450613          	addi	a2,a0,1316 # fc406524 <ebss+0xfffe7484>
fc404f50:	fe840493          	addi	s1,s0,-24
fc404f54:	00048513          	mv	a0,s1
fc404f58:	00800693          	li	a3,8
fc404f5c:	0300006f          	j	fc404f8c <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xe8>
fc404f60:	fc408537          	lui	a0,0xfc408
fc404f64:	0d050613          	addi	a2,a0,208 # fc4080d0 <ebss+0xfffe9030>
fc404f68:	fe840493          	addi	s1,s0,-24
fc404f6c:	00048513          	mv	a0,s1
fc404f70:	00900693          	li	a3,9
fc404f74:	0180006f          	j	fc404f8c <_ZN71_$LT$riscv..register..scause..Interrupt$u20$as$u20$core..fmt..Debug$GT$3fmt17hc8c5feb54f3968f9E+0xe8>
fc404f78:	fc408537          	lui	a0,0xfc408
fc404f7c:	09c50613          	addi	a2,a0,156 # fc40809c <ebss+0xfffe8ffc>
fc404f80:	fe840493          	addi	s1,s0,-24
fc404f84:	00048513          	mv	a0,s1
fc404f88:	00700693          	li	a3,7
fc404f8c:	ffffe097          	auipc	ra,0xffffe
fc404f90:	b70080e7          	jalr	-1168(ra) # fc402afc <_ZN4core3fmt9Formatter11debug_tuple17hc19b76b3cd1ae61aE>
fc404f94:	00048513          	mv	a0,s1
fc404f98:	fffff097          	auipc	ra,0xfffff
fc404f9c:	900080e7          	jalr	-1792(ra) # fc403898 <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E>
fc404fa0:	01412483          	lw	s1,20(sp)
fc404fa4:	01812403          	lw	s0,24(sp)
fc404fa8:	01c12083          	lw	ra,28(sp)
fc404fac:	02010113          	addi	sp,sp,32
fc404fb0:	00008067          	ret

fc404fb4 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE>:
fc404fb4:	fe010113          	addi	sp,sp,-32
fc404fb8:	00112e23          	sw	ra,28(sp)
fc404fbc:	00812c23          	sw	s0,24(sp)
fc404fc0:	00912a23          	sw	s1,20(sp)
fc404fc4:	02010413          	addi	s0,sp,32
fc404fc8:	00054503          	lbu	a0,0(a0)
fc404fcc:	00500613          	li	a2,5
fc404fd0:	02a64863          	blt	a2,a0,fc405000 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x4c>
fc404fd4:	00200613          	li	a2,2
fc404fd8:	04a64c63          	blt	a2,a0,fc405030 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x7c>
fc404fdc:	0a050263          	beqz	a0,fc405080 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0xcc>
fc404fe0:	00100613          	li	a2,1
fc404fe4:	0ac51a63          	bne	a0,a2,fc405098 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0xe4>
fc404fe8:	fc406537          	lui	a0,0xfc406
fc404fec:	64450613          	addi	a2,a0,1604 # fc406644 <ebss+0xfffe75a4>
fc404ff0:	fe840493          	addi	s1,s0,-24
fc404ff4:	00048513          	mv	a0,s1
fc404ff8:	01000693          	li	a3,16
fc404ffc:	1340006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc405000:	00800613          	li	a2,8
fc405004:	04a64a63          	blt	a2,a0,fc405058 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0xa4>
fc405008:	00600613          	li	a2,6
fc40500c:	0ac50263          	beq	a0,a2,fc4050b0 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0xfc>
fc405010:	00700613          	li	a2,7
fc405014:	0ac51463          	bne	a0,a2,fc4050bc <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x108>
fc405018:	fc408537          	lui	a0,0xfc408
fc40501c:	11650613          	addi	a2,a0,278 # fc408116 <ebss+0xfffe9076>
fc405020:	fe840493          	addi	s1,s0,-24
fc405024:	00048513          	mv	a0,s1
fc405028:	00b00693          	li	a3,11
fc40502c:	1040006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc405030:	00300613          	li	a2,3
fc405034:	0ac50063          	beq	a0,a2,fc4050d4 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x120>
fc405038:	00400613          	li	a2,4
fc40503c:	0ac51863          	bne	a0,a2,fc4050ec <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x138>
fc405040:	fc408537          	lui	a0,0xfc408
fc405044:	13a50613          	addi	a2,a0,314 # fc40813a <ebss+0xfffe909a>
fc405048:	fe840493          	addi	s1,s0,-24
fc40504c:	00048513          	mv	a0,s1
fc405050:	00900693          	li	a3,9
fc405054:	0dc0006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc405058:	00900613          	li	a2,9
fc40505c:	0ac50463          	beq	a0,a2,fc405104 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x150>
fc405060:	00a00613          	li	a2,10
fc405064:	0ac51c63          	bne	a0,a2,fc40511c <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x168>
fc405068:	fc408537          	lui	a0,0xfc408
fc40506c:	0e750613          	addi	a2,a0,231 # fc4080e7 <ebss+0xfffe9047>
fc405070:	fe840493          	addi	s1,s0,-24
fc405074:	00048513          	mv	a0,s1
fc405078:	00e00693          	li	a3,14
fc40507c:	0b40006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc405080:	fc408537          	lui	a0,0xfc408
fc405084:	15f50613          	addi	a2,a0,351 # fc40815f <ebss+0xfffe90bf>
fc405088:	fe840493          	addi	s1,s0,-24
fc40508c:	00048513          	mv	a0,s1
fc405090:	01500693          	li	a3,21
fc405094:	09c0006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc405098:	fc408537          	lui	a0,0xfc408
fc40509c:	14d50613          	addi	a2,a0,333 # fc40814d <ebss+0xfffe90ad>
fc4050a0:	fe840493          	addi	s1,s0,-24
fc4050a4:	00048513          	mv	a0,s1
fc4050a8:	01200693          	li	a3,18
fc4050ac:	0840006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc4050b0:	fc408537          	lui	a0,0xfc408
fc4050b4:	12150613          	addi	a2,a0,289 # fc408121 <ebss+0xfffe9081>
fc4050b8:	0240006f          	j	fc4050dc <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x128>
fc4050bc:	fc408537          	lui	a0,0xfc408
fc4050c0:	10250613          	addi	a2,a0,258 # fc408102 <ebss+0xfffe9062>
fc4050c4:	fe840493          	addi	s1,s0,-24
fc4050c8:	00048513          	mv	a0,s1
fc4050cc:	01400693          	li	a3,20
fc4050d0:	0600006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc4050d4:	fc408537          	lui	a0,0xfc408
fc4050d8:	14350613          	addi	a2,a0,323 # fc408143 <ebss+0xfffe90a3>
fc4050dc:	fe840493          	addi	s1,s0,-24
fc4050e0:	00048513          	mv	a0,s1
fc4050e4:	00a00693          	li	a3,10
fc4050e8:	0480006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc4050ec:	fc408537          	lui	a0,0xfc408
fc4050f0:	12b50613          	addi	a2,a0,299 # fc40812b <ebss+0xfffe908b>
fc4050f4:	fe840493          	addi	s1,s0,-24
fc4050f8:	00048513          	mv	a0,s1
fc4050fc:	00f00693          	li	a3,15
fc405100:	0300006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc405104:	fc408537          	lui	a0,0xfc408
fc405108:	0f550613          	addi	a2,a0,245 # fc4080f5 <ebss+0xfffe9055>
fc40510c:	fe840493          	addi	s1,s0,-24
fc405110:	00048513          	mv	a0,s1
fc405114:	00d00693          	li	a3,13
fc405118:	0180006f          	j	fc405130 <_ZN71_$LT$riscv..register..scause..Exception$u20$as$u20$core..fmt..Debug$GT$3fmt17h7d42dcd7b0b31deeE+0x17c>
fc40511c:	fc408537          	lui	a0,0xfc408
fc405120:	09c50613          	addi	a2,a0,156 # fc40809c <ebss+0xfffe8ffc>
fc405124:	fe840493          	addi	s1,s0,-24
fc405128:	00048513          	mv	a0,s1
fc40512c:	00700693          	li	a3,7
fc405130:	ffffe097          	auipc	ra,0xffffe
fc405134:	9cc080e7          	jalr	-1588(ra) # fc402afc <_ZN4core3fmt9Formatter11debug_tuple17hc19b76b3cd1ae61aE>
fc405138:	00048513          	mv	a0,s1
fc40513c:	ffffe097          	auipc	ra,0xffffe
fc405140:	75c080e7          	jalr	1884(ra) # fc403898 <_ZN4core3fmt8builders10DebugTuple6finish17ha42ab18248bc7b22E>
fc405144:	01412483          	lw	s1,20(sp)
fc405148:	01812403          	lw	s0,24(sp)
fc40514c:	01c12083          	lw	ra,28(sp)
fc405150:	02010113          	addi	sp,sp,32
fc405154:	00008067          	ret

fc405158 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7abffe87dc4e79e1E>:
fc405158:	ff010113          	addi	sp,sp,-16
fc40515c:	00112623          	sw	ra,12(sp)
fc405160:	00812423          	sw	s0,8(sp)
fc405164:	00912223          	sw	s1,4(sp)
fc405168:	01212023          	sw	s2,0(sp)
fc40516c:	01010413          	addi	s0,sp,16
fc405170:	00058493          	mv	s1,a1
fc405174:	00052903          	lw	s2,0(a0)
fc405178:	00058513          	mv	a0,a1
fc40517c:	ffffe097          	auipc	ra,0xffffe
fc405180:	8cc080e7          	jalr	-1844(ra) # fc402a48 <_ZN4core3fmt9Formatter15debug_lower_hex17h81d0e42eb02b2754E>
fc405184:	00050c63          	beqz	a0,fc40519c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7abffe87dc4e79e1E+0x44>
fc405188:	00090513          	mv	a0,s2
fc40518c:	00048593          	mv	a1,s1
fc405190:	ffffc097          	auipc	ra,0xffffc
fc405194:	994080e7          	jalr	-1644(ra) # fc400b24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E>
fc405198:	0380006f          	j	fc4051d0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7abffe87dc4e79e1E+0x78>
fc40519c:	00048513          	mv	a0,s1
fc4051a0:	ffffe097          	auipc	ra,0xffffe
fc4051a4:	8d4080e7          	jalr	-1836(ra) # fc402a74 <_ZN4core3fmt9Formatter15debug_upper_hex17h0a4339c6e2a93655E>
fc4051a8:	00050c63          	beqz	a0,fc4051c0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7abffe87dc4e79e1E+0x68>
fc4051ac:	00090513          	mv	a0,s2
fc4051b0:	00048593          	mv	a1,s1
fc4051b4:	ffffc097          	auipc	ra,0xffffc
fc4051b8:	a1c080e7          	jalr	-1508(ra) # fc400bd0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E>
fc4051bc:	0140006f          	j	fc4051d0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7abffe87dc4e79e1E+0x78>
fc4051c0:	00090513          	mv	a0,s2
fc4051c4:	00048593          	mv	a1,s1
fc4051c8:	ffffd097          	auipc	ra,0xffffd
fc4051cc:	bb4080e7          	jalr	-1100(ra) # fc401d7c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17ha3ee10d3be386233E>
fc4051d0:	00012903          	lw	s2,0(sp)
fc4051d4:	00412483          	lw	s1,4(sp)
fc4051d8:	00812403          	lw	s0,8(sp)
fc4051dc:	00c12083          	lw	ra,12(sp)
fc4051e0:	01010113          	addi	sp,sp,16
fc4051e4:	00008067          	ret

fc4051e8 <_ZN4core3ptr18real_drop_in_place17h5f69b54ee0eb1451E>:
fc4051e8:	ff010113          	addi	sp,sp,-16
fc4051ec:	00112623          	sw	ra,12(sp)
fc4051f0:	00812423          	sw	s0,8(sp)
fc4051f4:	01010413          	addi	s0,sp,16
fc4051f8:	00812403          	lw	s0,8(sp)
fc4051fc:	00c12083          	lw	ra,12(sp)
fc405200:	01010113          	addi	sp,sp,16
fc405204:	00008067          	ret

fc405208 <_ZN70_$LT$riscv..register..sstatus..Sstatus$u20$as$u20$core..fmt..Debug$GT$3fmt17ha81aa24b05c4134dE>:
fc405208:	fe010113          	addi	sp,sp,-32
fc40520c:	00112e23          	sw	ra,28(sp)
fc405210:	00812c23          	sw	s0,24(sp)
fc405214:	00912a23          	sw	s1,20(sp)
fc405218:	01212823          	sw	s2,16(sp)
fc40521c:	02010413          	addi	s0,sp,32
fc405220:	00050493          	mv	s1,a0
fc405224:	fc408537          	lui	a0,0xfc408
fc405228:	18450613          	addi	a2,a0,388 # fc408184 <ebss+0xfffe90e4>
fc40522c:	fe040913          	addi	s2,s0,-32
fc405230:	00090513          	mv	a0,s2
fc405234:	00700693          	li	a3,7
fc405238:	ffffe097          	auipc	ra,0xffffe
fc40523c:	868080e7          	jalr	-1944(ra) # fc402aa0 <_ZN4core3fmt9Formatter12debug_struct17h94e731b2ac64d90aE>
fc405240:	fe942623          	sw	s1,-20(s0)
fc405244:	fc406537          	lui	a0,0xfc406
fc405248:	61050593          	addi	a1,a0,1552 # fc406610 <ebss+0xfffe7570>
fc40524c:	fc408537          	lui	a0,0xfc408
fc405250:	17450713          	addi	a4,a0,372 # fc408174 <ebss+0xfffe90d4>
fc405254:	fec40693          	addi	a3,s0,-20
fc405258:	00090513          	mv	a0,s2
fc40525c:	00400613          	li	a2,4
fc405260:	ffffe097          	auipc	ra,0xffffe
fc405264:	1a0080e7          	jalr	416(ra) # fc403400 <_ZN4core3fmt8builders11DebugStruct5field17hc994855a3853bb10E>
fc405268:	00090513          	mv	a0,s2
fc40526c:	ffffe097          	auipc	ra,0xffffe
fc405270:	3ec080e7          	jalr	1004(ra) # fc403658 <_ZN4core3fmt8builders11DebugStruct6finish17h05315bdff95aff1aE>
fc405274:	01012903          	lw	s2,16(sp)
fc405278:	01412483          	lw	s1,20(sp)
fc40527c:	01812403          	lw	s0,24(sp)
fc405280:	01c12083          	lw	ra,28(sp)
fc405284:	02010113          	addi	sp,sp,32
fc405288:	00008067          	ret

fc40528c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3677c7d9d22fb7bcE>:
fc40528c:	ff010113          	addi	sp,sp,-16
fc405290:	00112623          	sw	ra,12(sp)
fc405294:	00812423          	sw	s0,8(sp)
fc405298:	00912223          	sw	s1,4(sp)
fc40529c:	01212023          	sw	s2,0(sp)
fc4052a0:	01010413          	addi	s0,sp,16
fc4052a4:	00058493          	mv	s1,a1
fc4052a8:	00052903          	lw	s2,0(a0)
fc4052ac:	00058513          	mv	a0,a1
fc4052b0:	ffffd097          	auipc	ra,0xffffd
fc4052b4:	798080e7          	jalr	1944(ra) # fc402a48 <_ZN4core3fmt9Formatter15debug_lower_hex17h81d0e42eb02b2754E>
fc4052b8:	00050c63          	beqz	a0,fc4052d0 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3677c7d9d22fb7bcE+0x44>
fc4052bc:	00090513          	mv	a0,s2
fc4052c0:	00048593          	mv	a1,s1
fc4052c4:	ffffc097          	auipc	ra,0xffffc
fc4052c8:	860080e7          	jalr	-1952(ra) # fc400b24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E>
fc4052cc:	0380006f          	j	fc405304 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3677c7d9d22fb7bcE+0x78>
fc4052d0:	00048513          	mv	a0,s1
fc4052d4:	ffffd097          	auipc	ra,0xffffd
fc4052d8:	7a0080e7          	jalr	1952(ra) # fc402a74 <_ZN4core3fmt9Formatter15debug_upper_hex17h0a4339c6e2a93655E>
fc4052dc:	00050c63          	beqz	a0,fc4052f4 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3677c7d9d22fb7bcE+0x68>
fc4052e0:	00090513          	mv	a0,s2
fc4052e4:	00048593          	mv	a1,s1
fc4052e8:	ffffc097          	auipc	ra,0xffffc
fc4052ec:	8e8080e7          	jalr	-1816(ra) # fc400bd0 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17h27c5bcf027f5d320E>
fc4052f0:	0140006f          	j	fc405304 <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3677c7d9d22fb7bcE+0x78>
fc4052f4:	00090513          	mv	a0,s2
fc4052f8:	00048593          	mv	a1,s1
fc4052fc:	ffffd097          	auipc	ra,0xffffd
fc405300:	a80080e7          	jalr	-1408(ra) # fc401d7c <_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17ha3ee10d3be386233E>
fc405304:	00012903          	lw	s2,0(sp)
fc405308:	00412483          	lw	s1,4(sp)
fc40530c:	00812403          	lw	s0,8(sp)
fc405310:	00c12083          	lw	ra,12(sp)
fc405314:	01010113          	addi	sp,sp,16
fc405318:	00008067          	ret

fc40531c <_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h3c01f5ca3e12c5a9E>:
fc40531c:	ff010113          	addi	sp,sp,-16
fc405320:	00112623          	sw	ra,12(sp)
fc405324:	00812423          	sw	s0,8(sp)
fc405328:	01010413          	addi	s0,sp,16
fc40532c:	00052503          	lw	a0,0(a0)
fc405330:	00812403          	lw	s0,8(sp)
fc405334:	00c12083          	lw	ra,12(sp)
fc405338:	01010113          	addi	sp,sp,16
fc40533c:	00000317          	auipc	t1,0x0
fc405340:	0c430067          	jr	196(t1) # fc405400 <_ZN4core5array69_$LT$impl$u20$core..fmt..Debug$u20$for$u20$$u5b$T$u3b$$u20$_$u5d$$GT$3fmt17h6f49db6285c08155E>

fc405344 <_ZN52_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5b5731084045a15aE>:
fc405344:	fe010113          	addi	sp,sp,-32
fc405348:	00112e23          	sw	ra,28(sp)
fc40534c:	00812c23          	sw	s0,24(sp)
fc405350:	00912a23          	sw	s1,20(sp)
fc405354:	01212823          	sw	s2,16(sp)
fc405358:	01312623          	sw	s3,12(sp)
fc40535c:	01412423          	sw	s4,8(sp)
fc405360:	01512223          	sw	s5,4(sp)
fc405364:	02010413          	addi	s0,sp,32
fc405368:	00058493          	mv	s1,a1
fc40536c:	00050913          	mv	s2,a0
fc405370:	0005a983          	lw	s3,0(a1)
fc405374:	00c5aa83          	lw	s5,12(a1)
fc405378:	0085aa03          	lw	s4,8(a1)
fc40537c:	00058513          	mv	a0,a1
fc405380:	ffffd097          	auipc	ra,0xffffd
fc405384:	69c080e7          	jalr	1692(ra) # fc402a1c <_ZN4core3fmt9Formatter9alternate17h0035ebcf3bc23da9E>
fc405388:	0004a583          	lw	a1,0(s1)
fc40538c:	02050263          	beqz	a0,fc4053b0 <_ZN52_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5b5731084045a15aE+0x6c>
fc405390:	0085e593          	ori	a1,a1,8
fc405394:	00b4a023          	sw	a1,0(s1)
fc405398:	0084a603          	lw	a2,8(s1)
fc40539c:	00100513          	li	a0,1
fc4053a0:	00a60863          	beq	a2,a0,fc4053b0 <_ZN52_$LT$$BP$const$u20$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h5b5731084045a15aE+0x6c>
fc4053a4:	00a4a423          	sw	a0,8(s1)
fc4053a8:	00a00513          	li	a0,10
fc4053ac:	00a4a623          	sw	a0,12(s1)
fc4053b0:	0045e513          	ori	a0,a1,4
fc4053b4:	00a4a023          	sw	a0,0(s1)
fc4053b8:	00092503          	lw	a0,0(s2)
fc4053bc:	fea42023          	sw	a0,-32(s0)
fc4053c0:	fe040513          	addi	a0,s0,-32
fc4053c4:	00048593          	mv	a1,s1
fc4053c8:	ffffb097          	auipc	ra,0xffffb
fc4053cc:	75c080e7          	jalr	1884(ra) # fc400b24 <_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17he4f6ab4bc3680c19E>
fc4053d0:	0154a623          	sw	s5,12(s1)
fc4053d4:	0144a423          	sw	s4,8(s1)
fc4053d8:	0134a023          	sw	s3,0(s1)
fc4053dc:	00412a83          	lw	s5,4(sp)
fc4053e0:	00812a03          	lw	s4,8(sp)
fc4053e4:	00c12983          	lw	s3,12(sp)
fc4053e8:	01012903          	lw	s2,16(sp)
fc4053ec:	01412483          	lw	s1,20(sp)
fc4053f0:	01812403          	lw	s0,24(sp)
fc4053f4:	01c12083          	lw	ra,28(sp)
fc4053f8:	02010113          	addi	sp,sp,32
fc4053fc:	00008067          	ret

fc405400 <_ZN4core5array69_$LT$impl$u20$core..fmt..Debug$u20$for$u20$$u5b$T$u3b$$u20$_$u5d$$GT$3fmt17h6f49db6285c08155E>:
fc405400:	fd010113          	addi	sp,sp,-48
fc405404:	02112623          	sw	ra,44(sp)
fc405408:	02812423          	sw	s0,40(sp)
fc40540c:	02912223          	sw	s1,36(sp)
fc405410:	03212023          	sw	s2,32(sp)
fc405414:	01312e23          	sw	s3,28(sp)
fc405418:	01412c23          	sw	s4,24(sp)
fc40541c:	03010413          	addi	s0,sp,48
fc405420:	00050993          	mv	s3,a0
fc405424:	fd840913          	addi	s2,s0,-40
fc405428:	00090513          	mv	a0,s2
fc40542c:	ffffd097          	auipc	ra,0xffffd
fc405430:	740080e7          	jalr	1856(ra) # fc402b6c <_ZN4core3fmt9Formatter10debug_list17hc82fe61f61403e49E>
fc405434:	ff342223          	sw	s3,-28(s0)
fc405438:	fc408537          	lui	a0,0xfc408
fc40543c:	18c50493          	addi	s1,a0,396 # fc40818c <ebss+0xfffe90ec>
fc405440:	fe440a13          	addi	s4,s0,-28
fc405444:	00090513          	mv	a0,s2
fc405448:	000a0593          	mv	a1,s4
fc40544c:	00048613          	mv	a2,s1
fc405450:	ffffe097          	auipc	ra,0xffffe
fc405454:	6b0080e7          	jalr	1712(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405458:	00498513          	addi	a0,s3,4
fc40545c:	fea42223          	sw	a0,-28(s0)
fc405460:	00090513          	mv	a0,s2
fc405464:	000a0593          	mv	a1,s4
fc405468:	00048613          	mv	a2,s1
fc40546c:	ffffe097          	auipc	ra,0xffffe
fc405470:	694080e7          	jalr	1684(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405474:	00898513          	addi	a0,s3,8
fc405478:	fea42223          	sw	a0,-28(s0)
fc40547c:	00090513          	mv	a0,s2
fc405480:	000a0593          	mv	a1,s4
fc405484:	00048613          	mv	a2,s1
fc405488:	ffffe097          	auipc	ra,0xffffe
fc40548c:	678080e7          	jalr	1656(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405490:	00c98513          	addi	a0,s3,12
fc405494:	fea42223          	sw	a0,-28(s0)
fc405498:	00090513          	mv	a0,s2
fc40549c:	000a0593          	mv	a1,s4
fc4054a0:	00048613          	mv	a2,s1
fc4054a4:	ffffe097          	auipc	ra,0xffffe
fc4054a8:	65c080e7          	jalr	1628(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4054ac:	01098513          	addi	a0,s3,16
fc4054b0:	fea42223          	sw	a0,-28(s0)
fc4054b4:	00090513          	mv	a0,s2
fc4054b8:	000a0593          	mv	a1,s4
fc4054bc:	00048613          	mv	a2,s1
fc4054c0:	ffffe097          	auipc	ra,0xffffe
fc4054c4:	640080e7          	jalr	1600(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4054c8:	01498513          	addi	a0,s3,20
fc4054cc:	fea42223          	sw	a0,-28(s0)
fc4054d0:	00090513          	mv	a0,s2
fc4054d4:	000a0593          	mv	a1,s4
fc4054d8:	00048613          	mv	a2,s1
fc4054dc:	ffffe097          	auipc	ra,0xffffe
fc4054e0:	624080e7          	jalr	1572(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4054e4:	01898513          	addi	a0,s3,24
fc4054e8:	fea42223          	sw	a0,-28(s0)
fc4054ec:	00090513          	mv	a0,s2
fc4054f0:	000a0593          	mv	a1,s4
fc4054f4:	00048613          	mv	a2,s1
fc4054f8:	ffffe097          	auipc	ra,0xffffe
fc4054fc:	608080e7          	jalr	1544(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405500:	01c98513          	addi	a0,s3,28
fc405504:	fea42223          	sw	a0,-28(s0)
fc405508:	00090513          	mv	a0,s2
fc40550c:	000a0593          	mv	a1,s4
fc405510:	00048613          	mv	a2,s1
fc405514:	ffffe097          	auipc	ra,0xffffe
fc405518:	5ec080e7          	jalr	1516(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc40551c:	02098513          	addi	a0,s3,32
fc405520:	fea42223          	sw	a0,-28(s0)
fc405524:	00090513          	mv	a0,s2
fc405528:	000a0593          	mv	a1,s4
fc40552c:	00048613          	mv	a2,s1
fc405530:	ffffe097          	auipc	ra,0xffffe
fc405534:	5d0080e7          	jalr	1488(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405538:	02498513          	addi	a0,s3,36
fc40553c:	fea42223          	sw	a0,-28(s0)
fc405540:	00090513          	mv	a0,s2
fc405544:	000a0593          	mv	a1,s4
fc405548:	00048613          	mv	a2,s1
fc40554c:	ffffe097          	auipc	ra,0xffffe
fc405550:	5b4080e7          	jalr	1460(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405554:	02898513          	addi	a0,s3,40
fc405558:	fea42223          	sw	a0,-28(s0)
fc40555c:	00090513          	mv	a0,s2
fc405560:	000a0593          	mv	a1,s4
fc405564:	00048613          	mv	a2,s1
fc405568:	ffffe097          	auipc	ra,0xffffe
fc40556c:	598080e7          	jalr	1432(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405570:	02c98513          	addi	a0,s3,44
fc405574:	fea42223          	sw	a0,-28(s0)
fc405578:	00090513          	mv	a0,s2
fc40557c:	000a0593          	mv	a1,s4
fc405580:	00048613          	mv	a2,s1
fc405584:	ffffe097          	auipc	ra,0xffffe
fc405588:	57c080e7          	jalr	1404(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc40558c:	03098513          	addi	a0,s3,48
fc405590:	fea42223          	sw	a0,-28(s0)
fc405594:	00090513          	mv	a0,s2
fc405598:	000a0593          	mv	a1,s4
fc40559c:	00048613          	mv	a2,s1
fc4055a0:	ffffe097          	auipc	ra,0xffffe
fc4055a4:	560080e7          	jalr	1376(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4055a8:	03498513          	addi	a0,s3,52
fc4055ac:	fea42223          	sw	a0,-28(s0)
fc4055b0:	00090513          	mv	a0,s2
fc4055b4:	000a0593          	mv	a1,s4
fc4055b8:	00048613          	mv	a2,s1
fc4055bc:	ffffe097          	auipc	ra,0xffffe
fc4055c0:	544080e7          	jalr	1348(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4055c4:	03898513          	addi	a0,s3,56
fc4055c8:	fea42223          	sw	a0,-28(s0)
fc4055cc:	00090513          	mv	a0,s2
fc4055d0:	000a0593          	mv	a1,s4
fc4055d4:	00048613          	mv	a2,s1
fc4055d8:	ffffe097          	auipc	ra,0xffffe
fc4055dc:	528080e7          	jalr	1320(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4055e0:	03c98513          	addi	a0,s3,60
fc4055e4:	fea42223          	sw	a0,-28(s0)
fc4055e8:	00090513          	mv	a0,s2
fc4055ec:	000a0593          	mv	a1,s4
fc4055f0:	00048613          	mv	a2,s1
fc4055f4:	ffffe097          	auipc	ra,0xffffe
fc4055f8:	50c080e7          	jalr	1292(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4055fc:	04098513          	addi	a0,s3,64
fc405600:	fea42223          	sw	a0,-28(s0)
fc405604:	00090513          	mv	a0,s2
fc405608:	000a0593          	mv	a1,s4
fc40560c:	00048613          	mv	a2,s1
fc405610:	ffffe097          	auipc	ra,0xffffe
fc405614:	4f0080e7          	jalr	1264(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405618:	04498513          	addi	a0,s3,68
fc40561c:	fea42223          	sw	a0,-28(s0)
fc405620:	00090513          	mv	a0,s2
fc405624:	000a0593          	mv	a1,s4
fc405628:	00048613          	mv	a2,s1
fc40562c:	ffffe097          	auipc	ra,0xffffe
fc405630:	4d4080e7          	jalr	1236(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405634:	04898513          	addi	a0,s3,72
fc405638:	fea42223          	sw	a0,-28(s0)
fc40563c:	00090513          	mv	a0,s2
fc405640:	000a0593          	mv	a1,s4
fc405644:	00048613          	mv	a2,s1
fc405648:	ffffe097          	auipc	ra,0xffffe
fc40564c:	4b8080e7          	jalr	1208(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405650:	04c98513          	addi	a0,s3,76
fc405654:	fea42223          	sw	a0,-28(s0)
fc405658:	00090513          	mv	a0,s2
fc40565c:	000a0593          	mv	a1,s4
fc405660:	00048613          	mv	a2,s1
fc405664:	ffffe097          	auipc	ra,0xffffe
fc405668:	49c080e7          	jalr	1180(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc40566c:	05098513          	addi	a0,s3,80
fc405670:	fea42223          	sw	a0,-28(s0)
fc405674:	00090513          	mv	a0,s2
fc405678:	000a0593          	mv	a1,s4
fc40567c:	00048613          	mv	a2,s1
fc405680:	ffffe097          	auipc	ra,0xffffe
fc405684:	480080e7          	jalr	1152(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405688:	05498513          	addi	a0,s3,84
fc40568c:	fea42223          	sw	a0,-28(s0)
fc405690:	00090513          	mv	a0,s2
fc405694:	000a0593          	mv	a1,s4
fc405698:	00048613          	mv	a2,s1
fc40569c:	ffffe097          	auipc	ra,0xffffe
fc4056a0:	464080e7          	jalr	1124(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4056a4:	05898513          	addi	a0,s3,88
fc4056a8:	fea42223          	sw	a0,-28(s0)
fc4056ac:	00090513          	mv	a0,s2
fc4056b0:	000a0593          	mv	a1,s4
fc4056b4:	00048613          	mv	a2,s1
fc4056b8:	ffffe097          	auipc	ra,0xffffe
fc4056bc:	448080e7          	jalr	1096(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4056c0:	05c98513          	addi	a0,s3,92
fc4056c4:	fea42223          	sw	a0,-28(s0)
fc4056c8:	00090513          	mv	a0,s2
fc4056cc:	000a0593          	mv	a1,s4
fc4056d0:	00048613          	mv	a2,s1
fc4056d4:	ffffe097          	auipc	ra,0xffffe
fc4056d8:	42c080e7          	jalr	1068(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4056dc:	06098513          	addi	a0,s3,96
fc4056e0:	fea42223          	sw	a0,-28(s0)
fc4056e4:	00090513          	mv	a0,s2
fc4056e8:	000a0593          	mv	a1,s4
fc4056ec:	00048613          	mv	a2,s1
fc4056f0:	ffffe097          	auipc	ra,0xffffe
fc4056f4:	410080e7          	jalr	1040(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4056f8:	06498513          	addi	a0,s3,100
fc4056fc:	fea42223          	sw	a0,-28(s0)
fc405700:	00090513          	mv	a0,s2
fc405704:	000a0593          	mv	a1,s4
fc405708:	00048613          	mv	a2,s1
fc40570c:	ffffe097          	auipc	ra,0xffffe
fc405710:	3f4080e7          	jalr	1012(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405714:	06898513          	addi	a0,s3,104
fc405718:	fea42223          	sw	a0,-28(s0)
fc40571c:	00090513          	mv	a0,s2
fc405720:	000a0593          	mv	a1,s4
fc405724:	00048613          	mv	a2,s1
fc405728:	ffffe097          	auipc	ra,0xffffe
fc40572c:	3d8080e7          	jalr	984(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405730:	06c98513          	addi	a0,s3,108
fc405734:	fea42223          	sw	a0,-28(s0)
fc405738:	00090513          	mv	a0,s2
fc40573c:	000a0593          	mv	a1,s4
fc405740:	00048613          	mv	a2,s1
fc405744:	ffffe097          	auipc	ra,0xffffe
fc405748:	3bc080e7          	jalr	956(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc40574c:	07098513          	addi	a0,s3,112
fc405750:	fea42223          	sw	a0,-28(s0)
fc405754:	00090513          	mv	a0,s2
fc405758:	000a0593          	mv	a1,s4
fc40575c:	00048613          	mv	a2,s1
fc405760:	ffffe097          	auipc	ra,0xffffe
fc405764:	3a0080e7          	jalr	928(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405768:	07498513          	addi	a0,s3,116
fc40576c:	fea42223          	sw	a0,-28(s0)
fc405770:	00090513          	mv	a0,s2
fc405774:	000a0593          	mv	a1,s4
fc405778:	00048613          	mv	a2,s1
fc40577c:	ffffe097          	auipc	ra,0xffffe
fc405780:	384080e7          	jalr	900(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc405784:	07898513          	addi	a0,s3,120
fc405788:	fea42223          	sw	a0,-28(s0)
fc40578c:	00090513          	mv	a0,s2
fc405790:	000a0593          	mv	a1,s4
fc405794:	00048613          	mv	a2,s1
fc405798:	ffffe097          	auipc	ra,0xffffe
fc40579c:	368080e7          	jalr	872(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4057a0:	07c98513          	addi	a0,s3,124
fc4057a4:	fea42223          	sw	a0,-28(s0)
fc4057a8:	00090513          	mv	a0,s2
fc4057ac:	000a0593          	mv	a1,s4
fc4057b0:	00048613          	mv	a2,s1
fc4057b4:	ffffe097          	auipc	ra,0xffffe
fc4057b8:	34c080e7          	jalr	844(ra) # fc403b00 <_ZN4core3fmt8builders8DebugSet5entry17ha3f44681b481bb81E>
fc4057bc:	00090513          	mv	a0,s2
fc4057c0:	ffffe097          	auipc	ra,0xffffe
fc4057c4:	378080e7          	jalr	888(ra) # fc403b38 <_ZN4core3fmt8builders9DebugList6finish17h9c4a8b3e027a94e4E>
fc4057c8:	01812a03          	lw	s4,24(sp)
fc4057cc:	01c12983          	lw	s3,28(sp)
fc4057d0:	02012903          	lw	s2,32(sp)
fc4057d4:	02412483          	lw	s1,36(sp)
fc4057d8:	02812403          	lw	s0,40(sp)
fc4057dc:	02c12083          	lw	ra,44(sp)
fc4057e0:	03010113          	addi	sp,sp,48
fc4057e4:	00008067          	ret

fc4057e8 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E>:
fc4057e8:	ff010113          	addi	sp,sp,-16
fc4057ec:	00112623          	sw	ra,12(sp)
fc4057f0:	00812423          	sw	s0,8(sp)
fc4057f4:	01010413          	addi	s0,sp,16
fc4057f8:	00812403          	lw	s0,8(sp)
fc4057fc:	00c12083          	lw	ra,12(sp)
fc405800:	01010113          	addi	sp,sp,16
fc405804:	00008067          	ret
	...

Disassembly of section .rodata:

fc406000 <srodata>:
fc406000:	000a                	c.slli	zero,0x2
	...

fc406004 <anon.d439681ef67a2e9eceefc9ebd0c4df64.2.llvm.2536193249071152694>:
fc406004:	6000                	flw	fs0,0(s0)
fc406006:	fc40                	fsw	fs0,60(s0)
fc406008:	0000                	unimp
fc40600a:	0000                	unimp
fc40600c:	6000                	flw	fs0,0(s0)
fc40600e:	fc40                	fsw	fs0,60(s0)
fc406010:	0001                	nop
	...

fc406014 <.Lanon.d439681ef67a2e9eceefc9ebd0c4df64.3>:
fc406014:	2b2b2b2b          	0x2b2b2b2b
fc406018:	75746573          	csrrsi	a0,0x757,8
fc40601c:	2070                	fld	fa2,192(s0)
fc40601e:	656d                	lui	a0,0x1b
fc406020:	6f6d                	lui	t5,0x1b
fc406022:	7972                	flw	fs2,60(sp)
fc406024:	2b21                	jal	fc40653c <.Lanon.656bae129583d213deca8b002e63a072.46>
fc406026:	002b2b2b          	0x2b2b2b
	...

fc40602c <anon.d439681ef67a2e9eceefc9ebd0c4df64.4.llvm.2536193249071152694>:
fc40602c:	6014                	flw	fa3,0(s0)
fc40602e:	fc40                	fsw	fs0,60(s0)
fc406030:	0015                	c.nop	5
	...

fc406040 <str.0>:
fc406040:	2f637273          	csrrci	tp,0x2f6,6
fc406044:	656d                	lui	a0,0x1b
fc406046:	6f6d                	lui	t5,0x1b
fc406048:	7972                	flw	fs2,60(sp)
fc40604a:	6172662f          	0x6172662f
fc40604e:	656d                	lui	a0,0x1b
fc406050:	615f 6c6c 636f      	0x636f6c6c615f
fc406056:	7461                	lui	s0,0xffff8
fc406058:	722e726f          	jal	tp,fc4ed77a <ebss+0xce6da>
fc40605c:	00000073          	ecall

fc406060 <anon.f985c0b8487cc782760065d65eb04c45.0.llvm.2770330101483056927>:
fc406060:	6040                	flw	fs0,4(s0)
fc406062:	fc40                	fsw	fs0,60(s0)
fc406064:	001d                	c.nop	7
fc406066:	0000                	unimp
fc406068:	001c                	0x1c
fc40606a:	0000                	unimp
fc40606c:	00000027          	0x27

fc406070 <anon.f985c0b8487cc782760065d65eb04c45.1.llvm.2770330101483056927>:
fc406070:	6040                	flw	fs0,4(s0)
fc406072:	fc40                	fsw	fs0,60(s0)
fc406074:	001d                	c.nop	7
fc406076:	0000                	unimp
fc406078:	001d                	c.nop	7
fc40607a:	0000                	unimp
fc40607c:	0020                	addi	s0,sp,8
	...

fc406080 <anon.f985c0b8487cc782760065d65eb04c45.2.llvm.2770330101483056927>:
fc406080:	6040                	flw	fs0,4(s0)
fc406082:	fc40                	fsw	fs0,60(s0)
fc406084:	001d                	c.nop	7
fc406086:	0000                	unimp
fc406088:	001e                	c.slli	zero,0x7
fc40608a:	0000                	unimp
fc40608c:	0032                	c.slli	zero,0xc
	...

fc406090 <anon.f985c0b8487cc782760065d65eb04c45.3.llvm.2770330101483056927>:
fc406090:	6040                	flw	fs0,4(s0)
fc406092:	fc40                	fsw	fs0,60(s0)
fc406094:	001d                	c.nop	7
fc406096:	0000                	unimp
fc406098:	001e                	c.slli	zero,0x7
fc40609a:	0000                	unimp
fc40609c:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne

fc4060a0 <anon.f985c0b8487cc782760065d65eb04c45.4.llvm.2770330101483056927>:
fc4060a0:	6040                	flw	fs0,4(s0)
fc4060a2:	fc40                	fsw	fs0,60(s0)
fc4060a4:	001d                	c.nop	7
fc4060a6:	0000                	unimp
fc4060a8:	001e                	c.slli	zero,0x7
fc4060aa:	0000                	unimp
fc4060ac:	0026                	c.slli	zero,0x9
	...

fc4060b0 <.Lanon.2ca8fd3e7554c195c24c8aa31e496fec.1>:
fc4060b0:	000a                	c.slli	zero,0x2
	...

fc4060b4 <.Lanon.2ca8fd3e7554c195c24c8aa31e496fec.2>:
fc4060b4:	60b0                	flw	fa2,64(s1)
fc4060b6:	fc40                	fsw	fs0,60(s0)
fc4060b8:	0000                	unimp
fc4060ba:	0000                	unimp
fc4060bc:	60b0                	flw	fa2,64(s1)
fc4060be:	fc40                	fsw	fs0,60(s0)
fc4060c0:	0001                	nop
	...

fc4060c4 <.Lanon.2ca8fd3e7554c195c24c8aa31e496fec.3>:
fc4060c4:	60b0                	flw	fa2,64(s1)
fc4060c6:	fc40                	fsw	fs0,60(s0)
fc4060c8:	0000                	unimp
	...

fc4060cc <.Lanon.2ca8fd3e7554c195c24c8aa31e496fec.4>:
fc4060cc:	6261                	lui	tp,0x18
fc4060ce:	2174726f          	jal	tp,fc44dae4 <ebss+0x2ea44>

fc4060d2 <.Lanon.2ca8fd3e7554c195c24c8aa31e496fec.5>:
fc4060d2:	2f637273          	csrrci	tp,0x2f6,6
fc4060d6:	616c                	flw	fa1,68(a0)
fc4060d8:	676e                	flw	fa4,216(sp)
fc4060da:	695f 6574 736d      	0x736d6574695f
fc4060e0:	722e                	flw	ft4,232(sp)
fc4060e2:	          	0x60cc0073

fc4060e4 <.Lanon.2ca8fd3e7554c195c24c8aa31e496fec.6>:
fc4060e4:	60cc                	flw	fa1,4(s1)
fc4060e6:	fc40                	fsw	fs0,60(s0)
fc4060e8:	0006                	c.slli	zero,0x1
fc4060ea:	0000                	unimp
fc4060ec:	60d2                	flw	ft1,20(sp)
fc4060ee:	fc40                	fsw	fs0,60(s0)
fc4060f0:	0011                	c.nop	4
fc4060f2:	0000                	unimp
fc4060f4:	0000000b          	0xb
fc4060f8:	0005                	c.nop	1
	...

fc4060fc <anon.bcfdc13bc072f6ba3325a1a7aae586e2.0.llvm.6670761124188977649>:
fc4060fc:	0528                	addi	a0,sp,648
fc4060fe:	fc40                	fsw	fs0,60(s0)
fc406100:	0004                	0x4
fc406102:	0000                	unimp
fc406104:	0004                	0x4
fc406106:	0000                	unimp
fc406108:	0788                	addi	a0,sp,960
fc40610a:	fc40                	fsw	fs0,60(s0)
fc40610c:	0548                	addi	a0,sp,644
fc40610e:	fc40                	fsw	fs0,60(s0)
fc406110:	0718                	addi	a4,sp,896
fc406112:	fc40                	fsw	fs0,60(s0)

fc406114 <anon.bcfdc13bc072f6ba3325a1a7aae586e2.1.llvm.6670761124188977649>:
fc406114:	6c6c6163          	bltu	s8,t1,fc4067d6 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.15+0x3a>
fc406118:	6465                	lui	s0,0x19
fc40611a:	6020                	flw	fs0,64(s0)
fc40611c:	6552                	flw	fa0,20(sp)
fc40611e:	746c7573          	csrrci	a0,0x746,24
fc406122:	3a3a                	fld	fs4,424(sp)
fc406124:	6e75                	lui	t3,0x1d
fc406126:	70617277          	0x70617277
fc40612a:	2928                	fld	fa0,80(a0)
fc40612c:	2060                	fld	fs0,192(s0)
fc40612e:	61206e6f          	jal	t3,fc40c740 <bootstack+0x2740>
fc406132:	206e                	fld	ft0,216(sp)
fc406134:	4560                	lw	s0,76(a0)
fc406136:	7272                	flw	ft4,60(sp)
fc406138:	2060                	fld	fs0,192(s0)
fc40613a:	6176                	flw	ft2,92(sp)
fc40613c:	756c                	flw	fa1,108(a0)
fc40613e:	0065                	c.nop	25

fc406140 <anon.bcfdc13bc072f6ba3325a1a7aae586e2.2.llvm.6670761124188977649>:
fc406140:	0508                	addi	a0,sp,640
fc406142:	fc40                	fsw	fs0,60(s0)
fc406144:	0000                	unimp
fc406146:	0000                	unimp
fc406148:	0001                	nop
fc40614a:	0000                	unimp
fc40614c:	2f88                	fld	fa0,24(a5)
fc40614e:	fc40                	fsw	fs0,60(s0)

fc406150 <.Lanon.4a7621df25b39051ac565ad5a5d0933b.0>:
fc406150:	7361                	lui	t1,0xffff8
fc406152:	74726573          	csrrsi	a0,0x747,4
fc406156:	6f69                	lui	t5,0x1a
fc406158:	206e                	fld	ft0,216(sp)
fc40615a:	6166                	flw	ft2,88(sp)
fc40615c:	6c69                	lui	s8,0x1a
fc40615e:	6465                	lui	s0,0x19
fc406160:	203a                	fld	ft0,392(sp)
fc406162:	72617473          	csrrci	s0,0x726,2
fc406166:	2074                	fld	fa3,192(s0)
fc406168:	3d3c                	fld	fa5,120(a0)
fc40616a:	6520                	flw	fs0,72(a0)
fc40616c:	646e                	flw	fs0,216(sp)

fc40616e <.Lanon.4a7621df25b39051ac565ad5a5d0933b.1>:
fc40616e:	6d6f682f          	0x6d6f682f
fc406172:	2f65                	jal	fc40692a <anon.fe7732283a7f5a795c6169f6eb5e8c98.33.llvm.7276170047363281110+0xe>
fc406174:	6166                	flw	ft2,88(sp)
fc406176:	7a6e                	flw	fs4,248(sp)
fc406178:	6968                	flw	fa0,84(a0)
fc40617a:	6570                	flw	fa2,76(a0)
fc40617c:	676e                	flw	fa4,216(sp)
fc40617e:	61632e2f          	amoand.w	t3,s6,(t1)
fc406182:	6772                	flw	fa4,28(sp)
fc406184:	65722f6f          	jal	t5,fc428fda <ebss+0x9f3a>
fc406188:	74736967          	0x74736967
fc40618c:	7972                	flw	fs2,60(sp)
fc40618e:	6372732f          	0x6372732f
fc406192:	7469672f          	0x7469672f
fc406196:	7568                	flw	fa0,108(a0)
fc406198:	2e62                	fld	ft8,24(sp)
fc40619a:	2d6d6f63          	bltu	s10,s6,fc406478 <.Lanon.656bae129583d213deca8b002e63a072.18+0x8>
fc40619e:	6531                	lui	a0,0xc
fc4061a0:	32366363          	bltu	a2,gp,fc4064c6 <.Lanon.656bae129583d213deca8b002e63a072.22+0x2a>
fc4061a4:	3939                	jal	fc405dc2 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x5da>
fc4061a6:	6264                	flw	fs1,68(a2)
fc4061a8:	6539                	lui	a0,0xe
fc4061aa:	33323863          	0x33323863
fc4061ae:	6475622f          	0x6475622f
fc4061b2:	7964                	flw	fs1,116(a0)
fc4061b4:	735f 7379 6574      	0x65747379735f
fc4061ba:	5f6d                	li	t5,-5
fc4061bc:	6c61                	lui	s8,0x18
fc4061be:	6f6c                	flw	fa1,92(a4)
fc4061c0:	6f746163          	bltu	s0,s7,fc4068a2 <str.4+0x2>
fc4061c4:	2d72                	fld	fs10,280(sp)
fc4061c6:	2e30                	fld	fa2,88(a2)
fc4061c8:	2f352e33          	0x2f352e33
fc4061cc:	2f637273          	csrrci	tp,0x2f6,6
fc4061d0:	696c                	flw	fa1,84(a0)
fc4061d2:	2e62                	fld	ft8,24(sp)
fc4061d4:	7372                	flw	ft6,60(sp)
	...

fc4061d8 <.Lanon.4a7621df25b39051ac565ad5a5d0933b.2>:
fc4061d8:	6150                	flw	fa2,4(a0)
fc4061da:	fc40                	fsw	fs0,60(s0)
fc4061dc:	001e                	c.slli	zero,0x7
fc4061de:	0000                	unimp
fc4061e0:	616e                	flw	ft2,216(sp)
fc4061e2:	fc40                	fsw	fs0,60(s0)
fc4061e4:	0068                	addi	a0,sp,12
fc4061e6:	0000                	unimp
fc4061e8:	0052                	c.slli	zero,0x14
fc4061ea:	0000                	unimp
fc4061ec:	0009                	c.nop	2
	...

fc4061f0 <str.0>:
fc4061f0:	6d6f682f          	0x6d6f682f
fc4061f4:	2f65                	jal	fc4069ac <anon.fe7732283a7f5a795c6169f6eb5e8c98.39.llvm.7276170047363281110+0x40>
fc4061f6:	6166                	flw	ft2,88(sp)
fc4061f8:	7a6e                	flw	fs4,248(sp)
fc4061fa:	6968                	flw	fa0,84(a0)
fc4061fc:	6570                	flw	fa2,76(a0)
fc4061fe:	676e                	flw	fa4,216(sp)
fc406200:	61632e2f          	amoand.w	t3,s6,(t1)
fc406204:	6772                	flw	fa4,28(sp)
fc406206:	65722f6f          	jal	t5,fc42905c <ebss+0x9fbc>
fc40620a:	74736967          	0x74736967
fc40620e:	7972                	flw	fs2,60(sp)
fc406210:	6372732f          	0x6372732f
fc406214:	7469672f          	0x7469672f
fc406218:	7568                	flw	fa0,108(a0)
fc40621a:	2e62                	fld	ft8,24(sp)
fc40621c:	2d6d6f63          	bltu	s10,s6,fc4064fa <.Lanon.656bae129583d213deca8b002e63a072.22+0x5e>
fc406220:	6531                	lui	a0,0xc
fc406222:	32366363          	bltu	a2,gp,fc406548 <.Lanon.656bae129583d213deca8b002e63a072.46+0xc>
fc406226:	3939                	jal	fc405e44 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x65c>
fc406228:	6264                	flw	fs1,68(a2)
fc40622a:	6539                	lui	a0,0xe
fc40622c:	33323863          	0x33323863
fc406230:	6475622f          	0x6475622f
fc406234:	7964                	flw	fs1,116(a0)
fc406236:	735f 7379 6574      	0x65747379735f
fc40623c:	5f6d                	li	t5,-5
fc40623e:	6c61                	lui	s8,0x18
fc406240:	6f6c                	flw	fa1,92(a4)
fc406242:	6f746163          	bltu	s0,s7,fc406924 <anon.fe7732283a7f5a795c6169f6eb5e8c98.33.llvm.7276170047363281110+0x8>
fc406246:	2d72                	fld	fs10,280(sp)
fc406248:	2e30                	fld	fa2,88(a2)
fc40624a:	2f352e33          	0x2f352e33
fc40624e:	2f637273          	csrrci	tp,0x2f6,6
fc406252:	696c                	flw	fa1,84(a0)
fc406254:	2e62                	fld	ft8,24(sp)
fc406256:	7372                	flw	ft6,60(sp)

fc406258 <.Lanon.4a7621df25b39051ac565ad5a5d0933b.3>:
fc406258:	61f0                	flw	fa2,68(a1)
fc40625a:	fc40                	fsw	fs0,60(s0)
fc40625c:	0068                	addi	a0,sp,12
fc40625e:	0000                	unimp
fc406260:	005c                	addi	a5,sp,4
fc406262:	0000                	unimp
fc406264:	000d                	c.nop	3
	...

fc406268 <anon.98d08f8377b5ea63aa39aff9a750073e.1.llvm.4015378384721186113>:
fc406268:	7830                	flw	fa2,112(s0)

fc40626a <.Lanon.98d08f8377b5ea63aa39aff9a750073e.3>:
fc40626a:	3030                	fld	fa2,96(s0)
fc40626c:	3130                	fld	fa2,96(a0)
fc40626e:	3230                	fld	fa2,96(a2)
fc406270:	3330                	fld	fa2,96(a4)
fc406272:	3430                	fld	fa2,104(s0)
fc406274:	3530                	fld	fa2,104(a0)
fc406276:	3630                	fld	fa2,104(a2)
fc406278:	3730                	fld	fa2,104(a4)
fc40627a:	3830                	fld	fa2,112(s0)
fc40627c:	3930                	fld	fa2,112(a0)
fc40627e:	3031                	jal	fc405a8a <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x2a2>
fc406280:	3131                	jal	fc405e8c <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x6a4>
fc406282:	3231                	jal	fc405b8e <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x3a6>
fc406284:	3331                	jal	fc405f90 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x7a8>
fc406286:	3431                	jal	fc405c92 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x4aa>
fc406288:	3531                	jal	fc406094 <anon.f985c0b8487cc782760065d65eb04c45.3.llvm.2770330101483056927+0x4>
fc40628a:	3631                	jal	fc405d96 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x5ae>
fc40628c:	3731                	jal	fc406198 <.Lanon.4a7621df25b39051ac565ad5a5d0933b.1+0x2a>
fc40628e:	3831                	jal	fc405aaa <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x2c2>
fc406290:	3931                	jal	fc405eac <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x6c4>
fc406292:	3032                	fld	ft0,296(sp)
fc406294:	3132                	fld	ft2,296(sp)
fc406296:	3232                	fld	ft4,296(sp)
fc406298:	3332                	fld	ft6,296(sp)
fc40629a:	3432                	fld	fs0,296(sp)
fc40629c:	3532                	fld	fa0,296(sp)
fc40629e:	3632                	fld	fa2,296(sp)
fc4062a0:	3732                	fld	fa4,296(sp)
fc4062a2:	3832                	fld	fa6,296(sp)
fc4062a4:	3932                	fld	fs2,296(sp)
fc4062a6:	31333033          	0x31333033
fc4062aa:	33333233          	0x33333233
fc4062ae:	35333433          	0x35333433
fc4062b2:	37333633          	0x37333633
fc4062b6:	39333833          	0x39333833
fc4062ba:	3034                	fld	fa3,96(s0)
fc4062bc:	3134                	fld	fa3,96(a0)
fc4062be:	3234                	fld	fa3,96(a2)
fc4062c0:	3334                	fld	fa3,96(a4)
fc4062c2:	3434                	fld	fa3,104(s0)
fc4062c4:	3534                	fld	fa3,104(a0)
fc4062c6:	3634                	fld	fa3,104(a2)
fc4062c8:	3734                	fld	fa3,104(a4)
fc4062ca:	3834                	fld	fa3,112(s0)
fc4062cc:	3934                	fld	fa3,112(a0)
fc4062ce:	3035                	jal	fc405afa <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x312>
fc4062d0:	3135                	jal	fc405efc <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x714>
fc4062d2:	3235                	jal	fc405bfe <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x416>
fc4062d4:	3335                	jal	fc406000 <srodata>
fc4062d6:	3435                	jal	fc405d02 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x51a>
fc4062d8:	3535                	jal	fc406104 <anon.bcfdc13bc072f6ba3325a1a7aae586e2.0.llvm.6670761124188977649+0x8>
fc4062da:	3635                	jal	fc405e06 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x61e>
fc4062dc:	3735                	jal	fc406208 <str.0+0x18>
fc4062de:	3835                	jal	fc405b1a <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x332>
fc4062e0:	3935                	jal	fc405f1c <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x734>
fc4062e2:	3036                	fld	ft0,360(sp)
fc4062e4:	3136                	fld	ft2,360(sp)
fc4062e6:	3236                	fld	ft4,360(sp)
fc4062e8:	3336                	fld	ft6,360(sp)
fc4062ea:	3436                	fld	fs0,360(sp)
fc4062ec:	3536                	fld	fa0,360(sp)
fc4062ee:	3636                	fld	fa2,360(sp)
fc4062f0:	3736                	fld	fa4,360(sp)
fc4062f2:	3836                	fld	fa6,360(sp)
fc4062f4:	3936                	fld	fs2,360(sp)
fc4062f6:	31373037          	lui	zero,0x31373
fc4062fa:	33373237          	lui	tp,0x33373
fc4062fe:	35373437          	lui	s0,0x35373
fc406302:	37373637          	lui	a2,0x37373
fc406306:	39373837          	lui	a6,0x39373
fc40630a:	3038                	fld	fa4,96(s0)
fc40630c:	3138                	fld	fa4,96(a0)
fc40630e:	3238                	fld	fa4,96(a2)
fc406310:	3338                	fld	fa4,96(a4)
fc406312:	3438                	fld	fa4,104(s0)
fc406314:	3538                	fld	fa4,104(a0)
fc406316:	3638                	fld	fa4,104(a2)
fc406318:	3738                	fld	fa4,104(a4)
fc40631a:	3838                	fld	fa4,112(s0)
fc40631c:	3938                	fld	fa4,112(a0)
fc40631e:	3039                	jal	fc405b2c <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x344>
fc406320:	3139                	jal	fc405f2e <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x746>
fc406322:	3239                	jal	fc405c30 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x448>
fc406324:	3339                	jal	fc406032 <anon.d439681ef67a2e9eceefc9ebd0c4df64.4.llvm.2536193249071152694+0x6>
fc406326:	3439                	jal	fc405d34 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x54c>
fc406328:	3539                	jal	fc406136 <anon.bcfdc13bc072f6ba3325a1a7aae586e2.1.llvm.6670761124188977649+0x22>
fc40632a:	3639                	jal	fc405e38 <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x650>
fc40632c:	3739                	jal	fc40623a <str.0+0x4a>
fc40632e:	3839                	jal	fc405b4c <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x364>
fc406330:	3939                	jal	fc405f4e <_ZN4core3ptr18real_drop_in_place17h9a33f558081933e2E+0x766>
	...

fc406334 <_ZN4core3fmt3num14DEC_DIGITS_LUT17ha666747a6bc49feaE>:
fc406334:	626a                	flw	ft4,152(sp)
fc406336:	fc40                	fsw	fs0,60(s0)

fc406338 <.Lanon.e91c7f888894566cb3fc7059480f37ac.0>:
fc406338:	2e2e                	fld	ft8,200(sp)
	...

fc40633c <.Lanon.e91c7f888894566cb3fc7059480f37ac.1>:
fc40633c:	6338                	flw	fa4,64(a4)
fc40633e:	fc40                	fsw	fs0,60(s0)
fc406340:	0002                	c.slli64	zero
	...

fc406344 <.Lanon.e91c7f888894566cb3fc7059480f37ac.2>:
fc406344:	0c7c                	addi	a5,sp,540
fc406346:	fc40                	fsw	fs0,60(s0)
fc406348:	0000                	unimp
fc40634a:	0000                	unimp
fc40634c:	0001                	nop
fc40634e:	0000                	unimp
fc406350:	0f10                	addi	a2,sp,912
fc406352:	fc40                	fsw	fs0,60(s0)

fc406354 <.Lanon.e91c7f888894566cb3fc7059480f37ac.3>:
fc406354:	6170                	flw	fa2,68(a0)
fc406356:	696e                	flw	fs2,216(sp)
fc406358:	64656b63          	bltu	a0,t1,fc4069ae <anon.fe7732283a7f5a795c6169f6eb5e8c98.39.llvm.7276170047363281110+0x42>
fc40635c:	6120                	flw	fs0,64(a0)
fc40635e:	2074                	fld	fa3,192(s0)

fc406360 <.Lanon.e91c7f888894566cb3fc7059480f37ac.4>:
fc406360:	          	fsw	ft2,526(s8) # 1820e <XLENB+0x1820a>

fc406361 <.Lanon.e91c7f888894566cb3fc7059480f37ac.5>:
fc406361:	          	fsw	ft2,1560(zero) # 618 <XLENB+0x614>

fc406364 <.Lanon.e91c7f888894566cb3fc7059480f37ac.6>:
fc406364:	6360                	flw	fs0,68(a4)
fc406366:	fc40                	fsw	fs0,60(s0)
fc406368:	0001                	nop
fc40636a:	0000                	unimp
fc40636c:	6361                	lui	t1,0x18
fc40636e:	fc40                	fsw	fs0,60(s0)
fc406370:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>

fc406374 <.Lanon.e91c7f888894566cb3fc7059480f37ac.8>:
fc406374:	003a                	c.slli	zero,0xe
	...

fc406378 <.Lanon.e91c7f888894566cb3fc7059480f37ac.9>:
fc406378:	6374                	flw	fa3,68(a4)
fc40637a:	fc40                	fsw	fs0,60(s0)
fc40637c:	0000                	unimp
fc40637e:	0000                	unimp
fc406380:	6374                	flw	fa3,68(a4)
fc406382:	fc40                	fsw	fs0,60(s0)
fc406384:	0001                	nop
fc406386:	0000                	unimp
fc406388:	6374                	flw	fa3,68(a4)
fc40638a:	fc40                	fsw	fs0,60(s0)
fc40638c:	0001                	nop
fc40638e:	0000                	unimp
fc406390:	6e69                	lui	t3,0x1a
fc406392:	6564                	flw	fs1,76(a0)
fc406394:	2078                	fld	fa4,192(s0)
fc406396:	2074756f          	jal	a0,fc44dd9c <ebss+0x2ecfc>
fc40639a:	6220666f          	jal	a2,fc40c9bc <bootstack+0x29bc>
fc40639e:	646e756f          	jal	a0,fc4ed9e4 <ebss+0xce944>
fc4063a2:	74203a73          	csrrc	s4,0x742,zero
fc4063a6:	6568                	flw	fa0,76(a0)
fc4063a8:	6c20                	flw	fs0,88(s0)
fc4063aa:	6e65                	lui	t3,0x19
fc4063ac:	6920                	flw	fs0,80(a0)
fc4063ae:	          	csrr	zero,0x622

fc4063b0 <.Lanon.e91c7f888894566cb3fc7059480f37ac.11>:
fc4063b0:	6220                	flw	fs0,64(a2)
fc4063b2:	7475                	lui	s0,0xffffd
fc4063b4:	7420                	flw	fs0,104(s0)
fc4063b6:	6568                	flw	fa0,76(a0)
fc4063b8:	6920                	flw	fs0,80(a0)
fc4063ba:	646e                	flw	fs0,216(sp)
fc4063bc:	7865                	lui	a6,0xffff9
fc4063be:	6920                	flw	fs0,80(a0)
fc4063c0:	00002073          	csrr	zero,ustatus

fc4063c4 <.Lanon.e91c7f888894566cb3fc7059480f37ac.12>:
fc4063c4:	6390                	flw	fa2,0(a5)
fc4063c6:	fc40                	fsw	fs0,60(s0)
fc4063c8:	0020                	addi	s0,sp,8
fc4063ca:	0000                	unimp
fc4063cc:	63b0                	flw	fa2,64(a5)
fc4063ce:	fc40                	fsw	fs0,60(s0)
fc4063d0:	0012                	c.slli	zero,0x4
	...

fc4063d4 <.Lanon.656bae129583d213deca8b002e63a072.13>:
fc4063d4:	                	flw	fs0,68(a4)

fc4063d5 <.Lanon.656bae129583d213deca8b002e63a072.16>:
fc4063d5:	6c6c6163          	bltu	s8,t1,fc406a97 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0xd9>
fc4063d9:	6465                	lui	s0,0x19
fc4063db:	6020                	flw	fs0,64(s0)
fc4063dd:	6974704f          	fnmadd.s	ft0,fs0,fs7,fa3
fc4063e1:	3a3a6e6f          	jal	t3,fc4acf83 <ebss+0x8dee3>
fc4063e5:	6e75                	lui	t3,0x1d
fc4063e7:	70617277          	0x70617277
fc4063eb:	2928                	fld	fa0,80(a0)
fc4063ed:	2060                	fld	fs0,192(s0)
fc4063ef:	61206e6f          	jal	t3,fc40ca01 <bootstack+0x2a01>
fc4063f3:	6020                	flw	fs0,64(s0)
fc4063f5:	6f4e                	flw	ft10,208(sp)
fc4063f7:	656e                	flw	fa0,216(sp)
fc4063f9:	2060                	fld	fs0,192(s0)
fc4063fb:	6176                	flw	ft2,92(sp)
fc4063fd:	756c                	flw	fa1,108(a0)
fc4063ff:	                	jal	fc406bb7 <anon.fe7732283a7f5a795c6169f6eb5e8c98.41.llvm.7276170047363281110+0xd4>

fc406400 <.Lanon.656bae129583d213deca8b002e63a072.17>:
fc406400:	6d6f682f          	0x6d6f682f
fc406404:	2f65                	jal	fc406bbc <anon.fe7732283a7f5a795c6169f6eb5e8c98.41.llvm.7276170047363281110+0xd9>
fc406406:	6166                	flw	ft2,88(sp)
fc406408:	7a6e                	flw	fs4,248(sp)
fc40640a:	6968                	flw	fa0,84(a0)
fc40640c:	6570                	flw	fa2,76(a0)
fc40640e:	676e                	flw	fa4,216(sp)
fc406410:	75722e2f          	0x75722e2f
fc406414:	70757473          	csrrci	s0,0x707,10
fc406418:	6f6f742f          	0x6f6f742f
fc40641c:	636c                	flw	fa1,68(a4)
fc40641e:	6168                	flw	fa0,68(a0)
fc406420:	6e69                	lui	t3,0x1a
fc406422:	696e2f73          	csrrs	t5,0x696,t3
fc406426:	6c746867          	0x6c746867
fc40642a:	2d79                	jal	fc406ac8 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0x10a>
fc40642c:	3878                	fld	fa4,240(s0)
fc40642e:	5f36                	lw	t5,108(sp)
fc406430:	3436                	fld	fs0,360(sp)
fc406432:	752d                	lui	a0,0xfffeb
fc406434:	6b6e                	flw	fs6,216(sp)
fc406436:	6f6e                	flw	ft10,216(sp)
fc406438:	6c2d6e77          	0x6c2d6e77
fc40643c:	6e69                	lui	t3,0x1a
fc40643e:	7875                	lui	a6,0xffffd
fc406440:	672d                	lui	a4,0xb
fc406442:	756e                	flw	fa0,248(sp)
fc406444:	62696c2f          	0x62696c2f
fc406448:	7375722f          	0x7375722f
fc40644c:	6c74                	flw	fa3,92(s0)
fc40644e:	6269                	lui	tp,0x1a
fc406450:	6372732f          	0x6372732f
fc406454:	7375722f          	0x7375722f
fc406458:	2f74                	fld	fa3,216(a4)
fc40645a:	2f637273          	csrrci	tp,0x2f6,6
fc40645e:	696c                	flw	fa1,84(a0)
fc406460:	6362                	flw	ft6,24(sp)
fc406462:	2f65726f          	jal	tp,fc45d758 <ebss+0x3e6b8>
fc406466:	6974706f          	j	fc44e2fc <ebss+0x2f25c>
fc40646a:	722e6e6f          	jal	t3,fc4ecb8c <ebss+0xcdaec>
fc40646e:	          	0x63d50073

fc406470 <.Lanon.656bae129583d213deca8b002e63a072.18>:
fc406470:	63d5                	lui	t2,0x15
fc406472:	fc40                	fsw	fs0,60(s0)
fc406474:	0000002b          	0x2b
fc406478:	6400                	flw	fs0,8(s0)
fc40647a:	fc40                	fsw	fs0,60(s0)
fc40647c:	0000006f          	j	fc40647c <.Lanon.656bae129583d213deca8b002e63a072.18+0xc>
fc406480:	017a                	slli	sp,sp,0x1e
fc406482:	0000                	unimp
fc406484:	0015                	c.nop	5
	...

fc406488 <.Lanon.656bae129583d213deca8b002e63a072.20>:
fc406488:	203a                	fld	ft0,392(sp)
	...

fc40648c <.Lanon.656bae129583d213deca8b002e63a072.21>:
fc40648c:	6488                	flw	fa0,8(s1)
fc40648e:	fc40                	fsw	fs0,60(s0)
fc406490:	0000                	unimp
fc406492:	0000                	unimp
fc406494:	6488                	flw	fa0,8(s1)
fc406496:	fc40                	fsw	fs0,60(s0)
fc406498:	0002                	c.slli64	zero
	...

fc40649c <.Lanon.656bae129583d213deca8b002e63a072.22>:
fc40649c:	6d6f682f          	0x6d6f682f
fc4064a0:	2f65                	jal	fc406c58 <anon.fe7732283a7f5a795c6169f6eb5e8c98.42.llvm.7276170047363281110+0x3b>
fc4064a2:	6166                	flw	ft2,88(sp)
fc4064a4:	7a6e                	flw	fs4,248(sp)
fc4064a6:	6968                	flw	fa0,84(a0)
fc4064a8:	6570                	flw	fa2,76(a0)
fc4064aa:	676e                	flw	fa4,216(sp)
fc4064ac:	75722e2f          	0x75722e2f
fc4064b0:	70757473          	csrrci	s0,0x707,10
fc4064b4:	6f6f742f          	0x6f6f742f
fc4064b8:	636c                	flw	fa1,68(a4)
fc4064ba:	6168                	flw	fa0,68(a0)
fc4064bc:	6e69                	lui	t3,0x1a
fc4064be:	696e2f73          	csrrs	t5,0x696,t3
fc4064c2:	6c746867          	0x6c746867
fc4064c6:	2d79                	jal	fc406b64 <anon.fe7732283a7f5a795c6169f6eb5e8c98.41.llvm.7276170047363281110+0x81>
fc4064c8:	3878                	fld	fa4,240(s0)
fc4064ca:	5f36                	lw	t5,108(sp)
fc4064cc:	3436                	fld	fs0,360(sp)
fc4064ce:	752d                	lui	a0,0xfffeb
fc4064d0:	6b6e                	flw	fs6,216(sp)
fc4064d2:	6f6e                	flw	ft10,216(sp)
fc4064d4:	6c2d6e77          	0x6c2d6e77
fc4064d8:	6e69                	lui	t3,0x1a
fc4064da:	7875                	lui	a6,0xffffd
fc4064dc:	672d                	lui	a4,0xb
fc4064de:	756e                	flw	fa0,248(sp)
fc4064e0:	62696c2f          	0x62696c2f
fc4064e4:	7375722f          	0x7375722f
fc4064e8:	6c74                	flw	fa3,92(s0)
fc4064ea:	6269                	lui	tp,0x1a
fc4064ec:	6372732f          	0x6372732f
fc4064f0:	7375722f          	0x7375722f
fc4064f4:	2f74                	fld	fa3,216(a4)
fc4064f6:	2f637273          	csrrci	tp,0x2f6,6
fc4064fa:	696c                	flw	fa1,84(a0)
fc4064fc:	6362                	flw	ft6,24(sp)
fc4064fe:	2f65726f          	jal	tp,fc45d7f4 <ebss+0x3e754>
fc406502:	6572                	flw	fa0,28(sp)
fc406504:	746c7573          	csrrci	a0,0x746,24
fc406508:	722e                	flw	ft4,232(sp)
fc40650a:	          	0x649c0073

fc40650c <.Lanon.656bae129583d213deca8b002e63a072.23>:
fc40650c:	649c                	flw	fa5,8(s1)
fc40650e:	fc40                	fsw	fs0,60(s0)
fc406510:	0000006f          	j	fc406510 <.Lanon.656bae129583d213deca8b002e63a072.23+0x4>
fc406514:	048d                	addi	s1,s1,3
fc406516:	0000                	unimp
fc406518:	0005                	c.nop	1
fc40651a:	0000                	unimp
fc40651c:	2820                	fld	fs0,80(s0)
fc40651e:	7962                	flw	fs2,56(sp)
fc406520:	6574                	flw	fa3,76(a0)
fc406522:	73552073          	csrs	0x735,a0
fc406526:	7265                	lui	tp,0xffff9
fc406528:	74666f53          	0x74666f53

fc40652c <.Lanon.656bae129583d213deca8b002e63a072.44>:
fc40652c:	2e2e2e5b          	0x2e2e2e5b
fc406530:	                	lui	tp,0x17

fc406531 <.Lanon.656bae129583d213deca8b002e63a072.45>:
fc406531:	7962                	flw	fs2,56(sp)
fc406533:	6574                	flw	fa3,76(a0)
fc406535:	6920                	flw	fs0,80(a0)
fc406537:	646e                	flw	fs0,216(sp)
fc406539:	7865                	lui	a6,0xffff9
fc40653b:	                	fld	fs0,64(s0)

fc40653c <.Lanon.656bae129583d213deca8b002e63a072.46>:
fc40653c:	6920                	flw	fs0,80(a0)
fc40653e:	756f2073          	csrs	0x756,t5
fc406542:	2074                	fld	fa3,192(s0)
fc406544:	6220666f          	jal	a2,fc40cb66 <bootstack+0x2b66>
fc406548:	646e756f          	jal	a0,fc4edb8e <ebss+0xceaee>
fc40654c:	666f2073          	csrs	0x666,t5
fc406550:	6020                	flw	fs0,64(s0)
	...

fc406554 <.Lanon.656bae129583d213deca8b002e63a072.47>:
fc406554:	6531                	lui	a0,0xc
fc406556:	fc40                	fsw	fs0,60(s0)
fc406558:	0000000b          	0xb
fc40655c:	653c                	flw	fa5,72(a0)
fc40655e:	fc40                	fsw	fs0,60(s0)
fc406560:	0016                	c.slli	zero,0x5
fc406562:	0000                	unimp
fc406564:	63d4                	flw	fa3,4(a5)
fc406566:	fc40                	fsw	fs0,60(s0)
fc406568:	0001                	nop
	...

fc40656c <.Lanon.656bae129583d213deca8b002e63a072.48>:
fc40656c:	6d6f682f          	0x6d6f682f
fc406570:	2f65                	jal	fc406d28 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0x1f>
fc406572:	6166                	flw	ft2,88(sp)
fc406574:	7a6e                	flw	fs4,248(sp)
fc406576:	6968                	flw	fa0,84(a0)
fc406578:	6570                	flw	fa2,76(a0)
fc40657a:	676e                	flw	fa4,216(sp)
fc40657c:	75722e2f          	0x75722e2f
fc406580:	70757473          	csrrci	s0,0x707,10
fc406584:	6f6f742f          	0x6f6f742f
fc406588:	636c                	flw	fa1,68(a4)
fc40658a:	6168                	flw	fa0,68(a0)
fc40658c:	6e69                	lui	t3,0x1a
fc40658e:	696e2f73          	csrrs	t5,0x696,t3
fc406592:	6c746867          	0x6c746867
fc406596:	2d79                	jal	fc406c34 <anon.fe7732283a7f5a795c6169f6eb5e8c98.42.llvm.7276170047363281110+0x17>
fc406598:	3878                	fld	fa4,240(s0)
fc40659a:	5f36                	lw	t5,108(sp)
fc40659c:	3436                	fld	fs0,360(sp)
fc40659e:	752d                	lui	a0,0xfffeb
fc4065a0:	6b6e                	flw	fs6,216(sp)
fc4065a2:	6f6e                	flw	ft10,216(sp)
fc4065a4:	6c2d6e77          	0x6c2d6e77
fc4065a8:	6e69                	lui	t3,0x1a
fc4065aa:	7875                	lui	a6,0xffffd
fc4065ac:	672d                	lui	a4,0xb
fc4065ae:	756e                	flw	fa0,248(sp)
fc4065b0:	62696c2f          	0x62696c2f
fc4065b4:	7375722f          	0x7375722f
fc4065b8:	6c74                	flw	fa3,92(s0)
fc4065ba:	6269                	lui	tp,0x1a
fc4065bc:	6372732f          	0x6372732f
fc4065c0:	7375722f          	0x7375722f
fc4065c4:	2f74                	fld	fa3,216(a4)
fc4065c6:	2f637273          	csrrci	tp,0x2f6,6
fc4065ca:	696c                	flw	fa1,84(a0)
fc4065cc:	6362                	flw	ft6,24(sp)
fc4065ce:	2f65726f          	jal	tp,fc45d8c4 <ebss+0x3e824>
fc4065d2:	2f727473          	csrrci	s0,0x2f7,4
fc4065d6:	6f6d                	lui	t5,0x1b
fc4065d8:	2e64                	fld	fs1,216(a2)
fc4065da:	7372                	flw	ft6,60(sp)

fc4065dc <.Lanon.656bae129583d213deca8b002e63a072.49>:
fc4065dc:	656c                	flw	fa1,76(a0)
fc4065de:	fc40                	fsw	fs0,60(s0)
fc4065e0:	0070                	addi	a2,sp,12
fc4065e2:	0000                	unimp
fc4065e4:	00000803          	lb	a6,0(zero) # 0 <XLENB-0x4>
fc4065e8:	0009                	c.nop	2
	...

fc4065ec <.Lanon.656bae129583d213deca8b002e63a072.50>:
fc4065ec:	6562                	flw	fa0,24(sp)
fc4065ee:	206e6967          	0x206e6967
fc4065f2:	3d3c                	fld	fa5,120(a0)
fc4065f4:	6520                	flw	fs0,72(a0)
fc4065f6:	646e                	flw	fs0,216(sp)
fc4065f8:	2820                	fld	fs0,80(s0)
fc4065fa:	0000                	unimp
fc4065fc:	2020                	fld	fs0,64(s0)
fc4065fe:	2020                	fld	fs0,64(s0)
fc406600:	3c20                	fld	fs0,120(s0)
fc406602:	203d                	jal	fc406630 <.Lanon.656bae129583d213deca8b002e63a072.50+0x44>
fc406604:	0000                	unimp
fc406606:	8080                	0x8080
fc406608:	0800                	addi	s0,sp,16
fc40660a:	0008                	0x8
fc40660c:	63706573          	csrrsi	a0,0x637,0
fc406610:	6962                	flw	fs2,24(sp)
fc406612:	7374                	flw	fa3,100(a4)
fc406614:	2029                	jal	fc40661e <.Lanon.656bae129583d213deca8b002e63a072.50+0x32>
fc406616:	6e656877          	0x6e656877
fc40661a:	7320                	flw	fs0,96(a4)
fc40661c:	696c                	flw	fa1,84(a0)
fc40661e:	676e6963          	bltu	t3,s6,fc406c90 <anon.fe7732283a7f5a795c6169f6eb5e8c98.43.llvm.7276170047363281110+0x2d>
fc406622:	6020                	flw	fs0,64(s0)
fc406624:	2f637273          	csrrci	tp,0x2f6,6
fc406628:	6e69                	lui	t3,0x1a
fc40662a:	6574                	flw	fa3,76(a0)
fc40662c:	7272                	flw	ft4,60(sp)
fc40662e:	7075                	c.lui	zero,0xffffd
fc406630:	2e74                	fld	fa3,216(a2)
fc406632:	7372                	flw	ft6,60(sp)
fc406634:	6e65                	lui	t3,0x19
fc406636:	2064                	fld	fs1,192(s0)
fc406638:	7220666f          	jal	a2,fc40cd5a <bootstack+0x2d5a>
fc40663c:	7375                	lui	t1,0xffffd
fc40663e:	5f74                	lw	a3,124(a4)
fc406640:	616d                	addi	sp,sp,240
fc406642:	6e69                	lui	t3,0x1a
fc406644:	6e49                	lui	t3,0x12
fc406646:	75727473          	csrrci	s0,0x757,4
fc40664a:	6f697463          	bgeu	s2,s6,fc406d32 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0x29>
fc40664e:	466e                	lw	a2,216(sp)
fc406650:	7561                	lui	a0,0xffff8
fc406652:	746c                	flw	fa1,108(s0)

fc406654 <.Lanon.656bae129583d213deca8b002e63a072.53>:
fc406654:	65ec                	flw	fa1,76(a1)
fc406656:	fc40                	fsw	fs0,60(s0)
fc406658:	000e                	c.slli	zero,0x3
fc40665a:	0000                	unimp
fc40665c:	6600                	flw	fs0,8(a2)
fc40665e:	fc40                	fsw	fs0,60(s0)
fc406660:	0004                	0x4
fc406662:	0000                	unimp
fc406664:	6614                	flw	fa3,8(a2)
fc406666:	fc40                	fsw	fs0,60(s0)
fc406668:	0010                	0x10
fc40666a:	0000                	unimp
fc40666c:	63d4                	flw	fa3,4(a5)
fc40666e:	fc40                	fsw	fs0,60(s0)
fc406670:	0001                	nop
	...

fc406674 <.Lanon.656bae129583d213deca8b002e63a072.54>:
fc406674:	656c                	flw	fa1,76(a0)
fc406676:	fc40                	fsw	fs0,60(s0)
fc406678:	0070                	addi	a2,sp,12
fc40667a:	0000                	unimp
fc40667c:	00000807          	0x807
fc406680:	0005                	c.nop	1
	...

fc406684 <.Lanon.656bae129583d213deca8b002e63a072.55>:
fc406684:	6920                	flw	fs0,80(a0)
fc406686:	6f6e2073          	csrs	0x6f6,t3
fc40668a:	2074                	fld	fa3,192(s0)
fc40668c:	2061                	jal	fc406714 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.4+0x1>
fc40668e:	72616863          	bltu	sp,t1,fc406dbe <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0xb5>
fc406692:	6220                	flw	fs0,64(a2)
fc406694:	646e756f          	jal	a0,fc4edcda <ebss+0xcec3a>
fc406698:	7261                	lui	tp,0xffff8
fc40669a:	3b79                	jal	fc406438 <.Lanon.656bae129583d213deca8b002e63a072.17+0x38>
fc40669c:	6920                	flw	fs0,80(a0)
fc40669e:	2074                	fld	fa3,192(s0)
fc4066a0:	7369                	lui	t1,0xffffa
fc4066a2:	6920                	flw	fs0,80(a0)
fc4066a4:	736e                	flw	ft6,248(sp)
fc4066a6:	6469                	lui	s0,0x1a
fc4066a8:	2065                	jal	fc406750 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.4+0x3d>

fc4066aa <.Lanon.656bae129583d213deca8b002e63a072.57>:
fc4066aa:	2029                	jal	fc4066b4 <.Lanon.656bae129583d213deca8b002e63a072.58+0x4>
fc4066ac:	6020666f          	jal	a2,fc40ccae <bootstack+0x2cae>

fc4066b0 <.Lanon.656bae129583d213deca8b002e63a072.58>:
fc4066b0:	6531                	lui	a0,0xc
fc4066b2:	fc40                	fsw	fs0,60(s0)
fc4066b4:	0000000b          	0xb
fc4066b8:	6684                	flw	fs1,8(a3)
fc4066ba:	fc40                	fsw	fs0,60(s0)
fc4066bc:	0026                	c.slli	zero,0x9
fc4066be:	0000                	unimp
fc4066c0:	651c                	flw	fa5,8(a0)
fc4066c2:	fc40                	fsw	fs0,60(s0)
fc4066c4:	0008                	0x8
fc4066c6:	0000                	unimp
fc4066c8:	66aa                	flw	fa3,136(sp)
fc4066ca:	fc40                	fsw	fs0,60(s0)
fc4066cc:	0006                	c.slli	zero,0x1
fc4066ce:	0000                	unimp
fc4066d0:	63d4                	flw	fa3,4(a5)
fc4066d2:	fc40                	fsw	fs0,60(s0)
fc4066d4:	0001                	nop
	...

fc4066d8 <.Lanon.656bae129583d213deca8b002e63a072.59>:
fc4066d8:	656c                	flw	fa1,76(a0)
fc4066da:	fc40                	fsw	fs0,60(s0)
fc4066dc:	0070                	addi	a2,sp,12
fc4066de:	0000                	unimp
fc4066e0:	0814                	addi	a3,sp,16
fc4066e2:	0000                	unimp
fc4066e4:	0005                	c.nop	1
	...

fc4066e8 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.3>:
fc4066e8:	6c6c6163          	bltu	s8,t1,fc406daa <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0xa1>
fc4066ec:	6465                	lui	s0,0x19
fc4066ee:	6020                	flw	fs0,64(s0)
fc4066f0:	6974704f          	fnmadd.s	ft0,fs0,fs7,fa3
fc4066f4:	3a3a6e6f          	jal	t3,fc4ad296 <ebss+0x8e1f6>
fc4066f8:	6e75                	lui	t3,0x1d
fc4066fa:	70617277          	0x70617277
fc4066fe:	2928                	fld	fa0,80(a0)
fc406700:	2060                	fld	fs0,192(s0)
fc406702:	61206e6f          	jal	t3,fc40cd14 <bootstack+0x2d14>
fc406706:	6020                	flw	fs0,64(s0)
fc406708:	6f4e                	flw	ft10,208(sp)
fc40670a:	656e                	flw	fa0,216(sp)
fc40670c:	2060                	fld	fs0,192(s0)
fc40670e:	6176                	flw	ft2,92(sp)
fc406710:	756c                	flw	fa1,108(a0)
fc406712:	                	jal	fc406eca <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0x22>

fc406713 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.4>:
fc406713:	6d6f682f          	0x6d6f682f
fc406717:	2f65                	jal	fc406ecf <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0x27>
fc406719:	6166                	flw	ft2,88(sp)
fc40671b:	7a6e                	flw	fs4,248(sp)
fc40671d:	6968                	flw	fa0,84(a0)
fc40671f:	6570                	flw	fa2,76(a0)
fc406721:	676e                	flw	fa4,216(sp)
fc406723:	75722e2f          	0x75722e2f
fc406727:	70757473          	csrrci	s0,0x707,10
fc40672b:	6f6f742f          	0x6f6f742f
fc40672f:	636c                	flw	fa1,68(a4)
fc406731:	6168                	flw	fa0,68(a0)
fc406733:	6e69                	lui	t3,0x1a
fc406735:	696e2f73          	csrrs	t5,0x696,t3
fc406739:	6c746867          	0x6c746867
fc40673d:	2d79                	jal	fc406ddb <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0xd2>
fc40673f:	3878                	fld	fa4,240(s0)
fc406741:	5f36                	lw	t5,108(sp)
fc406743:	3436                	fld	fs0,360(sp)
fc406745:	752d                	lui	a0,0xfffeb
fc406747:	6b6e                	flw	fs6,216(sp)
fc406749:	6f6e                	flw	ft10,216(sp)
fc40674b:	6c2d6e77          	0x6c2d6e77
fc40674f:	6e69                	lui	t3,0x1a
fc406751:	7875                	lui	a6,0xffffd
fc406753:	672d                	lui	a4,0xb
fc406755:	756e                	flw	fa0,248(sp)
fc406757:	62696c2f          	0x62696c2f
fc40675b:	7375722f          	0x7375722f
fc40675f:	6c74                	flw	fa3,92(s0)
fc406761:	6269                	lui	tp,0x1a
fc406763:	6372732f          	0x6372732f
fc406767:	7375722f          	0x7375722f
fc40676b:	2f74                	fld	fa3,216(a4)
fc40676d:	2f637273          	csrrci	tp,0x2f6,6
fc406771:	696c                	flw	fa1,84(a0)
fc406773:	6362                	flw	ft6,24(sp)
fc406775:	2f65726f          	jal	tp,fc45da6b <ebss+0x3e9cb>
fc406779:	6974706f          	j	fc44e60f <ebss+0x2f56f>
fc40677d:	722e6e6f          	jal	t3,fc4ece9f <ebss+0xcddff>
fc406781:	          	0xe8000073

fc406784 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.5>:
fc406784:	66e8                	flw	fa0,76(a3)
fc406786:	fc40                	fsw	fs0,60(s0)
fc406788:	0000002b          	0x2b
fc40678c:	fc406713          	ori	a4,zero,-60
fc406790:	0000006f          	j	fc406790 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.5+0xc>
fc406794:	017a                	slli	sp,sp,0x1e
fc406796:	0000                	unimp
fc406798:	0015                	c.nop	5
	...

fc40679c <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.15>:
fc40679c:	6d6f682f          	0x6d6f682f
fc4067a0:	2f65                	jal	fc406f58 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0xb0>
fc4067a2:	6166                	flw	ft2,88(sp)
fc4067a4:	7a6e                	flw	fs4,248(sp)
fc4067a6:	6968                	flw	fa0,84(a0)
fc4067a8:	6570                	flw	fa2,76(a0)
fc4067aa:	676e                	flw	fa4,216(sp)
fc4067ac:	75722e2f          	0x75722e2f
fc4067b0:	70757473          	csrrci	s0,0x707,10
fc4067b4:	6f6f742f          	0x6f6f742f
fc4067b8:	636c                	flw	fa1,68(a4)
fc4067ba:	6168                	flw	fa0,68(a0)
fc4067bc:	6e69                	lui	t3,0x1a
fc4067be:	696e2f73          	csrrs	t5,0x696,t3
fc4067c2:	6c746867          	0x6c746867
fc4067c6:	2d79                	jal	fc406e64 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0x15b>
fc4067c8:	3878                	fld	fa4,240(s0)
fc4067ca:	5f36                	lw	t5,108(sp)
fc4067cc:	3436                	fld	fs0,360(sp)
fc4067ce:	752d                	lui	a0,0xfffeb
fc4067d0:	6b6e                	flw	fs6,216(sp)
fc4067d2:	6f6e                	flw	ft10,216(sp)
fc4067d4:	6c2d6e77          	0x6c2d6e77
fc4067d8:	6e69                	lui	t3,0x1a
fc4067da:	7875                	lui	a6,0xffffd
fc4067dc:	672d                	lui	a4,0xb
fc4067de:	756e                	flw	fa0,248(sp)
fc4067e0:	62696c2f          	0x62696c2f
fc4067e4:	7375722f          	0x7375722f
fc4067e8:	6c74                	flw	fa3,92(s0)
fc4067ea:	6269                	lui	tp,0x1a
fc4067ec:	6372732f          	0x6372732f
fc4067f0:	7375722f          	0x7375722f
fc4067f4:	2f74                	fld	fa3,216(a4)
fc4067f6:	2f637273          	csrrci	tp,0x2f6,6
fc4067fa:	696c                	flw	fa1,84(a0)
fc4067fc:	6362                	flw	ft6,24(sp)
fc4067fe:	2f65726f          	jal	tp,fc45daf4 <ebss+0x3ea54>
fc406802:	63696c73          	csrrsi	s8,0x636,18
fc406806:	2f65                	jal	fc406fbe <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0x116>
fc406808:	6f6d                	lui	t5,0x1b
fc40680a:	2e64                	fld	fs1,216(a2)
fc40680c:	7372                	flw	ft6,60(sp)

fc40680e <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.17>:
fc40680e:	6e69                	lui	t3,0x1a
fc406810:	6564                	flw	fs1,76(a0)
fc406812:	2078                	fld	fa4,192(s0)

fc406814 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.18>:
fc406814:	6f20                	flw	fs0,88(a4)
fc406816:	7475                	lui	s0,0xffffd
fc406818:	6f20                	flw	fs0,88(a4)
fc40681a:	2066                	fld	ft0,88(sp)
fc40681c:	6172                	flw	ft2,28(sp)
fc40681e:	676e                	flw	fa4,216(sp)
fc406820:	2065                	jal	fc4068c8 <str.4+0x28>
fc406822:	6f66                	flw	ft10,88(sp)
fc406824:	2072                	fld	ft0,280(sp)
fc406826:	63696c73          	csrrsi	s8,0x636,18
fc40682a:	2065                	jal	fc4068d2 <str.4+0x32>
fc40682c:	6c20666f          	jal	a2,fc40ceee <bootstack+0x2eee>
fc406830:	6e65                	lui	t3,0x19
fc406832:	20687467          	0x20687467
	...

fc406838 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.19>:
fc406838:	680e                	flw	fa6,192(sp)
fc40683a:	fc40                	fsw	fs0,60(s0)
fc40683c:	0006                	c.slli	zero,0x1
fc40683e:	0000                	unimp
fc406840:	6814                	flw	fa3,16(s0)
fc406842:	fc40                	fsw	fs0,60(s0)
fc406844:	0022                	c.slli	zero,0x8
	...

fc406848 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.20>:
fc406848:	679c                	flw	fa5,8(a5)
fc40684a:	fc40                	fsw	fs0,60(s0)
fc40684c:	0072                	c.slli	zero,0x1c
fc40684e:	0000                	unimp
fc406850:	0a68                	addi	a0,sp,284
fc406852:	0000                	unimp
fc406854:	0005                	c.nop	1
	...

fc406858 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.21>:
fc406858:	63696c73          	csrrsi	s8,0x636,18
fc40685c:	2065                	jal	fc406904 <str.4+0x64>
fc40685e:	6e69                	lui	t3,0x1a
fc406860:	6564                	flw	fs1,76(a0)
fc406862:	2078                	fld	fa4,192(s0)
fc406864:	72617473          	csrrci	s0,0x726,2
fc406868:	7374                	flw	fa3,100(a4)
fc40686a:	6120                	flw	fs0,64(a0)
fc40686c:	2074                	fld	fa3,192(s0)

fc40686e <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.22>:
fc40686e:	6220                	flw	fs0,64(a2)
fc406870:	7475                	lui	s0,0xffffd
fc406872:	6520                	flw	fs0,72(a0)
fc406874:	646e                	flw	fs0,216(sp)
fc406876:	74612073          	csrs	0x746,sp
fc40687a:	0020                	addi	s0,sp,8

fc40687c <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.23>:
fc40687c:	6858                	flw	fa4,20(s0)
fc40687e:	fc40                	fsw	fs0,60(s0)
fc406880:	0016                	c.slli	zero,0x5
fc406882:	0000                	unimp
fc406884:	686e                	flw	fa6,216(sp)
fc406886:	fc40                	fsw	fs0,60(s0)
fc406888:	000d                	c.nop	3
	...

fc40688c <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.24>:
fc40688c:	679c                	flw	fa5,8(a5)
fc40688e:	fc40                	fsw	fs0,60(s0)
fc406890:	0072                	c.slli	zero,0x1c
fc406892:	0000                	unimp
fc406894:	0a6e                	slli	s4,s4,0x1b
fc406896:	0000                	unimp
fc406898:	0005                	c.nop	1
fc40689a:	0000                	unimp
fc40689c:	0000                	unimp
	...

fc4068a0 <str.4>:
fc4068a0:	6d6f682f          	0x6d6f682f
fc4068a4:	2f65                	jal	fc40705c <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0x1b4>
fc4068a6:	6166                	flw	ft2,88(sp)
fc4068a8:	7a6e                	flw	fs4,248(sp)
fc4068aa:	6968                	flw	fa0,84(a0)
fc4068ac:	6570                	flw	fa2,76(a0)
fc4068ae:	676e                	flw	fa4,216(sp)
fc4068b0:	75722e2f          	0x75722e2f
fc4068b4:	70757473          	csrrci	s0,0x707,10
fc4068b8:	6f6f742f          	0x6f6f742f
fc4068bc:	636c                	flw	fa1,68(a4)
fc4068be:	6168                	flw	fa0,68(a0)
fc4068c0:	6e69                	lui	t3,0x1a
fc4068c2:	696e2f73          	csrrs	t5,0x696,t3
fc4068c6:	6c746867          	0x6c746867
fc4068ca:	2d79                	jal	fc406f68 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0xc0>
fc4068cc:	3878                	fld	fa4,240(s0)
fc4068ce:	5f36                	lw	t5,108(sp)
fc4068d0:	3436                	fld	fs0,360(sp)
fc4068d2:	752d                	lui	a0,0xfffeb
fc4068d4:	6b6e                	flw	fs6,216(sp)
fc4068d6:	6f6e                	flw	ft10,216(sp)
fc4068d8:	6c2d6e77          	0x6c2d6e77
fc4068dc:	6e69                	lui	t3,0x1a
fc4068de:	7875                	lui	a6,0xffffd
fc4068e0:	672d                	lui	a4,0xb
fc4068e2:	756e                	flw	fa0,248(sp)
fc4068e4:	62696c2f          	0x62696c2f
fc4068e8:	7375722f          	0x7375722f
fc4068ec:	6c74                	flw	fa3,92(s0)
fc4068ee:	6269                	lui	tp,0x1a
fc4068f0:	6372732f          	0x6372732f
fc4068f4:	7375722f          	0x7375722f
fc4068f8:	2f74                	fld	fa3,216(a4)
fc4068fa:	2f637273          	csrrci	tp,0x2f6,6
fc4068fe:	696c                	flw	fa1,84(a0)
fc406900:	6362                	flw	ft6,24(sp)
fc406902:	2f65726f          	jal	tp,fc45dbf8 <ebss+0x3eb58>
fc406906:	6e75                	lui	t3,0x1d
fc406908:	6369                	lui	t1,0x1a
fc40690a:	2f65646f          	jal	s0,fc45cc00 <ebss+0x3db60>
fc40690e:	6f62                	flw	ft10,24(sp)
fc406910:	745f6c6f          	jal	s8,fc4fd854 <ebss+0xde7b4>
fc406914:	6972                	flw	fs2,28(sp)
fc406916:	2e65                	jal	fc406cce <anon.fe7732283a7f5a795c6169f6eb5e8c98.43.llvm.7276170047363281110+0x6b>
fc406918:	7372                	flw	ft6,60(sp)
	...

fc40691c <anon.fe7732283a7f5a795c6169f6eb5e8c98.33.llvm.7276170047363281110>:
fc40691c:	68a0                	flw	fs0,80(s1)
fc40691e:	fc40                	fsw	fs0,60(s0)
fc406920:	007a                	c.slli	zero,0x1e
fc406922:	0000                	unimp
fc406924:	00000027          	0x27
fc406928:	0019                	c.nop	6
	...

fc40692c <anon.fe7732283a7f5a795c6169f6eb5e8c98.34.llvm.7276170047363281110>:
fc40692c:	68a0                	flw	fs0,80(s1)
fc40692e:	fc40                	fsw	fs0,60(s0)
fc406930:	007a                	c.slli	zero,0x1e
fc406932:	0000                	unimp
fc406934:	0028                	addi	a0,sp,8
fc406936:	0000                	unimp
fc406938:	0020                	addi	s0,sp,8
	...

fc40693c <anon.fe7732283a7f5a795c6169f6eb5e8c98.35.llvm.7276170047363281110>:
fc40693c:	68a0                	flw	fs0,80(s1)
fc40693e:	fc40                	fsw	fs0,60(s0)
fc406940:	007a                	c.slli	zero,0x1e
fc406942:	0000                	unimp
fc406944:	002a                	c.slli	zero,0xa
fc406946:	0000                	unimp
fc406948:	0019                	c.nop	6
	...

fc40694c <anon.fe7732283a7f5a795c6169f6eb5e8c98.36.llvm.7276170047363281110>:
fc40694c:	68a0                	flw	fs0,80(s1)
fc40694e:	fc40                	fsw	fs0,60(s0)
fc406950:	007a                	c.slli	zero,0x1e
fc406952:	0000                	unimp
fc406954:	0000002b          	0x2b
fc406958:	0018                	0x18
	...

fc40695c <anon.fe7732283a7f5a795c6169f6eb5e8c98.37.llvm.7276170047363281110>:
fc40695c:	68a0                	flw	fs0,80(s1)
fc40695e:	fc40                	fsw	fs0,60(s0)
fc406960:	007a                	c.slli	zero,0x1e
fc406962:	0000                	unimp
fc406964:	002c                	addi	a1,sp,8
fc406966:	0000                	unimp
fc406968:	0020                	addi	s0,sp,8
	...

fc40696c <anon.fe7732283a7f5a795c6169f6eb5e8c98.39.llvm.7276170047363281110>:
fc40696c:	0100                	addi	s0,sp,128
fc40696e:	06050503          	lb	a0,96(a0) # fffeb060 <ebss+0x3bcbfc0>
fc406972:	0306                	slli	t1,t1,0x1
fc406974:	08080607          	0x8080607
fc406978:	1109                	addi	sp,sp,-30
fc40697a:	1c0a                	slli	s8,s8,0x22
fc40697c:	140c190b          	0x140c190b
fc406980:	120d                	addi	tp,tp,-29
fc406982:	0d0e                	slli	s10,s10,0x3
fc406984:	0310040f          	0x310040f
fc406988:	1212                	slli	tp,tp,0x24
fc40698a:	01160913          	addi	s2,a2,17 # 37373011 <XLENB+0x3737300d>
fc40698e:	02180517          	auipc	a0,0x2180
fc406992:	0319                	addi	t1,t1,6
fc406994:	071a                	slli	a4,a4,0x6
fc406996:	021c                	addi	a5,sp,256
fc406998:	011d                	addi	sp,sp,7
fc40699a:	161f 0320 042b      	0x42b0320161f
fc4069a0:	022c                	addi	a1,sp,264
fc4069a2:	0b2d                	addi	s6,s6,11
fc4069a4:	012e                	slli	sp,sp,0xb
fc4069a6:	0330                	addi	a2,sp,392
fc4069a8:	0231                	addi	tp,tp,12
fc4069aa:	0132                	slli	sp,sp,0xc
fc4069ac:	02a902a7          	0x2a902a7
fc4069b0:	04aa                	slli	s1,s1,0xa
fc4069b2:	02fa08ab          	0x2fa08ab
fc4069b6:	04fd05fb          	0x4fd05fb
fc4069ba:	03fe                	slli	t2,t2,0x1f
fc4069bc:	09ff                	0x9ff

fc4069be <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110>:
fc4069be:	78ad                	lui	a7,0xfffeb
fc4069c0:	8b79                	andi	a4,a4,30
fc4069c2:	a28d                	j	fc406b24 <anon.fe7732283a7f5a795c6169f6eb5e8c98.41.llvm.7276170047363281110+0x41>
fc4069c4:	5730                	lw	a2,104(a4)
fc4069c6:	8b58                	0x8b58
fc4069c8:	908c                	0x908c
fc4069ca:	1d1c                	addi	a5,sp,688
fc4069cc:	0edd                	addi	t4,t4,23
fc4069ce:	fb4c4b0f          	0xfb4c4b0f
fc4069d2:	2efc                	fld	fa5,216(a3)
fc4069d4:	5d5c3f2f          	0x5d5c3f2f
fc4069d8:	b55f 84e2 8e8d      	0x8e8d84e2b55f
fc4069de:	9291                	srli	a3,a3,0x24
fc4069e0:	b1a9                	j	fc40662a <.Lanon.656bae129583d213deca8b002e63a072.50+0x3e>
fc4069e2:	bbba                	fsd	fa4,496(sp)
fc4069e4:	c6c5                	beqz	a3,fc406a8c <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0xce>
fc4069e6:	cac9                	beqz	a3,fc406a78 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0xba>
fc4069e8:	e4de                	fsw	fs7,72(sp)
fc4069ea:	ffe5                	bnez	a5,fc4069e2 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0x24>
fc4069ec:	0400                	addi	s0,sp,512
fc4069ee:	1211                	addi	tp,tp,-28
fc4069f0:	3129                	jal	fc4065fa <.Lanon.656bae129583d213deca8b002e63a072.50+0xe>
fc4069f2:	3734                	fld	fa3,104(a4)
fc4069f4:	3b3a                	fld	fs6,424(sp)
fc4069f6:	493d                	li	s2,15
fc4069f8:	5d4a                	lw	s10,176(sp)
fc4069fa:	8e84                	0x8e84
fc4069fc:	a992                	fsd	ft4,208(sp)
fc4069fe:	b4b1                	j	fc40644a <.Lanon.656bae129583d213deca8b002e63a072.17+0x4a>
fc406a00:	bbba                	fsd	fa4,496(sp)
fc406a02:	cac6                	sw	a7,84(sp)
fc406a04:	cfce                	sw	s3,220(sp)
fc406a06:	e5e4                	fsw	fs1,76(a1)
fc406a08:	0400                	addi	s0,sp,512
fc406a0a:	0e0d                	addi	t3,t3,3
fc406a0c:	1211                	addi	tp,tp,-28
fc406a0e:	3129                	jal	fc406618 <.Lanon.656bae129583d213deca8b002e63a072.50+0x2c>
fc406a10:	3a34                	fld	fa3,112(a2)
fc406a12:	4946453b          	0x4946453b
fc406a16:	5e4a                	lw	t3,176(sp)
fc406a18:	6564                	flw	fs1,76(a0)
fc406a1a:	9184                	0x9184
fc406a1c:	cec99d9b          	0xcec99d9b
fc406a20:	29110dcf          	fnmadd.s	fs11,ft2,fa7,ft5,rne
fc406a24:	4945                	li	s2,17
fc406a26:	8d656457          	0x8d656457
fc406a2a:	a991                	j	fc406e7e <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0x175>
fc406a2c:	bab4                	fsd	fa3,112(a3)
fc406a2e:	dfc9c5bb          	0xdfc9c5bb
fc406a32:	e5e4                	fsw	fs1,76(a1)
fc406a34:	04f0                	addi	a2,sp,588
fc406a36:	110d                	addi	sp,sp,-29
fc406a38:	4945                	li	s2,17
fc406a3a:	6564                	flw	fs1,76(a0)
fc406a3c:	8180                	0x8180
fc406a3e:	b284                	fsd	fs1,32(a3)
fc406a40:	bebc                	fsd	fa5,120(a3)
fc406a42:	f0d7d5bf 8b8583f1 	0x8b8583f1f0d7d5bf
fc406a4a:	a6a4                	fsd	fs1,72(a3)
fc406a4c:	bfbe                	fsd	fa5,504(sp)
fc406a4e:	c7c5                	beqz	a5,fc406af6 <anon.fe7732283a7f5a795c6169f6eb5e8c98.41.llvm.7276170047363281110+0x13>
fc406a50:	cfce                	sw	s3,220(sp)
fc406a52:	dbda                	sw	s6,244(sp)
fc406a54:	9848                	0x9848
fc406a56:	cdbd                	beqz	a1,fc406ad4 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0x116>
fc406a58:	cec6                	sw	a7,92(sp)
fc406a5a:	4f4e49cf          	fnmadd.q	fs3,ft8,fs4,fs1,rmm
fc406a5e:	5f5e5957          	0x5f5e5957
fc406a62:	8e89                	sub	a3,a3,a0
fc406a64:	b7b6b18f          	0xb7b6b18f
fc406a68:	c7c6c1bf 171611d7 	0x171611d7c7c6c1bf
fc406a70:	f7f65c5b          	0xf7f65c5b
fc406a74:	fffe                	fsw	ft11,252(sp)
fc406a76:	0d80                	addi	s0,sp,720
fc406a78:	716d                	addi	sp,sp,-272
fc406a7a:	dfde                	sw	s7,252(sp)
fc406a7c:	0f0e                	slli	t5,t5,0x3
fc406a7e:	6e1f 1c6f 5f1d      	0x5f1d1c6f6e1f
fc406a84:	7e7d                	lui	t3,0xfffff
fc406a86:	afae                	fsd	fa1,472(sp)
fc406a88:	16fabcbb          	0x16fabcbb
fc406a8c:	461f1e17          	auipc	t3,0x461f1
fc406a90:	584f4e47          	fmsub.s	ft8,ft10,ft4,fa1,rmm
fc406a94:	5c5a                	lw	s8,180(sp)
fc406a96:	7e5e                	flw	ft8,244(sp)
fc406a98:	b57f                	0xb57f
fc406a9a:	d4c5                	beqz	s1,fc406a42 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0x84>
fc406a9c:	dcd5                	beqz	s1,fc406a58 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0x9a>
fc406a9e:	f1f0                	fsw	fa2,100(a1)
fc406aa0:	72f5                	lui	t0,0xffffd
fc406aa2:	75748f73          	0x75748f73
fc406aa6:	9796                	add	a5,a5,t0
fc406aa8:	2e265f2f          	0x2e265f2f
fc406aac:	b7afa72f          	0xb7afa72f
fc406ab0:	d7cfc7bf 97409adf 	0x97409adfd7cfc7bf
fc406ab8:	3098                	fld	fa4,32(s1)
fc406aba:	c1c01f8f          	0xc1c01f8f
fc406abe:	ffce                	fsw	fs3,252(sp)
fc406ac0:	4f4e                	lw	t5,208(sp)
fc406ac2:	5b5a                	lw	s6,180(sp)
fc406ac4:	100f0807          	0x100f0807
fc406ac8:	efee2f27          	fsw	ft10,-258(t3) # 425f798a <ebss+0x461d88ea>
fc406acc:	6f6e                	flw	ft10,216(sp)
fc406ace:	423f3d37          	lui	s10,0x423f3
fc406ad2:	9045                	srli	s0,s0,0x31
fc406ad4:	fe91                	bnez	a3,fc4069f0 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0x32>
fc406ad6:	53ff                	0x53ff
fc406ad8:	c9c87567          	0xc9c87567
fc406adc:	d1d0                	sw	a2,36(a1)
fc406ade:	d9d8                	sw	a4,52(a1)
fc406ae0:	          	0xfffee7

fc406ae3 <anon.fe7732283a7f5a795c6169f6eb5e8c98.41.llvm.7276170047363281110>:
fc406ae3:	2000                	fld	fs0,0(s0)
fc406ae5:	225f df82 8204      	0x8204df82225f
fc406aeb:	0844                	addi	s1,sp,20
fc406aed:	1106041b          	0x1106041b
fc406af1:	ac81                	j	fc406d41 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0x38>
fc406af3:	800e                	c.mv	zero,gp
fc406af5:	151e35ab          	0x151e35ab
fc406af9:	e080                	fsw	fs0,0(s1)
fc406afb:	01081903          	lh	s2,16(a6) # ffffd010 <ebss+0x3bddf70>
fc406aff:	2f04                	fld	fs1,24(a4)
fc406b01:	3404                	fld	fs1,40(s0)
fc406b03:	0704                	addi	s1,sp,896
fc406b05:	06070103          	lb	sp,96(a4) # b060 <XLENB+0xb05c>
fc406b09:	500a1107          	0x500a1107
fc406b0d:	5507120f          	0x5507120f
fc406b11:	0208                	addi	a0,sp,256
fc406b13:	1c04                	addi	s1,sp,560
fc406b15:	090a                	slli	s2,s2,0x2
fc406b17:	07030803          	lb	a6,112(t1) # 1a070 <XLENB+0x1a06c>
fc406b1b:	03030203          	lb	tp,48(t1)
fc406b1f:	05040c03          	lb	s8,80(s0) # ffffd050 <ebss+0x3bddfb0>
fc406b23:	01060b03          	lb	s6,16(a2)
fc406b27:	150e                	slli	a0,a0,0x23
fc406b29:	3a05                	jal	fc406459 <.Lanon.656bae129583d213deca8b002e63a072.17+0x59>
fc406b2b:	06071103          	lh	sp,96(a4)
fc406b2f:	1005                	c.nop	-31
fc406b31:	02075707          	0x2075707
fc406b35:	500d1507          	0x500d1507
fc406b39:	4304                	lw	s1,0(a4)
fc406b3b:	01032d03          	lw	s10,16(t1)
fc406b3f:	1104                	addi	s1,sp,160
fc406b41:	0f06                	slli	t5,t5,0x1
fc406b43:	3a0c                	fld	fa1,48(a2)
fc406b45:	1d04                	addi	s1,sp,688
fc406b47:	5f25                	li	t5,-23
fc406b49:	6d20                	flw	fs0,88(a0)
fc406b4b:	6a04                	flw	fs1,16(a2)
fc406b4d:	8025                	srli	s0,s0,0x9
fc406b4f:	05c8                	addi	a0,sp,708
fc406b51:	b082                	fsd	ft0,96(sp)
fc406b53:	82061a03          	lh	s4,-2016(a2)
fc406b57:	03fd                	addi	t2,t2,31
fc406b59:	0759                	addi	a4,a4,22
fc406b5b:	0b15                	addi	s6,s6,5
fc406b5d:	0c140917          	auipc	s2,0xc140
fc406b61:	0c14                	addi	a3,sp,528
fc406b63:	066a                	slli	a2,a2,0x1a
fc406b65:	060a                	slli	a2,a2,0x2
fc406b67:	061a                	slli	a2,a2,0x6
fc406b69:	0759                	addi	a4,a4,22
fc406b6b:	0a46052b          	0xa46052b
fc406b6f:	042c                	addi	a1,sp,520
fc406b71:	040c                	addi	a1,sp,512
fc406b73:	0301                	addi	t1,t1,0
fc406b75:	0b31                	addi	s6,s6,12
fc406b77:	042c                	addi	a1,sp,520
fc406b79:	061a                	slli	a2,a2,0x6
fc406b7b:	ac80030b          	0xac80030b
fc406b7f:	0a06                	slli	s4,s4,0x1
fc406b81:	1f06                	slli	t5,t5,0x21
fc406b83:	4c41                	li	s8,16
fc406b85:	2d04                	fld	fs1,24(a0)
fc406b87:	3c087403          	0x3c087403
fc406b8b:	3c030f03          	lb	t5,960(t1)
fc406b8f:	2b083807          	fld	fa6,688(a6)
fc406b93:	8205                	srli	a2,a2,0x1
fc406b95:	11ff                	0x11ff
fc406b97:	0818                	addi	a4,sp,16
fc406b99:	032d112f          	0x32d112f
fc406b9d:	1020                	addi	s0,sp,40
fc406b9f:	0f21                	addi	t5,t5,8
fc406ba1:	8c80                	0x8c80
fc406ba3:	8204                	0x8204
fc406ba5:	150b1997          	auipc	s3,0x150b1
fc406ba9:	9488                	0x9488
fc406bab:	2f05                	jal	fc4072db <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.58+0x1e3>
fc406bad:	3b05                	jal	fc4068dd <str.4+0x3d>
fc406baf:	180e0207          	0x180e0207
fc406bb3:	8009                	srli	s0,s0,0x2
fc406bb5:	30b0                	fld	fa2,96(s1)
fc406bb7:	0c74                	addi	a3,sp,540
fc406bb9:	d680                	sw	s0,40(a3)
fc406bbb:	0c1a                	slli	s8,s8,0x6
fc406bbd:	8005                	srli	s0,s0,0x1
fc406bbf:	05ff                	0x5ff
fc406bc1:	b680                	fsd	fs0,40(a3)
fc406bc3:	2405                	jal	fc406de3 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0xda>
fc406bc5:	9b0c                	0x9b0c
fc406bc7:	0ac6                	slli	s5,s5,0x11
fc406bc9:	30d2                	fld	ft1,304(sp)
fc406bcb:	8410                	0x8410
fc406bcd:	038d                	addi	t2,t2,3
fc406bcf:	5c810937          	lui	s2,0x5c810
fc406bd3:	8014                	0x8014
fc406bd5:	08b8                	addi	a4,sp,88
fc406bd7:	c780                	sw	s0,8(a5)
fc406bd9:	3530                	fld	fa2,104(a0)
fc406bdb:	0a04                	addi	s1,sp,272
fc406bdd:	3806                	fld	fa6,96(sp)
fc406bdf:	4608                	lw	a0,8(a2)
fc406be1:	0c08                	addi	a0,sp,528
fc406be3:	7406                	flw	fs0,96(sp)
fc406be5:	5a031e0b          	0x5a031e0b
fc406be9:	5904                	lw	s1,48(a0)
fc406beb:	8009                	srli	s0,s0,0x2
fc406bed:	0a1c1883          	lh	a7,161(s8)
fc406bf1:	0916                	slli	s2,s2,0x5
fc406bf3:	0848                	addi	a0,sp,20
fc406bf5:	8a80                	0x8a80
fc406bf7:	ab06                	fsd	ft1,400(sp)
fc406bf9:	0ca4                	addi	s1,sp,600
fc406bfb:	a1310417          	auipc	s0,0xa1310
fc406bff:	8104                	0x8104
fc406c01:	26da                	fld	fa3,400(sp)
fc406c03:	05050c07          	0x5050c07
fc406c07:	a580                	fsd	fs0,8(a1)
fc406c09:	8111                	srli	a0,a0,0x4
fc406c0b:	106d                	c.nop	-5
fc406c0d:	2878                	fld	fa4,208(s0)
fc406c0f:	062a                	slli	a2,a2,0xa
fc406c11:	044c                	addi	a1,sp,516
fc406c13:	8d80                	0x8d80
fc406c15:	8004                	0x8004
fc406c17:	03be                	slli	t2,t2,0xf
fc406c19:	0d0f031b          	0xd0f031b

fc406c1d <anon.fe7732283a7f5a795c6169f6eb5e8c98.42.llvm.7276170047363281110>:
fc406c1d:	0600                	addi	s0,sp,768
fc406c1f:	0101                	addi	sp,sp,0
fc406c21:	02040103          	lb	sp,32(s0) # 9d716c1b <XLENB+0x9d716c17>
fc406c25:	0808                	addi	a0,sp,16
fc406c27:	0209                	addi	tp,tp,2
fc406c29:	050a                	slli	a0,a0,0x2
fc406c2b:	0110020b          	0x110020b
fc406c2f:	0411                	addi	s0,s0,4
fc406c31:	0512                	slli	a0,a0,0x4
fc406c33:	02141113          	slli	sp,s0,0x21
fc406c37:	0215                	addi	tp,tp,5
fc406c39:	04190217          	auipc	tp,0x4190
fc406c3d:	051c                	addi	a5,sp,640
fc406c3f:	081d                	addi	a6,a6,7
fc406c41:	0124                	addi	s1,sp,136
fc406c43:	036a                	slli	t1,t1,0x1a
fc406c45:	02bc026b          	0x2bc026b
fc406c49:	02d1                	addi	t0,t0,20
fc406c4b:	0cd4                	addi	a3,sp,596
fc406c4d:	09d5                	addi	s3,s3,21
fc406c4f:	02d6                	slli	t0,t0,0x15
fc406c51:	01da02d7          	0x1da02d7
fc406c55:	05e0                	addi	s0,sp,716
fc406c57:	02e1                	addi	t0,t0,24
fc406c59:	02e8                	addi	a0,sp,332
fc406c5b:	20ee                	fld	ft1,216(sp)
fc406c5d:	04f0                	addi	a2,sp,588
fc406c5f:	06f9                	addi	a3,a3,30
fc406c61:	02fa                	slli	t0,t0,0x1e

fc406c63 <anon.fe7732283a7f5a795c6169f6eb5e8c98.43.llvm.7276170047363281110>:
fc406c63:	270c                	fld	fa1,8(a4)
fc406c65:	4f4e3e3b          	0x4f4e3e3b
fc406c69:	9f9e9e8f          	0x9f9e9e8f
fc406c6d:	0706                	slli	a4,a4,0x1
fc406c6f:	3609                	jal	fc406771 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.4+0x5e>
fc406c71:	3e3d                	jal	fc4067af <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.15+0x13>
fc406c73:	f356                	fsw	fs5,164(sp)
fc406c75:	d1d0                	sw	a2,36(a1)
fc406c77:	1404                	addi	s1,sp,544
fc406c79:	3618                	fld	fa4,40(a2)
fc406c7b:	bd575637          	lui	a2,0xbd575
fc406c7f:	ce35                	beqz	a2,fc406cfb <anon.fe7732283a7f5a795c6169f6eb5e8c98.43.llvm.7276170047363281110+0x98>
fc406c81:	8712e0cf          	fnmadd.q	ft1,ft5,fa7,fa6,unknown
fc406c85:	8e89                	sub	a3,a3,a0
fc406c87:	049e                	slli	s1,s1,0x7
fc406c89:	0e0d                	addi	t3,t3,3
fc406c8b:	1211                	addi	tp,tp,-28
fc406c8d:	3129                	jal	fc406897 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.24+0xb>
fc406c8f:	3a34                	fld	fa3,112(a2)
fc406c91:	4645                	li	a2,17
fc406c93:	4a49                	li	s4,18
fc406c95:	4f4e                	lw	t5,208(sp)
fc406c97:	6564                	flw	fs1,76(a0)
fc406c99:	5c5a                	lw	s8,180(sp)
fc406c9b:	b7b6                	fsd	fa3,488(sp)
fc406c9d:	a9a81c1b          	0xa9a81c1b
fc406ca1:	d9d8                	sw	a4,52(a1)
fc406ca3:	3709                	jal	fc406ba5 <anon.fe7732283a7f5a795c6169f6eb5e8c98.41.llvm.7276170047363281110+0xc2>
fc406ca5:	9190                	0x9190
fc406ca7:	07a8                	addi	a0,sp,968
fc406ca9:	3b0a                	fld	fs6,160(sp)
fc406cab:	663e                	flw	fa2,204(sp)
fc406cad:	8f69                	and	a4,a4,a0
fc406caf:	6f92                	flw	ft11,4(sp)
fc406cb1:	ee5f 5aef 9a62      	0x9a625aefee5f
fc406cb7:	5528279b          	0x5528279b
fc406cbb:	a09d                	j	fc406d21 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0x18>
fc406cbd:	a3a1                	j	fc407205 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.58+0x10d>
fc406cbf:	a7a4                	fsd	fs1,72(a5)
fc406cc1:	ada8                	fsd	fa0,88(a1)
fc406cc3:	bcba                	fsd	fa4,120(sp)
fc406cc5:	06c4                	addi	s1,sp,836
fc406cc7:	1d150c0b          	0x1d150c0b
fc406ccb:	3f3a                	fld	ft10,424(sp)
fc406ccd:	5145                	li	sp,-15
fc406ccf:	a7a6                	fsd	fs1,456(sp)
fc406cd1:	cdcc                	sw	a1,28(a1)
fc406cd3:	07a0                	addi	s0,sp,968
fc406cd5:	1a19                	addi	s4,s4,-26
fc406cd7:	2522                	fld	fa0,8(sp)
fc406cd9:	3f3e                	fld	ft10,488(sp)
fc406cdb:	c6c5                	beqz	a3,fc406d83 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0x7a>
fc406cdd:	2004                	fld	fs1,0(s0)
fc406cdf:	28262523          	sw	sp,650(a2) # bd57528a <ebss+0xc11561ea>
fc406ce3:	483a3833          	0x483a3833
fc406ce7:	4c4a                	lw	s8,144(sp)
fc406ce9:	5350                	lw	a2,36(a4)
fc406ceb:	5655                	li	a2,-11
fc406ced:	5a58                	lw	a4,52(a2)
fc406cef:	5e5c                	lw	a5,60(a2)
fc406cf1:	6360                	flw	fs0,68(a4)
fc406cf3:	6665                	lui	a2,0x19
fc406cf5:	7d78736b          	0x7d78736b
fc406cf9:	8a7f                	0x8a7f
fc406cfb:	aaa4                	fsd	fs1,80(a3)
fc406cfd:	d0c0b0af          	0xd0c0b0af
fc406d01:	720c                	flw	fa1,32(a2)
fc406d03:	cccba4a3          	sw	a2,-823(s7)
fc406d07:	6f6e                	flw	ft10,216(sp)

fc406d09 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110>:
fc406d09:	225e                	fld	ft4,464(sp)
fc406d0b:	0403057b          	0x403057b
fc406d0f:	032d                	addi	t1,t1,11
fc406d11:	0465                	addi	s0,s0,25
fc406d13:	2f01                	jal	fc407423 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.59+0x12b>
fc406d15:	802e                	c.mv	zero,a1
fc406d17:	1d82                	slli	s11,s11,0x20
fc406d19:	1c0f3103          	0x1c0f3103
fc406d1d:	2404                	fld	fs1,8(s0)
fc406d1f:	1e09                	addi	t3,t3,-30
fc406d21:	2b05                	jal	fc407251 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.58+0x159>
fc406d23:	4405                	li	s0,1
fc406d25:	0e04                	addi	s1,sp,784
fc406d27:	802a                	c.mv	zero,a0
fc406d29:	06aa                	slli	a3,a3,0xa
fc406d2b:	0424                	addi	s1,sp,520
fc406d2d:	0424                	addi	s1,sp,520
fc406d2f:	0828                	addi	a0,sp,24
fc406d31:	0b34                	addi	a3,sp,408
fc406d33:	8001                	c.srli64	s0
fc406d35:	8190                	0x8190
fc406d37:	0a160937          	lui	s2,0xa160
fc406d3b:	8008                	0x8008
fc406d3d:	3998                	fld	fa4,48(a1)
fc406d3f:	09086303          	0x9086303
fc406d43:	1630                	addi	a2,sp,808
fc406d45:	2105                	jal	fc407165 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.58+0x6d>
fc406d47:	01051b03          	lh	s6,16(a0) # fe58699e <ebss+0x21678fe>
fc406d4b:	3840                	fld	fs0,176(s0)
fc406d4d:	4b04                	lw	s1,16(a4)
fc406d4f:	2f05                	jal	fc40747f <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.59+0x187>
fc406d51:	0a04                	addi	s1,sp,272
fc406d53:	40070907          	0x40070907
fc406d57:	2720                	fld	fs0,72(a4)
fc406d59:	0c04                	addi	s1,sp,528
fc406d5b:	3609                	jal	fc40685d <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.21+0x5>
fc406d5d:	1a053a03          	0x1a053a03
fc406d61:	070c0407          	0x70c0407
fc406d65:	4950                	lw	a2,20(a0)
fc406d67:	330d3337          	lui	t1,0x330d3
fc406d6b:	0a082e07          	flw	ft8,160(a6)
fc406d6f:	2681                	jal	fc4070af <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0x207>
fc406d71:	801f 2881 2a08      	0x2a082881801f
fc406d77:	8680                	0x8680
fc406d79:	044e0917          	auipc	s2,0x44e0
fc406d7d:	0f1e                	slli	t5,t5,0x7
fc406d7f:	07190e43          	fmadd.q	ft8,fs2,fa7,ft0,rne
fc406d83:	060a                	slli	a2,a2,0x2
fc406d85:	09270947          	fmsub.s	fs2,fa4,fs2,ft1,rne
fc406d89:	0b75                	addi	s6,s6,29
fc406d8b:	062a413f 060a053b 	0x60a053b062a413f
fc406d93:	0651                	addi	a2,a2,20
fc406d95:	0501                	addi	a0,a0,0
fc406d97:	0310                	addi	a2,sp,384
fc406d99:	8005                	srli	s0,s0,0x1
fc406d9b:	4820608b          	0x4820608b
fc406d9f:	0a08                	addi	a0,sp,272
fc406da1:	a680                	fsd	fs0,8(a3)
fc406da3:	225e                	fld	ft4,464(sp)
fc406da5:	0b45                	addi	s6,s6,17
fc406da7:	060a                	slli	a2,a2,0x2
fc406da9:	130d                	addi	t1,t1,-29
fc406dab:	0739                	addi	a4,a4,14
fc406dad:	360a                	fld	fa2,160(sp)
fc406daf:	042c                	addi	a1,sp,520
fc406db1:	8010                	0x8010
fc406db3:	3cc0                	fld	fs0,184(s1)
fc406db5:	5364                	lw	s1,100(a4)
fc406db7:	010c                	addi	a1,sp,128
fc406db9:	a080                	fsd	fs0,0(s1)
fc406dbb:	1b45                	addi	s6,s6,-15
fc406dbd:	0848                	addi	a0,sp,20
fc406dbf:	81391d53          	0x81391d53
fc406dc3:	1d0a4607          	flq	fa2,464(s4)
fc406dc7:	37494703          	lbu	a4,884(s2) # 8e70ed <ebss+0x44c804d>
fc406dcb:	0a080e03          	lb	t3,160(a6)
fc406dcf:	3906                	fld	fs2,96(sp)
fc406dd1:	36810a07          	0x36810a07
fc406dd5:	8019                	srli	s0,s0,0x6
fc406dd7:	830d32c7          	fmsub.d	ft5,fs10,fa6,fa6,rup
fc406ddb:	0b75669b          	0xb75669b
fc406ddf:	c480                	sw	s0,8(s1)
fc406de1:	bc8a                	fsd	ft2,120(sp)
fc406de3:	2f84                	fld	fs1,24(a5)
fc406de5:	4782d18f          	0x4782d18f
fc406de9:	b9a1                	j	fc406a41 <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0x83>
fc406deb:	3982                	fld	fs3,32(sp)
fc406ded:	02042a07          	flw	fs4,32(s0)
fc406df1:	2660                	fld	fs0,200(a2)
fc406df3:	460a                	lw	a2,128(sp)
fc406df5:	280a                	fld	fa6,128(sp)
fc406df7:	1305                	addi	t1,t1,-31
fc406df9:	b082                	fsd	ft0,96(sp)
fc406dfb:	044b655b          	0x44b655b
fc406dff:	0739                	addi	a4,a4,14
fc406e01:	4011                	c.li	zero,4
fc406e03:	1c04                	addi	s1,sp,560
fc406e05:	8208f897          	auipc	a7,0x8208f
fc406e09:	810da5f3          	csrrs	a1,0x810,s11
fc406e0d:	311f 1103 0804      	0x8041103311f
fc406e13:	8c81                	sub	s1,s1,s0
fc406e15:	0489                	addi	s1,s1,2
fc406e17:	030d056b          	0x30d056b
fc406e1b:	0709                	addi	a4,a4,2
fc406e1d:	9310                	0x9310
fc406e1f:	8060                	0x8060
fc406e21:	0af6                	slli	s5,s5,0x1d
fc406e23:	176e0873          	0x176e0873
fc406e27:	8046                	c.mv	zero,a7
fc406e29:	149a                	slli	s1,s1,0x26
fc406e2b:	570c                	lw	a1,40(a4)
fc406e2d:	1909                	addi	s2,s2,-30
fc406e2f:	8780                	0x8780
fc406e31:	4781                	li	a5,0
fc406e33:	0f428503          	lb	a0,244(t0) # ffffd0f4 <ebss+0x3bde054>
fc406e37:	8515                	srai	a0,a0,0x5
fc406e39:	2b50                	fld	fa2,144(a4)
fc406e3b:	d580                	sw	s0,40(a1)
fc406e3d:	032d                	addi	t1,t1,11
fc406e3f:	041a                	slli	s0,s0,0x6
fc406e41:	8102                	jr	sp
fc406e43:	3a70                	fld	fa2,240(a2)
fc406e45:	0105                	addi	sp,sp,1
fc406e47:	0085                	addi	ra,ra,1
fc406e49:	d780                	sw	s0,40(a5)
fc406e4b:	4c29                	li	s8,10
fc406e4d:	0a04                	addi	s1,sp,272
fc406e4f:	0204                	addi	s1,sp,256
fc406e51:	4c441183          	lh	gp,1220(s0)
fc406e55:	803d                	srli	s0,s0,0xf
fc406e57:	3cc2                	fld	fs9,48(sp)
fc406e59:	0106                	slli	sp,sp,0x1
fc406e5b:	5504                	lw	s1,40(a0)
fc406e5d:	1b05                	addi	s6,s6,-31
fc406e5f:	0234                	addi	a3,sp,264
fc406e61:	0e81                	addi	t4,t4,0
fc406e63:	042c                	addi	a1,sp,520
fc406e65:	0c64                	addi	s1,sp,540
fc406e67:	0a56                	slli	s4,s4,0x15
fc406e69:	030d                	addi	t1,t1,3
fc406e6b:	035d                	addi	t1,t1,23
fc406e6d:	393d                	jal	fc406aab <anon.fe7732283a7f5a795c6169f6eb5e8c98.40.llvm.7276170047363281110+0xed>
fc406e6f:	0d1d                	addi	s10,s10,7
fc406e71:	042c                	addi	a1,sp,520
fc406e73:	0709                	addi	a4,a4,2
fc406e75:	0e02                	c.slli64	t3
fc406e77:	8006                	c.mv	zero,ra
fc406e79:	839a                	mv	t2,t1
fc406e7b:	0ad6                	slli	s5,s5,0x15
fc406e7d:	030d                	addi	t1,t1,3
fc406e7f:	0c74050b          	0xc74050b
fc406e83:	0759                	addi	a4,a4,22
fc406e85:	140c                	addi	a1,sp,544
fc406e87:	040c                	addi	a1,sp,512
fc406e89:	0838                	addi	a4,sp,24
fc406e8b:	060a                	slli	a2,a2,0x2
fc406e8d:	0828                	addi	a0,sp,24
fc406e8f:	521e                	lw	tp,228(sp)
fc406e91:	03310377          	0x3310377
fc406e95:	a680                	fsd	fs0,8(a3)
fc406e97:	140c                	addi	a1,sp,544
fc406e99:	0304                	addi	s1,sp,384
fc406e9b:	0305                	addi	t1,t1,1
fc406e9d:	060d                	addi	a2,a2,3
fc406e9f:	6a85                	lui	s5,0x1
fc406ea1:	0000                	unimp
fc406ea3:	0000                	unimp
fc406ea5:	0000                	unimp
	...

fc406ea8 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57>:
fc406ea8:	0000                	unimp
fc406eaa:	fbc0                	fsw	fs0,52(a5)
fc406eac:	00003eef          	jal	t4,fc409eac <edata+0xe94>
fc406eb0:	0000                	unimp
fc406eb2:	0e00                	addi	s0,sp,784
	...
fc406ec0:	0000                	unimp
fc406ec2:	fff8                	fsw	fa4,124(a5)
fc406ec4:	fffffffb          	0xfffffffb
fc406ec8:	00000007          	0x7
fc406ecc:	0000                	unimp
fc406ece:	1400                	addi	s0,sp,544
fc406ed0:	21fe                	fld	ft3,472(sp)
fc406ed2:	00fe                	slli	ra,ra,0x1f
fc406ed4:	000c                	0xc
fc406ed6:	0000                	unimp
fc406ed8:	0002                	c.slli64	zero
fc406eda:	0000                	unimp
fc406edc:	0000                	unimp
fc406ede:	5000                	lw	s0,32(s0)
fc406ee0:	201e                	fld	ft0,448(sp)
fc406ee2:	0080                	addi	s0,sp,64
fc406ee4:	000c                	0xc
fc406ee6:	4000                	lw	s0,0(s0)
fc406ee8:	0006                	c.slli	zero,0x1
fc406eea:	0000                	unimp
fc406eec:	0000                	unimp
fc406eee:	1000                	addi	s0,sp,32
fc406ef0:	3986                	fld	fs3,96(sp)
fc406ef2:	0002                	c.slli64	zero
fc406ef4:	0000                	unimp
fc406ef6:	21be0023          	sb	s11,512(t3)
fc406efa:	0000                	unimp
fc406efc:	000c                	0xc
fc406efe:	fc00                	fsw	fs0,56(s0)
fc406f00:	0002                	c.slli64	zero
fc406f02:	0000                	unimp
fc406f04:	0000                	unimp
fc406f06:	d000                	sw	s0,32(s0)
fc406f08:	201e                	fld	ft0,448(sp)
fc406f0a:	00c0                	addi	s0,sp,68
fc406f0c:	000c                	0xc
fc406f0e:	0000                	unimp
fc406f10:	0004                	0x4
fc406f12:	0000                	unimp
fc406f14:	0000                	unimp
fc406f16:	4000                	lw	s0,0(s0)
fc406f18:	2001                	jal	fc406f18 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.57+0x70>
fc406f1a:	0080                	addi	s0,sp,64
fc406f1c:	0000                	unimp
fc406f1e:	0000                	unimp
fc406f20:	0011                	c.nop	4
fc406f22:	0000                	unimp
fc406f24:	0000                	unimp
fc406f26:	c000                	sw	s0,0(s0)
fc406f28:	3dc1                	jal	fc406df8 <anon.fe7732283a7f5a795c6169f6eb5e8c98.44.llvm.7276170047363281110+0xef>
fc406f2a:	0060                	addi	s0,sp,12
fc406f2c:	000c                	0xc
fc406f2e:	0000                	unimp
fc406f30:	0002                	c.slli64	zero
fc406f32:	0000                	unimp
fc406f34:	0000                	unimp
fc406f36:	9000                	0x9000
fc406f38:	3044                	fld	fs1,160(s0)
fc406f3a:	0060                	addi	s0,sp,12
fc406f3c:	000c                	0xc
fc406f3e:	0000                	unimp
fc406f40:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc406f44:	0000                	unimp
fc406f46:	5800                	lw	s0,48(s0)
fc406f48:	201e                	fld	ft0,448(sp)
fc406f4a:	0080                	addi	s0,sp,64
fc406f4c:	000c                	0xc
fc406f4e:	0000                	unimp
fc406f50:	8400                	0x8400
fc406f52:	805c                	0x805c
	...
fc406f5c:	0000                	unimp
fc406f5e:	07f2                	slli	a5,a5,0x1c
fc406f60:	7f80                	flw	fs0,56(a5)
	...
fc406f6e:	1ff2                	slli	t6,t6,0x3c
fc406f70:	3f00                	fld	fs0,56(a4)
	...
fc406f7a:	0300                	addi	s0,sp,384
fc406f7c:	0000                	unimp
fc406f7e:	02a0                	addi	s0,sp,328
fc406f80:	0000                	unimp
fc406f82:	0000                	unimp
fc406f84:	0000                	unimp
fc406f86:	7ffe                	flw	ft11,252(sp)
fc406f88:	e0df feff ffff      	0xfffffeffe0df
fc406f8e:	1fff                	0x1fff
fc406f90:	0040                	addi	s0,sp,4
	...
fc406f9a:	0000                	unimp
fc406f9c:	e000                	fsw	fs0,0(s0)
fc406f9e:	66fd                	lui	a3,0x1f
fc406fa0:	0000                	unimp
fc406fa2:	c300                	sw	s0,0(a4)
fc406fa4:	0001                	nop
fc406fa6:	001e                	c.slli	zero,0x7
fc406fa8:	2064                	fld	fs1,192(s0)
fc406faa:	2000                	fld	fs0,0(s0)
fc406fac:	0000                	unimp
fc406fae:	0000                	unimp
fc406fb0:	0000                	unimp
fc406fb2:	e000                	fsw	fs0,0(s0)
fc406fb4:	0000                	unimp
fc406fb6:	0000                	unimp
fc406fb8:	0000                	unimp
fc406fba:	001c                	0x1c
fc406fbc:	0000                	unimp
fc406fbe:	001c                	0x1c
fc406fc0:	0000                	unimp
fc406fc2:	000c                	0xc
fc406fc4:	0000                	unimp
fc406fc6:	000c                	0xc
fc406fc8:	0000                	unimp
fc406fca:	0000                	unimp
fc406fcc:	0000                	unimp
fc406fce:	3fb0                	fld	fa2,120(a5)
fc406fd0:	fe40                	fsw	fs0,60(a2)
fc406fd2:	0000200f          	0x200f
fc406fd6:	0000                	unimp
fc406fd8:	3800                	fld	fs0,48(s0)
fc406fda:	0000                	unimp
fc406fdc:	0000                	unimp
fc406fde:	0000                	unimp
fc406fe0:	0060                	addi	s0,sp,12
fc406fe2:	0000                	unimp
fc406fe4:	0200                	addi	s0,sp,256
fc406fe6:	0000                	unimp
fc406fe8:	0000                	unimp
fc406fea:	0000                	unimp
fc406fec:	0e040187          	0xe040187
fc406ff0:	0000                	unimp
fc406ff2:	0980                	addi	s0,sp,208
fc406ff4:	0000                	unimp
fc406ff6:	0000                	unimp
fc406ff8:	0000                	unimp
fc406ffa:	7f40                	flw	fs0,60(a4)
fc406ffc:	1fe5                	addi	t6,t6,-7
fc406ffe:	9ff8                	0x9ff8
fc407000:	0000                	unimp
fc407002:	0000                	unimp
fc407004:	0000                	unimp
fc407006:	7fff                	0x7fff
fc407008:	0000000f          	fence	unknown,unknown
fc40700c:	0000                	unimp
fc40700e:	17f0                	addi	a2,sp,1004
fc407010:	0004                	0x4
fc407012:	0000                	unimp
fc407014:	f800                	fsw	fs0,48(s0)
fc407016:	0003000f          	0x3000f
fc40701a:	0000                	unimp
fc40701c:	3b3c                	fld	fa5,112(a4)
fc40701e:	0000                	unimp
fc407020:	0000                	unimp
fc407022:	0000                	unimp
fc407024:	a340                	fsd	fs0,128(a4)
fc407026:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc40702a:	0000                	unimp
fc40702c:	f000                	fsw	fs0,32(s0)
fc40702e:	000000cf          	fnmadd.s	ft1,ft0,ft0,ft0,rne
fc407032:	21fdfff7          	0x21fdfff7
fc407036:	0310                	addi	a2,sp,384
fc407038:	ffff                	0xffff
fc40703a:	ffff                	0xffff
fc40703c:	ffff                	0xffff
fc40703e:	fbff                	0xfbff
fc407040:	1000                	addi	s0,sp,32
	...
fc40704a:	ffff                	0xffff
fc40704c:	ffff                	0xffff
fc40704e:	0001                	nop
fc407050:	0000                	unimp
fc407052:	0000                	unimp
fc407054:	8000                	0x8000
fc407056:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc40705a:	0000                	unimp
fc40705c:	0000                	unimp
fc40705e:	8000                	0x8000
fc407060:	0000                	unimp
fc407062:	0000                	unimp
fc407064:	ffff                	0xffff
fc407066:	ffff                	0xffff
fc407068:	0000                	unimp
fc40706a:	0000                	unimp
fc40706c:	fc00                	fsw	fs0,56(s0)
fc40706e:	0000                	unimp
fc407070:	0000                	unimp
fc407072:	0600                	addi	s0,sp,768
	...
fc40707c:	8000                	0x8000
fc40707e:	00003ff7          	0x3ff7
fc407082:	c000                	sw	s0,0(s0)
	...
fc40708c:	0000                	unimp
fc40708e:	08440003          	lb	zero,132(s0)
fc407092:	0000                	unimp
fc407094:	0060                	addi	s0,sp,12
fc407096:	0000                	unimp
fc407098:	0030                	addi	a2,sp,8
fc40709a:	0000                	unimp
fc40709c:	ffff                	0xffff
fc40709e:	00008003          	lb	zero,0(ra)
fc4070a2:	0000                	unimp
fc4070a4:	3fc0                	fld	fs0,184(a5)
fc4070a6:	0000                	unimp
fc4070a8:	ff80                	fsw	fs0,56(a5)
fc4070aa:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc4070ae:	0000                	unimp
fc4070b0:	00000007          	0x7
fc4070b4:	0000                	unimp
fc4070b6:	33c8                	fld	fa0,160(a5)
fc4070b8:	0000                	unimp
fc4070ba:	0000                	unimp
fc4070bc:	0020                	addi	s0,sp,8
fc4070be:	0000                	unimp
fc4070c0:	0000                	unimp
fc4070c2:	0000                	unimp
fc4070c4:	7e00                	flw	fs0,56(a2)
fc4070c6:	0066                	c.slli	zero,0x19
fc4070c8:	1008                	addi	a0,sp,32
fc4070ca:	0000                	unimp
fc4070cc:	0000                	unimp
fc4070ce:	1000                	addi	s0,sp,32
fc4070d0:	0000                	unimp
fc4070d2:	0000                	unimp
fc4070d4:	0000                	unimp
fc4070d6:	c19d                	beqz	a1,fc4070fc <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.58+0x4>
fc4070d8:	0002                	c.slli64	zero
fc4070da:	0000                	unimp
fc4070dc:	3000                	fld	fs0,32(s0)
fc4070de:	0040                	addi	s0,sp,4
fc4070e0:	0000                	unimp
fc4070e2:	0000                	unimp
fc4070e4:	2120                	fld	fs0,64(a0)
fc4070e6:	0000                	unimp
fc4070e8:	0000                	unimp
fc4070ea:	4000                	lw	s0,0(s0)
fc4070ec:	0000                	unimp
fc4070ee:	0000                	unimp
fc4070f0:	ffff                	0xffff
fc4070f2:	0000                	unimp
fc4070f4:	ffff                	0xffff
	...

fc4070f8 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.58>:
fc4070f8:	0000                	unimp
fc4070fa:	0000                	unimp
fc4070fc:	0000                	unimp
fc4070fe:	0100                	addi	s0,sp,128
fc407100:	0000                	unimp
fc407102:	0200                	addi	s0,sp,256
fc407104:	0300                	addi	s0,sp,384
	...
fc40711e:	0000                	unimp
fc407120:	0004                	0x4
fc407122:	0500                	addi	s0,sp,640
	...
fc40712c:	0006                	c.slli	zero,0x1
fc40712e:	0000                	unimp
fc407130:	0000                	unimp
fc407132:	0000                	unimp
fc407134:	0700                	addi	s0,sp,896
fc407136:	0000                	unimp
fc407138:	0908                	addi	a0,sp,144
fc40713a:	000a                	c.slli	zero,0x2
fc40713c:	0e0d0c0b          	0xe0d0c0b
fc407140:	1000000f          	0x1000000f
fc407144:	1211                	addi	tp,tp,-28
fc407146:	0000                	unimp
fc407148:	16151413          	0x16151413
fc40714c:	0000                	unimp
fc40714e:	1a191817          	auipc	a6,0x1a191
fc407152:	001c001b          	0x1c001b
fc407156:	0000                	unimp
fc407158:	001d                	c.nop	7
fc40715a:	0000                	unimp
fc40715c:	0000                	unimp
fc40715e:	1e00                	addi	s0,sp,816
fc407160:	201f 0021 0000      	0x21201f
fc407166:	0000                	unimp
fc407168:	0022                	c.slli	zero,0x8
fc40716a:	25240023          	sb	s2,576(s0)
fc40716e:	0026                	c.slli	zero,0x9
fc407170:	0000                	unimp
fc407172:	2700                	fld	fs0,8(a4)
	...
fc4071e0:	0000                	unimp
fc4071e2:	2800                	fld	fs0,16(s0)
fc4071e4:	0029                	c.nop	10
	...
fc4071f2:	0000                	unimp
fc4071f4:	2a00                	fld	fs0,16(a2)
fc4071f6:	0000002b          	0x2b
	...
fc40722a:	002c                	addi	a1,sp,8
	...
fc40723c:	2d00                	fld	fs0,24(a0)
fc40723e:	002e                	c.slli	zero,0xb
fc407240:	2f00                	fld	fs0,24(a4)
	...
fc40725e:	0000                	unimp
fc407260:	3130                	fld	fa2,96(a0)
fc407262:	0032                	c.slli	zero,0xc
	...
fc407278:	00000033          	add	zero,zero,zero
fc40727c:	0029                	c.nop	10
fc40727e:	0000                	unimp
fc407280:	0000                	unimp
fc407282:	3400                	fld	fs0,40(s0)
	...
fc407298:	0000                	unimp
fc40729a:	3500                	fld	fs0,40(a0)
fc40729c:	3600                	fld	fs0,40(a2)
	...
fc4072b6:	0000                	unimp
fc4072b8:	00003837          	lui	a6,0x3
fc4072bc:	3838                	fld	fa4,112(s0)
fc4072be:	3938                	fld	fa4,112(a0)
	...

fc4072f8 <.Lanon.fe7732283a7f5a795c6169f6eb5e8c98.59>:
	...
fc407304:	0000                	unimp
fc407306:	2000                	fld	fs0,0(s0)
fc407308:	0000                	unimp
fc40730a:	0000                	unimp
fc40730c:	0001                	nop
	...
fc407316:	07c0                	addi	s0,sp,964
fc407318:	f06e                	fsw	fs11,32(sp)
fc40731a:	0000                	unimp
fc40731c:	0000                	unimp
fc40731e:	8700                	0x8700
fc407320:	0000                	unimp
fc407322:	0000                	unimp
fc407324:	0060                	addi	s0,sp,12
fc407326:	0000                	unimp
fc407328:	0000                	unimp
fc40732a:	0000                	unimp
fc40732c:	00f0                	addi	a2,sp,76
fc40732e:	0000                	unimp
fc407330:	ffc0                	fsw	fs0,60(a5)
fc407332:	0001                	nop
fc407334:	0000                	unimp
fc407336:	0000                	unimp
fc407338:	0002                	c.slli64	zero
fc40733a:	0000                	unimp
fc40733c:	0000                	unimp
fc40733e:	ff00                	fsw	fs0,56(a4)
fc407340:	007f                	0x7f
fc407342:	0000                	unimp
fc407344:	0000                	unimp
fc407346:	8000                	0x8000
fc407348:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc40734c:	0000                	unimp
fc40734e:	0678                	addi	a4,sp,780
fc407350:	00000007          	0x7
fc407354:	ef80                	fsw	fs0,24(a5)
fc407356:	001f 0000 0000      	0x1f
fc40735c:	0000                	unimp
fc40735e:	0008                	0x8
fc407360:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407364:	0000                	unimp
fc407366:	7fc0                	flw	fs0,60(a5)
fc407368:	1e00                	addi	s0,sp,816
	...
fc407372:	0000                	unimp
fc407374:	8000                	0x8000
fc407376:	000040d3          	fadd.s	ft1,ft0,ft0,rmm
fc40737a:	8000                	0x8000
fc40737c:	07f8                	addi	a4,sp,972
fc40737e:	0000                	unimp
fc407380:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407384:	0000                	unimp
fc407386:	5800                	lw	s0,48(s0)
fc407388:	0001                	nop
fc40738a:	0080                	addi	s0,sp,64
fc40738c:	1fc0                	addi	s0,sp,1012
fc40738e:	001f 0000 0000      	0x1f
fc407394:	0000                	unimp
fc407396:	ff00                	fsw	fs0,56(a4)
fc407398:	005c                	addi	a5,sp,4
fc40739a:	4000                	lw	s0,0(s0)
	...
fc4073a4:	0000                	unimp
fc4073a6:	a5f9                	j	fc407a74 <anon.fe7732283a7f5a795c6169f6eb5e8c98.60.llvm.7276170047363281110+0x5ac>
fc4073a8:	000d                	c.nop	3
	...
fc4073b2:	0000                	unimp
fc4073b4:	8000                	0x8000
fc4073b6:	b03c                	fsd	fa5,96(s0)
fc4073b8:	0001                	nop
fc4073ba:	3000                	fld	fs0,32(s0)
	...
fc4073c4:	0000                	unimp
fc4073c6:	a7f8                	fsd	fa4,200(a5)
fc4073c8:	0001                	nop
	...
fc4073d2:	0000                	unimp
fc4073d4:	2800                	fld	fs0,16(s0)
fc4073d6:	000000bf 0fbce000 	0xfbce000000000bf
fc4073de:	0000                	unimp
fc4073e0:	0000                	unimp
fc4073e2:	0000                	unimp
fc4073e4:	8000                	0x8000
fc4073e6:	06ff                	0x6ff
fc4073e8:	0000                	unimp
fc4073ea:	0cf0                	addi	a2,sp,604
fc4073ec:	0001                	nop
fc4073ee:	0000                	unimp
fc4073f0:	07fe                	slli	a5,a5,0x1f
fc4073f2:	0000                	unimp
fc4073f4:	0000                	unimp
fc4073f6:	79f8                	flw	fa4,116(a1)
fc4073f8:	0080                	addi	s0,sp,64
fc4073fa:	0e7e                	slli	t3,t3,0x1f
fc4073fc:	0000                	unimp
fc4073fe:	0000                	unimp
fc407400:	fc00                	fsw	fs0,56(s0)
fc407402:	037f                	0x37f
	...
fc40740c:	0000                	unimp
fc40740e:	bf7f                	0xbf7f
fc407410:	0000                	unimp
fc407412:	fffc                	fsw	fa5,124(a5)
fc407414:	fcff                	0xfcff
fc407416:	006d                	c.nop	27
fc407418:	0000                	unimp
fc40741a:	0000                	unimp
fc40741c:	0000                	unimp
fc40741e:	b47e                	fsd	ft11,40(sp)
fc407420:	000000bf 00000000 	0xbf
fc407428:	0000                	unimp
fc40742a:	000000a3          	sb	zero,1(zero) # 1 <XLENB-0x3>
	...
fc407436:	0018                	0x18
fc407438:	0000                	unimp
fc40743a:	0000                	unimp
fc40743c:	0000                	unimp
fc40743e:	001f 0000 0000      	0x1f
fc407444:	0000                	unimp
fc407446:	007f                	0x7f
fc407448:	8000                	0x8000
fc40744a:	0000                	unimp
fc40744c:	0000                	unimp
fc40744e:	0000                	unimp
fc407450:	8000                	0x8000
fc407452:	00000007          	0x7
fc407456:	0000                	unimp
fc407458:	0000                	unimp
fc40745a:	6000                	flw	fs0,0(s0)
	...
fc407464:	c3a0                	sw	s0,64(a5)
fc407466:	0fe7f807          	0xfe7f807
fc40746a:	0000                	unimp
fc40746c:	3c00                	fld	fs0,56(s0)
fc40746e:	0000                	unimp
fc407470:	001c                	0x1c
fc407472:	0000                	unimp
fc407474:	0000                	unimp
fc407476:	0000                	unimp
fc407478:	ffff                	0xffff
fc40747a:	ffff                	0xffff
fc40747c:	ffff                	0xffff
fc40747e:	f87f                	0xf87f
fc407480:	ffff                	0xffff
fc407482:	ffff                	0xffff
fc407484:	1fff                	0x1fff
fc407486:	0020                	addi	s0,sp,8
fc407488:	0010                	0x10
fc40748a:	f800                	fsw	fs0,48(s0)
fc40748c:	fffe                	fsw	ft11,252(sp)
fc40748e:	0000                	unimp
fc407490:	ff7f                	0xff7f
fc407492:	f9ff                	0xf9ff
fc407494:	000007db          	0x7db
fc407498:	0000                	unimp
fc40749a:	0000                	unimp
fc40749c:	f000                	fsw	fs0,32(s0)
fc40749e:	0000                	unimp
fc4074a0:	0000                	unimp
fc4074a2:	007f                	0x7f
fc4074a4:	0000                	unimp
fc4074a6:	0000                	unimp
fc4074a8:	07f0                	addi	a2,sp,972
	...
fc4074b2:	0000                	unimp
fc4074b4:	ffff                	0xffff
fc4074b6:	ffff                	0xffff
fc4074b8:	ffff                	0xffff
fc4074ba:	ffff                	0xffff
fc4074bc:	ffff                	0xffff
fc4074be:	ffff                	0xffff
fc4074c0:	ffff                	0xffff
fc4074c2:	ffff                	0xffff
fc4074c4:	ffff                	0xffff
	...

fc4074c8 <anon.fe7732283a7f5a795c6169f6eb5e8c98.60.llvm.7276170047363281110>:
	...
fc407528:	ffff                	0xffff
fc40752a:	ffff                	0xffff
fc40752c:	ffff                	0xffff
fc40752e:	ffff                	0xffff
fc407530:	ffff                	0xffff
fc407532:	ffff                	0xffff
fc407534:	ffff                	0xffff
	...
fc407556:	0000                	unimp
fc407558:	03f8                	addi	a4,sp,460
	...
fc40757a:	fffe                	fsw	ft11,252(sp)
fc40757c:	ffff                	0xffff
fc40757e:	bfff                	0xbfff
fc407580:	00b6                	slli	ra,ra,0xd
	...
fc40758a:	07ff                	0x7ff
fc40758c:	0000                	unimp
fc40758e:	0000                	unimp
fc407590:	f800                	fsw	fs0,48(s0)
fc407592:	ffff                	0xffff
fc407594:	0000                	unimp
fc407596:	0001                	nop
	...
fc4075a0:	0000                	unimp
fc4075a2:	9fc0                	0x9fc0
fc4075a4:	3d9f 0000 0000      	0x3d9f
fc4075aa:	0002                	c.slli64	zero
fc4075ac:	0000                	unimp
fc4075ae:	ffff                	0xffff
fc4075b0:	07ff                	0x7ff
	...
fc4075ba:	0000                	unimp
fc4075bc:	ffc0                	fsw	fs0,60(a5)
fc4075be:	0001                	nop
fc4075c0:	0000                	unimp
fc4075c2:	0000                	unimp
fc4075c4:	f800                	fsw	fs0,48(s0)
fc4075c6:	6ea8200f          	0x6ea8200f
fc4075ca:	fc40                	fsw	fs0,60(s0)
fc4075cc:	004a                	c.slli	zero,0x12
fc4075ce:	0000                	unimp
fc4075d0:	70f8                	flw	fa4,100(s1)
fc4075d2:	fc40                	fsw	fs0,60(s0)
fc4075d4:	0200                	addi	s0,sp,256
fc4075d6:	0000                	unimp
fc4075d8:	72f8                	flw	fa4,100(a3)
fc4075da:	fc40                	fsw	fs0,60(s0)
fc4075dc:	003a                	c.slli	zero,0xe
fc4075de:	0000                	unimp
fc4075e0:	0100                	addi	s0,sp,128
fc4075e2:	0302                	c.slli64	t1
fc4075e4:	0504                	addi	s1,sp,640
fc4075e6:	0706                	slli	a4,a4,0x1
fc4075e8:	0908                	addi	a0,sp,144
fc4075ea:	0a08                	addi	a0,sp,272
fc4075ec:	0e0d0c0b          	0xe0d0c0b
fc4075f0:	1211100f          	0x1211100f
fc4075f4:	15021413          	0x15021413
fc4075f8:	1716                	slli	a4,a4,0x25
fc4075fa:	1918                	addi	a4,sp,176
fc4075fc:	1b1a                	slli	s6,s6,0x26
fc4075fe:	1d1c                	addi	a5,sp,688
fc407600:	1f1e                	slli	t5,t5,0x27
fc407602:	0220                	addi	s0,sp,264
fc407604:	0202                	c.slli64	tp
fc407606:	0202                	c.slli64	tp
fc407608:	0202                	c.slli64	tp
fc40760a:	0202                	c.slli64	tp
fc40760c:	2102                	fld	ft2,0(sp)
fc40760e:	0202                	c.slli64	tp
fc407610:	0202                	c.slli64	tp
fc407612:	0202                	c.slli64	tp
fc407614:	0202                	c.slli64	tp
fc407616:	0202                	c.slli64	tp
fc407618:	0202                	c.slli64	tp
fc40761a:	0202                	c.slli64	tp
fc40761c:	2322                	fld	ft6,8(sp)
fc40761e:	2524                	fld	fs1,72(a0)
fc407620:	0226                	slli	tp,tp,0x9
fc407622:	02280227          	0x2280227
fc407626:	0202                	c.slli64	tp
fc407628:	2a29                	jal	fc407742 <anon.fe7732283a7f5a795c6169f6eb5e8c98.60.llvm.7276170047363281110+0x27a>
fc40762a:	2d2c022b          	0x2d2c022b
fc40762e:	2f2e                	fld	ft10,200(sp)
fc407630:	0230                	addi	a2,sp,264
fc407632:	3102                	fld	ft2,32(sp)
fc407634:	0202                	c.slli64	tp
fc407636:	3202                	fld	ft4,32(sp)
fc407638:	0202                	c.slli64	tp
fc40763a:	0202                	c.slli64	tp
fc40763c:	0202                	c.slli64	tp
fc40763e:	0202                	c.slli64	tp
fc407640:	34020233          	0x34020233
fc407644:	0202                	c.slli64	tp
fc407646:	0202                	c.slli64	tp
fc407648:	0202                	c.slli64	tp
fc40764a:	0202                	c.slli64	tp
fc40764c:	0202                	c.slli64	tp
fc40764e:	0202                	c.slli64	tp
fc407650:	0202                	c.slli64	tp
fc407652:	0202                	c.slli64	tp
fc407654:	0202                	c.slli64	tp
fc407656:	0202                	c.slli64	tp
fc407658:	0202                	c.slli64	tp
fc40765a:	0202                	c.slli64	tp
fc40765c:	0202                	c.slli64	tp
fc40765e:	0202                	c.slli64	tp
fc407660:	0202                	c.slli64	tp
fc407662:	0202                	c.slli64	tp
fc407664:	0202                	c.slli64	tp
fc407666:	0202                	c.slli64	tp
fc407668:	0202                	c.slli64	tp
fc40766a:	0202                	c.slli64	tp
fc40766c:	0202                	c.slli64	tp
fc40766e:	0202                	c.slli64	tp
fc407670:	0202                	c.slli64	tp
fc407672:	3502                	fld	fa0,32(sp)
fc407674:	3602                	fld	fa2,32(sp)
fc407676:	3702                	fld	fa4,32(sp)
fc407678:	0202                	c.slli64	tp
fc40767a:	0202                	c.slli64	tp
fc40767c:	0202                	c.slli64	tp
fc40767e:	0202                	c.slli64	tp
fc407680:	0238                	addi	a4,sp,264
fc407682:	0239                	addi	tp,tp,14
fc407684:	0202                	c.slli64	tp
fc407686:	0202                	c.slli64	tp
fc407688:	0202                	c.slli64	tp
fc40768a:	0202                	c.slli64	tp
fc40768c:	0202                	c.slli64	tp
fc40768e:	0202                	c.slli64	tp
fc407690:	0202                	c.slli64	tp
fc407692:	0202                	c.slli64	tp
fc407694:	0202                	c.slli64	tp
fc407696:	0202                	c.slli64	tp
fc407698:	0202                	c.slli64	tp
fc40769a:	0202                	c.slli64	tp
fc40769c:	0202                	c.slli64	tp
fc40769e:	0202                	c.slli64	tp
fc4076a0:	0202                	c.slli64	tp
fc4076a2:	0202                	c.slli64	tp
fc4076a4:	0202                	c.slli64	tp
fc4076a6:	0202                	c.slli64	tp
fc4076a8:	0202                	c.slli64	tp
fc4076aa:	0202                	c.slli64	tp
fc4076ac:	0202                	c.slli64	tp
fc4076ae:	0202                	c.slli64	tp
fc4076b0:	0202                	c.slli64	tp
fc4076b2:	0202                	c.slli64	tp
fc4076b4:	0202                	c.slli64	tp
fc4076b6:	0202                	c.slli64	tp
fc4076b8:	0202                	c.slli64	tp
fc4076ba:	0202                	c.slli64	tp
fc4076bc:	0202                	c.slli64	tp
fc4076be:	0202                	c.slli64	tp
fc4076c0:	0202                	c.slli64	tp
fc4076c2:	0202                	c.slli64	tp
fc4076c4:	0202                	c.slli64	tp
fc4076c6:	0202                	c.slli64	tp
fc4076c8:	0202                	c.slli64	tp
fc4076ca:	0202                	c.slli64	tp
fc4076cc:	0202                	c.slli64	tp
fc4076ce:	0202                	c.slli64	tp
fc4076d0:	0202                	c.slli64	tp
fc4076d2:	0202                	c.slli64	tp
fc4076d4:	0202                	c.slli64	tp
fc4076d6:	0202                	c.slli64	tp
fc4076d8:	0202                	c.slli64	tp
fc4076da:	0202                	c.slli64	tp
fc4076dc:	0202                	c.slli64	tp
fc4076de:	0202                	c.slli64	tp
fc4076e0:	0202                	c.slli64	tp
fc4076e2:	0202                	c.slli64	tp
fc4076e4:	0202                	c.slli64	tp
fc4076e6:	0202                	c.slli64	tp
fc4076e8:	0202                	c.slli64	tp
fc4076ea:	0202                	c.slli64	tp
fc4076ec:	0202                	c.slli64	tp
fc4076ee:	0202                	c.slli64	tp
fc4076f0:	0202                	c.slli64	tp
fc4076f2:	0202                	c.slli64	tp
fc4076f4:	0202                	c.slli64	tp
fc4076f6:	0202                	c.slli64	tp
fc4076f8:	0202                	c.slli64	tp
fc4076fa:	0202                	c.slli64	tp
fc4076fc:	0202                	c.slli64	tp
fc4076fe:	0202                	c.slli64	tp
fc407700:	0202                	c.slli64	tp
fc407702:	0202                	c.slli64	tp
fc407704:	0202                	c.slli64	tp
fc407706:	0202                	c.slli64	tp
fc407708:	0202                	c.slli64	tp
fc40770a:	0202                	c.slli64	tp
fc40770c:	0202                	c.slli64	tp
fc40770e:	0202                	c.slli64	tp
fc407710:	0202                	c.slli64	tp
fc407712:	0202                	c.slli64	tp
fc407714:	0202                	c.slli64	tp
fc407716:	0202                	c.slli64	tp
fc407718:	0202                	c.slli64	tp
fc40771a:	0202                	c.slli64	tp
fc40771c:	0202                	c.slli64	tp
fc40771e:	0202                	c.slli64	tp
fc407720:	0202                	c.slli64	tp
fc407722:	0202                	c.slli64	tp
fc407724:	0202                	c.slli64	tp
fc407726:	0202                	c.slli64	tp
fc407728:	0202                	c.slli64	tp
fc40772a:	0202                	c.slli64	tp
fc40772c:	0202                	c.slli64	tp
fc40772e:	0202                	c.slli64	tp
fc407730:	0202                	c.slli64	tp
fc407732:	0202                	c.slli64	tp
fc407734:	0202                	c.slli64	tp
fc407736:	0202                	c.slli64	tp
fc407738:	0202                	c.slli64	tp
fc40773a:	0202                	c.slli64	tp
fc40773c:	0202                	c.slli64	tp
fc40773e:	0202                	c.slli64	tp
fc407740:	0202                	c.slli64	tp
fc407742:	0202                	c.slli64	tp
fc407744:	0202                	c.slli64	tp
fc407746:	0202                	c.slli64	tp
fc407748:	0202                	c.slli64	tp
fc40774a:	0202                	c.slli64	tp
fc40774c:	0202                	c.slli64	tp
fc40774e:	0202                	c.slli64	tp
fc407750:	0202                	c.slli64	tp
fc407752:	0202                	c.slli64	tp
fc407754:	0202                	c.slli64	tp
fc407756:	0202                	c.slli64	tp
fc407758:	0202                	c.slli64	tp
fc40775a:	0202                	c.slli64	tp
fc40775c:	0202                	c.slli64	tp
fc40775e:	0202                	c.slli64	tp
fc407760:	0202                	c.slli64	tp
fc407762:	0202                	c.slli64	tp
fc407764:	0202                	c.slli64	tp
fc407766:	0202                	c.slli64	tp
fc407768:	0202                	c.slli64	tp
fc40776a:	0202                	c.slli64	tp
fc40776c:	0202                	c.slli64	tp
fc40776e:	0202                	c.slli64	tp
fc407770:	0202                	c.slli64	tp
fc407772:	0202                	c.slli64	tp
fc407774:	0202                	c.slli64	tp
fc407776:	0202                	c.slli64	tp
fc407778:	0202                	c.slli64	tp
fc40777a:	0202                	c.slli64	tp
fc40777c:	0202                	c.slli64	tp
fc40777e:	0202                	c.slli64	tp
fc407780:	0202                	c.slli64	tp
fc407782:	0202                	c.slli64	tp
fc407784:	0202                	c.slli64	tp
fc407786:	0202                	c.slli64	tp
fc407788:	0202                	c.slli64	tp
fc40778a:	0202                	c.slli64	tp
fc40778c:	0202                	c.slli64	tp
fc40778e:	0202                	c.slli64	tp
fc407790:	0202                	c.slli64	tp
fc407792:	0202                	c.slli64	tp
fc407794:	0202                	c.slli64	tp
fc407796:	0202                	c.slli64	tp
fc407798:	0202                	c.slli64	tp
fc40779a:	0202                	c.slli64	tp
fc40779c:	0202                	c.slli64	tp
fc40779e:	0202                	c.slli64	tp
fc4077a0:	0202                	c.slli64	tp
fc4077a2:	0202                	c.slli64	tp
fc4077a4:	0202                	c.slli64	tp
fc4077a6:	0202                	c.slli64	tp
fc4077a8:	0202                	c.slli64	tp
fc4077aa:	0202                	c.slli64	tp
fc4077ac:	0202                	c.slli64	tp
fc4077ae:	0202                	c.slli64	tp
fc4077b0:	0202                	c.slli64	tp
fc4077b2:	0202                	c.slli64	tp
fc4077b4:	0202                	c.slli64	tp
fc4077b6:	0202                	c.slli64	tp
fc4077b8:	0202                	c.slli64	tp
fc4077ba:	0202                	c.slli64	tp
fc4077bc:	0202                	c.slli64	tp
fc4077be:	0202                	c.slli64	tp
fc4077c0:	0202                	c.slli64	tp
fc4077c2:	0202                	c.slli64	tp
fc4077c4:	0202                	c.slli64	tp
fc4077c6:	0202                	c.slli64	tp
fc4077c8:	0202                	c.slli64	tp
fc4077ca:	0202                	c.slli64	tp
fc4077cc:	0202                	c.slli64	tp
fc4077ce:	0202                	c.slli64	tp
fc4077d0:	0202                	c.slli64	tp
fc4077d2:	0202                	c.slli64	tp
fc4077d4:	0202                	c.slli64	tp
fc4077d6:	0202                	c.slli64	tp
fc4077d8:	0202                	c.slli64	tp
fc4077da:	0202                	c.slli64	tp
fc4077dc:	0202                	c.slli64	tp
fc4077de:	0202                	c.slli64	tp
fc4077e0:	0202                	c.slli64	tp
fc4077e2:	0202                	c.slli64	tp
fc4077e4:	0202                	c.slli64	tp
fc4077e6:	0202                	c.slli64	tp
fc4077e8:	0202                	c.slli64	tp
fc4077ea:	0202                	c.slli64	tp
fc4077ec:	0202                	c.slli64	tp
fc4077ee:	0202                	c.slli64	tp
fc4077f0:	0202                	c.slli64	tp
fc4077f2:	0202                	c.slli64	tp
fc4077f4:	0202                	c.slli64	tp
fc4077f6:	0202                	c.slli64	tp
fc4077f8:	0202                	c.slli64	tp
fc4077fa:	0202                	c.slli64	tp
fc4077fc:	0202                	c.slli64	tp
fc4077fe:	0202                	c.slli64	tp
fc407800:	0202                	c.slli64	tp
fc407802:	0202                	c.slli64	tp
fc407804:	0202                	c.slli64	tp
fc407806:	0202                	c.slli64	tp
fc407808:	0202                	c.slli64	tp
fc40780a:	0202                	c.slli64	tp
fc40780c:	0202                	c.slli64	tp
fc40780e:	0202                	c.slli64	tp
fc407810:	0202                	c.slli64	tp
fc407812:	0202                	c.slli64	tp
fc407814:	0202                	c.slli64	tp
fc407816:	0202                	c.slli64	tp
fc407818:	0202                	c.slli64	tp
fc40781a:	0202                	c.slli64	tp
fc40781c:	0202                	c.slli64	tp
fc40781e:	0202                	c.slli64	tp
fc407820:	0202                	c.slli64	tp
fc407822:	0202                	c.slli64	tp
fc407824:	0202                	c.slli64	tp
fc407826:	0202                	c.slli64	tp
fc407828:	0202                	c.slli64	tp
fc40782a:	0202                	c.slli64	tp
fc40782c:	0202                	c.slli64	tp
fc40782e:	0202                	c.slli64	tp
fc407830:	0202                	c.slli64	tp
fc407832:	0202                	c.slli64	tp
fc407834:	0202                	c.slli64	tp
fc407836:	0202                	c.slli64	tp
fc407838:	0202                	c.slli64	tp
fc40783a:	0202                	c.slli64	tp
fc40783c:	0202                	c.slli64	tp
fc40783e:	0202                	c.slli64	tp
fc407840:	0202                	c.slli64	tp
fc407842:	0202                	c.slli64	tp
fc407844:	0202                	c.slli64	tp
fc407846:	0202                	c.slli64	tp
fc407848:	0202                	c.slli64	tp
fc40784a:	0202                	c.slli64	tp
fc40784c:	0202                	c.slli64	tp
fc40784e:	0202                	c.slli64	tp
fc407850:	0202                	c.slli64	tp
fc407852:	0202                	c.slli64	tp
fc407854:	0202                	c.slli64	tp
fc407856:	0202                	c.slli64	tp
fc407858:	3a02                	fld	fs4,32(sp)
fc40785a:	02023c3b          	0x2023c3b
fc40785e:	0202                	c.slli64	tp
fc407860:	023d                	addi	tp,tp,15
fc407862:	3e02                	fld	ft8,32(sp)
fc407864:	4241403f 46454443 	0x464544434241403f
fc40786c:	0202                	c.slli64	tp
fc40786e:	4702                	lw	a4,0(sp)
fc407870:	0202                	c.slli64	tp
fc407872:	0202                	c.slli64	tp
fc407874:	0202                	c.slli64	tp
fc407876:	0202                	c.slli64	tp
fc407878:	0202                	c.slli64	tp
fc40787a:	0202                	c.slli64	tp
fc40787c:	0202                	c.slli64	tp
fc40787e:	0202                	c.slli64	tp
fc407880:	0202                	c.slli64	tp
fc407882:	0202                	c.slli64	tp
fc407884:	0202                	c.slli64	tp
fc407886:	0202                	c.slli64	tp
fc407888:	0202                	c.slli64	tp
fc40788a:	0202                	c.slli64	tp
fc40788c:	0202                	c.slli64	tp
fc40788e:	0202                	c.slli64	tp
fc407890:	0202                	c.slli64	tp
fc407892:	0202                	c.slli64	tp
fc407894:	0202                	c.slli64	tp
fc407896:	0202                	c.slli64	tp
fc407898:	0202                	c.slli64	tp
fc40789a:	0202                	c.slli64	tp
fc40789c:	0202                	c.slli64	tp
fc40789e:	0202                	c.slli64	tp
fc4078a0:	0202                	c.slli64	tp
fc4078a2:	0202                	c.slli64	tp
fc4078a4:	0202                	c.slli64	tp
fc4078a6:	0202                	c.slli64	tp
fc4078a8:	0202                	c.slli64	tp
fc4078aa:	0202                	c.slli64	tp
fc4078ac:	0202                	c.slli64	tp
fc4078ae:	0202                	c.slli64	tp
fc4078b0:	0202                	c.slli64	tp
fc4078b2:	0202                	c.slli64	tp
fc4078b4:	0202                	c.slli64	tp
fc4078b6:	0202                	c.slli64	tp
fc4078b8:	0202                	c.slli64	tp
fc4078ba:	0202                	c.slli64	tp
fc4078bc:	0202                	c.slli64	tp
fc4078be:	0202                	c.slli64	tp
fc4078c0:	0202                	c.slli64	tp
fc4078c2:	0202                	c.slli64	tp
fc4078c4:	0202                	c.slli64	tp
fc4078c6:	0202                	c.slli64	tp
fc4078c8:	0202                	c.slli64	tp
fc4078ca:	0202                	c.slli64	tp
fc4078cc:	0202                	c.slli64	tp
fc4078ce:	0202                	c.slli64	tp
fc4078d0:	0202                	c.slli64	tp
fc4078d2:	0202                	c.slli64	tp
fc4078d4:	0202                	c.slli64	tp
fc4078d6:	0202                	c.slli64	tp
fc4078d8:	0202                	c.slli64	tp
fc4078da:	0202                	c.slli64	tp
fc4078dc:	0202                	c.slli64	tp
fc4078de:	0202                	c.slli64	tp
fc4078e0:	0202                	c.slli64	tp
fc4078e2:	0202                	c.slli64	tp
fc4078e4:	0202                	c.slli64	tp
fc4078e6:	0202                	c.slli64	tp
fc4078e8:	0202                	c.slli64	tp
fc4078ea:	0202                	c.slli64	tp
fc4078ec:	0202                	c.slli64	tp
fc4078ee:	0202                	c.slli64	tp
fc4078f0:	0202                	c.slli64	tp
fc4078f2:	0202                	c.slli64	tp
fc4078f4:	0202                	c.slli64	tp
fc4078f6:	0202                	c.slli64	tp
fc4078f8:	0202                	c.slli64	tp
fc4078fa:	0202                	c.slli64	tp
fc4078fc:	0202                	c.slli64	tp
fc4078fe:	0202                	c.slli64	tp
fc407900:	0202                	c.slli64	tp
fc407902:	0202                	c.slli64	tp
fc407904:	0202                	c.slli64	tp
fc407906:	0202                	c.slli64	tp
fc407908:	0202                	c.slli64	tp
fc40790a:	0202                	c.slli64	tp
fc40790c:	0202                	c.slli64	tp
fc40790e:	0202                	c.slli64	tp
fc407910:	0202                	c.slli64	tp
fc407912:	0202                	c.slli64	tp
fc407914:	0202                	c.slli64	tp
fc407916:	0202                	c.slli64	tp
fc407918:	0202                	c.slli64	tp
fc40791a:	0202                	c.slli64	tp
fc40791c:	0202                	c.slli64	tp
fc40791e:	0202                	c.slli64	tp
fc407920:	0202                	c.slli64	tp
fc407922:	0202                	c.slli64	tp
fc407924:	0202                	c.slli64	tp
fc407926:	0202                	c.slli64	tp
fc407928:	0202                	c.slli64	tp
fc40792a:	0202                	c.slli64	tp
fc40792c:	0202                	c.slli64	tp
fc40792e:	0202                	c.slli64	tp
fc407930:	0202                	c.slli64	tp
fc407932:	0202                	c.slli64	tp
fc407934:	0202                	c.slli64	tp
fc407936:	0202                	c.slli64	tp
fc407938:	0202                	c.slli64	tp
fc40793a:	0202                	c.slli64	tp
fc40793c:	0202                	c.slli64	tp
fc40793e:	0202                	c.slli64	tp
fc407940:	0202                	c.slli64	tp
fc407942:	0202                	c.slli64	tp
fc407944:	0202                	c.slli64	tp
fc407946:	0202                	c.slli64	tp
fc407948:	0202                	c.slli64	tp
fc40794a:	0202                	c.slli64	tp
fc40794c:	0202                	c.slli64	tp
fc40794e:	0202                	c.slli64	tp
fc407950:	0202                	c.slli64	tp
fc407952:	0202                	c.slli64	tp
fc407954:	0202                	c.slli64	tp
fc407956:	0202                	c.slli64	tp
fc407958:	0202                	c.slli64	tp
fc40795a:	0202                	c.slli64	tp
fc40795c:	0202                	c.slli64	tp
fc40795e:	0202                	c.slli64	tp
fc407960:	0202                	c.slli64	tp
fc407962:	0202                	c.slli64	tp
fc407964:	0202                	c.slli64	tp
fc407966:	0202                	c.slli64	tp
fc407968:	0202                	c.slli64	tp
fc40796a:	0202                	c.slli64	tp
fc40796c:	0202                	c.slli64	tp
fc40796e:	0202                	c.slli64	tp
fc407970:	0202                	c.slli64	tp
fc407972:	0202                	c.slli64	tp
fc407974:	0202                	c.slli64	tp
fc407976:	0202                	c.slli64	tp
fc407978:	0202                	c.slli64	tp
fc40797a:	0202                	c.slli64	tp
fc40797c:	0202                	c.slli64	tp
fc40797e:	0202                	c.slli64	tp
fc407980:	0202                	c.slli64	tp
fc407982:	0202                	c.slli64	tp
fc407984:	0202                	c.slli64	tp
fc407986:	0202                	c.slli64	tp
fc407988:	0202                	c.slli64	tp
fc40798a:	0202                	c.slli64	tp
fc40798c:	0202                	c.slli64	tp
fc40798e:	0202                	c.slli64	tp
fc407990:	0202                	c.slli64	tp
fc407992:	0202                	c.slli64	tp
fc407994:	0202                	c.slli64	tp
fc407996:	0202                	c.slli64	tp
fc407998:	0202                	c.slli64	tp
fc40799a:	0202                	c.slli64	tp
fc40799c:	0202                	c.slli64	tp
fc40799e:	0202                	c.slli64	tp
fc4079a0:	0202                	c.slli64	tp
fc4079a2:	0202                	c.slli64	tp
fc4079a4:	0202                	c.slli64	tp
fc4079a6:	0202                	c.slli64	tp
fc4079a8:	0202                	c.slli64	tp
fc4079aa:	0202                	c.slli64	tp
fc4079ac:	0248                	addi	a0,sp,260
fc4079ae:	0202                	c.slli64	tp
fc4079b0:	0202                	c.slli64	tp
fc4079b2:	0202                	c.slli64	tp
fc4079b4:	0202                	c.slli64	tp
fc4079b6:	0202                	c.slli64	tp
fc4079b8:	0249                	addi	tp,tp,18
fc4079ba:	0202                	c.slli64	tp
fc4079bc:	0202                	c.slli64	tp
fc4079be:	0100023b          	0x100023b
fc4079c2:	0202                	c.slli64	tp
fc4079c4:	0202                	c.slli64	tp
fc4079c6:	02020203          	lb	tp,32(tp) # 596c59 <ebss+0x4177bb9>
fc4079ca:	0402                	c.slli64	s0
fc4079cc:	0502                	c.slli64	a0
fc4079ce:	0206                	slli	tp,tp,0x1
fc4079d0:	0202                	c.slli64	tp
fc4079d2:	0202                	c.slli64	tp
fc4079d4:	0202                	c.slli64	tp
fc4079d6:	0202                	c.slli64	tp
fc4079d8:	0202                	c.slli64	tp
fc4079da:	0202                	c.slli64	tp
fc4079dc:	0202                	c.slli64	tp
fc4079de:	0202                	c.slli64	tp
fc4079e0:	0202                	c.slli64	tp
fc4079e2:	0202                	c.slli64	tp
fc4079e4:	0202                	c.slli64	tp
fc4079e6:	0202                	c.slli64	tp
fc4079e8:	0202                	c.slli64	tp
fc4079ea:	0202                	c.slli64	tp
fc4079ec:	0202                	c.slli64	tp
fc4079ee:	0202                	c.slli64	tp
fc4079f0:	0202                	c.slli64	tp
fc4079f2:	0202                	c.slli64	tp
fc4079f4:	0202                	c.slli64	tp
fc4079f6:	0202                	c.slli64	tp
fc4079f8:	0202                	c.slli64	tp
fc4079fa:	0202                	c.slli64	tp
fc4079fc:	0202                	c.slli64	tp
fc4079fe:	0202                	c.slli64	tp
fc407a00:	0202                	c.slli64	tp
fc407a02:	0202                	c.slli64	tp
fc407a04:	0202                	c.slli64	tp
fc407a06:	0202                	c.slli64	tp
fc407a08:	0202                	c.slli64	tp
fc407a0a:	0202                	c.slli64	tp
fc407a0c:	0202                	c.slli64	tp
fc407a0e:	0202                	c.slli64	tp
fc407a10:	0202                	c.slli64	tp
fc407a12:	0202                	c.slli64	tp
fc407a14:	0202                	c.slli64	tp
fc407a16:	0202                	c.slli64	tp
fc407a18:	0202                	c.slli64	tp
fc407a1a:	0202                	c.slli64	tp
fc407a1c:	0202                	c.slli64	tp
fc407a1e:	0202                	c.slli64	tp
fc407a20:	0202                	c.slli64	tp
fc407a22:	0202                	c.slli64	tp
fc407a24:	0202                	c.slli64	tp
fc407a26:	0202                	c.slli64	tp
fc407a28:	0202                	c.slli64	tp
fc407a2a:	0202                	c.slli64	tp
fc407a2c:	0202                	c.slli64	tp
fc407a2e:	0202                	c.slli64	tp
fc407a30:	0202                	c.slli64	tp
fc407a32:	0202                	c.slli64	tp
fc407a34:	0202                	c.slli64	tp
fc407a36:	0202                	c.slli64	tp
fc407a38:	0202                	c.slli64	tp
fc407a3a:	0202                	c.slli64	tp
fc407a3c:	0202                	c.slli64	tp
fc407a3e:	0202                	c.slli64	tp
fc407a40:	0202                	c.slli64	tp
fc407a42:	0202                	c.slli64	tp
fc407a44:	0202                	c.slli64	tp
fc407a46:	0202                	c.slli64	tp
fc407a48:	0202                	c.slli64	tp
fc407a4a:	0202                	c.slli64	tp
fc407a4c:	0202                	c.slli64	tp
fc407a4e:	0202                	c.slli64	tp
fc407a50:	0202                	c.slli64	tp
fc407a52:	0202                	c.slli64	tp
fc407a54:	0202                	c.slli64	tp
fc407a56:	0202                	c.slli64	tp
fc407a58:	0202                	c.slli64	tp
fc407a5a:	0202                	c.slli64	tp
fc407a5c:	0202                	c.slli64	tp
fc407a5e:	0202                	c.slli64	tp
fc407a60:	0202                	c.slli64	tp
fc407a62:	0202                	c.slli64	tp
fc407a64:	0202                	c.slli64	tp
fc407a66:	0202                	c.slli64	tp
fc407a68:	0202                	c.slli64	tp
fc407a6a:	0202                	c.slli64	tp
fc407a6c:	0202                	c.slli64	tp
fc407a6e:	0202                	c.slli64	tp
fc407a70:	0202                	c.slli64	tp
fc407a72:	0202                	c.slli64	tp
fc407a74:	0202                	c.slli64	tp
fc407a76:	0202                	c.slli64	tp
fc407a78:	0202                	c.slli64	tp
fc407a7a:	0202                	c.slli64	tp
fc407a7c:	0202                	c.slli64	tp
fc407a7e:	0202                	c.slli64	tp
fc407a80:	0202                	c.slli64	tp
fc407a82:	0202                	c.slli64	tp
fc407a84:	0202                	c.slli64	tp
fc407a86:	0202                	c.slli64	tp
fc407a88:	0202                	c.slli64	tp
fc407a8a:	0202                	c.slli64	tp
fc407a8c:	0202                	c.slli64	tp
fc407a8e:	0202                	c.slli64	tp
fc407a90:	02020207          	0x2020207
fc407a94:	0202                	c.slli64	tp
fc407a96:	0202                	c.slli64	tp
fc407a98:	0202                	c.slli64	tp
fc407a9a:	0202                	c.slli64	tp
fc407a9c:	0202                	c.slli64	tp
fc407a9e:	0202                	c.slli64	tp
fc407aa0:	0202                	c.slli64	tp
fc407aa2:	0202                	c.slli64	tp
fc407aa4:	0202                	c.slli64	tp
fc407aa6:	0202                	c.slli64	tp
fc407aa8:	0202                	c.slli64	tp
fc407aaa:	0202                	c.slli64	tp
fc407aac:	0202                	c.slli64	tp
fc407aae:	0202                	c.slli64	tp
fc407ab0:	0202                	c.slli64	tp
fc407ab2:	0202                	c.slli64	tp
fc407ab4:	0202                	c.slli64	tp
fc407ab6:	0202                	c.slli64	tp
fc407ab8:	0202                	c.slli64	tp
fc407aba:	0202                	c.slli64	tp
fc407abc:	0202                	c.slli64	tp
fc407abe:	0202                	c.slli64	tp

fc407ac0 <.Lanon.0108a7b659b8977746eaecbcc16bb0c0.6>:
fc407ac0:	6c6c6163          	bltu	s8,t1,fc408182 <.Lanon.95835b6de2449355779ba99954b1fc99.2+0xe>
fc407ac4:	6465                	lui	s0,0x19
fc407ac6:	6020                	flw	fs0,64(s0)
fc407ac8:	6974704f          	fnmadd.s	ft0,fs0,fs7,fa3
fc407acc:	3a3a6e6f          	jal	t3,fc4ae66e <ebss+0x8f5ce>
fc407ad0:	6e75                	lui	t3,0x1d
fc407ad2:	70617277          	0x70617277
fc407ad6:	2928                	fld	fa0,80(a0)
fc407ad8:	2060                	fld	fs0,192(s0)
fc407ada:	61206e6f          	jal	t3,fc40e0ec <bootstacktop+0xec>
fc407ade:	6020                	flw	fs0,64(s0)
fc407ae0:	6f4e                	flw	ft10,208(sp)
fc407ae2:	656e                	flw	fa0,216(sp)
fc407ae4:	2060                	fld	fs0,192(s0)
fc407ae6:	6176                	flw	ft2,92(sp)
fc407ae8:	756c                	flw	fa1,108(a0)
fc407aea:	                	jal	fc4082a2 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x116>

fc407aeb <.Lanon.0108a7b659b8977746eaecbcc16bb0c0.7>:
fc407aeb:	6d6f682f          	0x6d6f682f
fc407aef:	2f65                	jal	fc4082a7 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x11b>
fc407af1:	6166                	flw	ft2,88(sp)
fc407af3:	7a6e                	flw	fs4,248(sp)
fc407af5:	6968                	flw	fa0,84(a0)
fc407af7:	6570                	flw	fa2,76(a0)
fc407af9:	676e                	flw	fa4,216(sp)
fc407afb:	75722e2f          	0x75722e2f
fc407aff:	70757473          	csrrci	s0,0x707,10
fc407b03:	6f6f742f          	0x6f6f742f
fc407b07:	636c                	flw	fa1,68(a4)
fc407b09:	6168                	flw	fa0,68(a0)
fc407b0b:	6e69                	lui	t3,0x1a
fc407b0d:	696e2f73          	csrrs	t5,0x696,t3
fc407b11:	6c746867          	0x6c746867
fc407b15:	2d79                	jal	fc4081b3 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x27>
fc407b17:	3878                	fld	fa4,240(s0)
fc407b19:	5f36                	lw	t5,108(sp)
fc407b1b:	3436                	fld	fs0,360(sp)
fc407b1d:	752d                	lui	a0,0xfffeb
fc407b1f:	6b6e                	flw	fs6,216(sp)
fc407b21:	6f6e                	flw	ft10,216(sp)
fc407b23:	6c2d6e77          	0x6c2d6e77
fc407b27:	6e69                	lui	t3,0x1a
fc407b29:	7875                	lui	a6,0xffffd
fc407b2b:	672d                	lui	a4,0xb
fc407b2d:	756e                	flw	fa0,248(sp)
fc407b2f:	62696c2f          	0x62696c2f
fc407b33:	7375722f          	0x7375722f
fc407b37:	6c74                	flw	fa3,92(s0)
fc407b39:	6269                	lui	tp,0x1a
fc407b3b:	6372732f          	0x6372732f
fc407b3f:	7375722f          	0x7375722f
fc407b43:	2f74                	fld	fa3,216(a4)
fc407b45:	2f637273          	csrrci	tp,0x2f6,6
fc407b49:	696c                	flw	fa1,84(a0)
fc407b4b:	6362                	flw	ft6,24(sp)
fc407b4d:	2f65726f          	jal	tp,fc45ee43 <ebss+0x3fda3>
fc407b51:	6974706f          	j	fc44f9e7 <ebss+0x30947>
fc407b55:	722e6e6f          	jal	t3,fc4ee277 <ebss+0xcf1d7>
fc407b59:	          	0xc0000073

fc407b5c <.Lanon.0108a7b659b8977746eaecbcc16bb0c0.8>:
fc407b5c:	7ac0                	flw	fs0,52(a3)
fc407b5e:	fc40                	fsw	fs0,60(s0)
fc407b60:	0000002b          	0x2b
fc407b64:	fc407aeb          	0xfc407aeb
fc407b68:	0000006f          	j	fc407b68 <.Lanon.0108a7b659b8977746eaecbcc16bb0c0.8+0xc>
fc407b6c:	017a                	slli	sp,sp,0x1e
fc407b6e:	0000                	unimp
fc407b70:	0015                	c.nop	5
	...

fc407b74 <anon.0108a7b659b8977746eaecbcc16bb0c0.9.llvm.6888356102653465869>:
fc407b74:	1dac                	addi	a1,sp,760
fc407b76:	fc40                	fsw	fs0,60(s0)
fc407b78:	000c                	0xc
fc407b7a:	0000                	unimp
fc407b7c:	0004                	0x4
fc407b7e:	0000                	unimp
fc407b80:	3158                	fld	fa4,160(a0)
fc407b82:	fc40                	fsw	fs0,60(s0)
fc407b84:	3b98                	fld	fa4,48(a5)
fc407b86:	fc40                	fsw	fs0,60(s0)
fc407b88:	3c80                	fld	fs0,56(s1)
fc407b8a:	fc40                	fsw	fs0,60(s0)
fc407b8c:	0000                	unimp
	...

fc407b90 <str.0>:
fc407b90:	6d6f682f          	0x6d6f682f
fc407b94:	2f65                	jal	fc40834c <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x1c0>
fc407b96:	6166                	flw	ft2,88(sp)
fc407b98:	7a6e                	flw	fs4,248(sp)
fc407b9a:	6968                	flw	fa0,84(a0)
fc407b9c:	6570                	flw	fa2,76(a0)
fc407b9e:	676e                	flw	fa4,216(sp)
fc407ba0:	75722e2f          	0x75722e2f
fc407ba4:	70757473          	csrrci	s0,0x707,10
fc407ba8:	6f6f742f          	0x6f6f742f
fc407bac:	636c                	flw	fa1,68(a4)
fc407bae:	6168                	flw	fa0,68(a0)
fc407bb0:	6e69                	lui	t3,0x1a
fc407bb2:	696e2f73          	csrrs	t5,0x696,t3
fc407bb6:	6c746867          	0x6c746867
fc407bba:	2d79                	jal	fc408258 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0xcc>
fc407bbc:	3878                	fld	fa4,240(s0)
fc407bbe:	5f36                	lw	t5,108(sp)
fc407bc0:	3436                	fld	fs0,360(sp)
fc407bc2:	752d                	lui	a0,0xfffeb
fc407bc4:	6b6e                	flw	fs6,216(sp)
fc407bc6:	6f6e                	flw	ft10,216(sp)
fc407bc8:	6c2d6e77          	0x6c2d6e77
fc407bcc:	6e69                	lui	t3,0x1a
fc407bce:	7875                	lui	a6,0xffffd
fc407bd0:	672d                	lui	a4,0xb
fc407bd2:	756e                	flw	fa0,248(sp)
fc407bd4:	62696c2f          	0x62696c2f
fc407bd8:	7375722f          	0x7375722f
fc407bdc:	6c74                	flw	fa3,92(s0)
fc407bde:	6269                	lui	tp,0x1a
fc407be0:	6372732f          	0x6372732f
fc407be4:	7375722f          	0x7375722f
fc407be8:	2f74                	fld	fa3,216(a4)
fc407bea:	2f637273          	csrrci	tp,0x2f6,6
fc407bee:	696c                	flw	fa1,84(a0)
fc407bf0:	6362                	flw	ft6,24(sp)
fc407bf2:	2f65726f          	jal	tp,fc45eee8 <ebss+0x3fe48>
fc407bf6:	6d66                	flw	fs10,88(sp)
fc407bf8:	2f74                	fld	fa3,216(a4)
fc407bfa:	6f6d                	lui	t5,0x1b
fc407bfc:	2e64                	fld	fs1,216(a2)
fc407bfe:	7372                	flw	ft6,60(sp)

fc407c00 <.Lanon.0108a7b659b8977746eaecbcc16bb0c0.10>:
fc407c00:	7b90                	flw	fa2,48(a5)
fc407c02:	fc40                	fsw	fs0,60(s0)
fc407c04:	0070                	addi	a2,sp,12
fc407c06:	0000                	unimp
fc407c08:	0454                	addi	a3,sp,516
fc407c0a:	0000                	unimp
fc407c0c:	0028                	addi	a0,sp,8
	...

fc407c10 <.Lanon.0108a7b659b8977746eaecbcc16bb0c0.11>:
fc407c10:	7b90                	flw	fa2,48(a5)
fc407c12:	fc40                	fsw	fs0,60(s0)
fc407c14:	0070                	addi	a2,sp,12
fc407c16:	0000                	unimp
fc407c18:	0460                	addi	s0,sp,524
fc407c1a:	0000                	unimp
fc407c1c:	0011                	c.nop	4
	...

fc407c20 <.Lanon.0108a7b659b8977746eaecbcc16bb0c0.22>:
fc407c20:	7245                	lui	tp,0xffff1
fc407c22:	6f72                	flw	ft10,28(sp)
fc407c24:	                	fld	ft0,280(sp)

fc407c25 <anon.86937c43ed109f5cdd011c32a553f3f7.18.llvm.3292268272379612485>:
fc407c25:	7b20                	flw	fs0,112(a4)
fc407c27:	                	fld	fs4,160(sp)

fc407c28 <anon.86937c43ed109f5cdd011c32a553f3f7.19.llvm.3292268272379612485>:
fc407c28:	203a                	fld	ft0,392(sp)

fc407c2a <anon.86937c43ed109f5cdd011c32a553f3f7.20.llvm.3292268272379612485>:
fc407c2a:	0a2c                	addi	a1,sp,280

fc407c2c <anon.86937c43ed109f5cdd011c32a553f3f7.21.llvm.3292268272379612485>:
fc407c2c:	202c                	fld	fa1,64(s0)

fc407c2e <anon.86937c43ed109f5cdd011c32a553f3f7.22.llvm.3292268272379612485>:
fc407c2e:	7b20                	flw	fs0,112(a4)
fc407c30:	                	flw	fs0,120(a0)

fc407c31 <anon.86937c43ed109f5cdd011c32a553f3f7.23.llvm.3292268272379612485>:
fc407c31:	                	jal	fc407cdf <.Lanon.db373ce25dfeaf41079e038efc6d12ac.9+0x23>

fc407c32 <anon.86937c43ed109f5cdd011c32a553f3f7.24.llvm.3292268272379612485>:
fc407c32:	7d20                	flw	fs0,120(a0)

fc407c34 <anon.86937c43ed109f5cdd011c32a553f3f7.25.llvm.3292268272379612485>:
fc407c34:	0a28                	addi	a0,sp,280

fc407c36 <anon.86937c43ed109f5cdd011c32a553f3f7.26.llvm.3292268272379612485>:
fc407c36:	                	fld	fa0,88(s0)

fc407c37 <anon.86937c43ed109f5cdd011c32a553f3f7.27.llvm.3292268272379612485>:
fc407c37:	                	fld	fa1,80(a0)

fc407c38 <anon.86937c43ed109f5cdd011c32a553f3f7.28.llvm.3292268272379612485>:
fc407c38:	                	addi	s4,s4,10

fc407c39 <anon.86937c43ed109f5cdd011c32a553f3f7.29.llvm.3292268272379612485>:
fc407c39:	                	lw	s6,160(sp)

fc407c3a <anon.86937c43ed109f5cdd011c32a553f3f7.31.llvm.3292268272379612485>:
fc407c3a:	          	0x30cc5d5b

fc407c3b <anon.86937c43ed109f5cdd011c32a553f3f7.35.llvm.3292268272379612485>:
fc407c3b:	                	beqz	s0,fc407cf9 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.9+0x3d>

fc407c3c <.Lanon.86937c43ed109f5cdd011c32a553f3f7.43>:
fc407c3c:	30cc                	fld	fa1,160(s1)
fc407c3e:	fc40                	fsw	fs0,60(s0)
fc407c40:	0004                	0x4
fc407c42:	0000                	unimp
fc407c44:	0004                	0x4
fc407c46:	0000                	unimp
fc407c48:	3cec                	fld	fa1,248(s1)
fc407c4a:	fc40                	fsw	fs0,60(s0)
fc407c4c:	3d14                	fld	fa3,56(a0)
fc407c4e:	fc40                	fsw	fs0,60(s0)
fc407c50:	3e00                	fld	fs0,56(a2)
fc407c52:	fc40                	fsw	fs0,60(s0)

fc407c54 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.1>:
fc407c54:	000a                	c.slli	zero,0x2
	...

fc407c58 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.2>:
fc407c58:	7c54                	flw	fa3,60(s0)
fc407c5a:	fc40                	fsw	fs0,60(s0)
fc407c5c:	0000                	unimp
fc407c5e:	0000                	unimp
fc407c60:	7c54                	flw	fa3,60(s0)
fc407c62:	fc40                	fsw	fs0,60(s0)
fc407c64:	0001                	nop
	...

fc407c68 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.3>:
fc407c68:	6372                	flw	ft6,28(sp)
fc407c6a:	5f65726f          	jal	tp,fc45f260 <ebss+0x401c0>
fc407c6e:	70657473          	csrrci	s0,0x706,10
fc407c72:	625f 5f79 7473      	0x74735f79625f
fc407c78:	7065                	c.lui	zero,0xffff9
fc407c7a:	6f20                	flw	fs0,88(a4)
fc407c7c:	73692073          	csrs	0x736,s2
fc407c80:	7220                	flw	fs0,96(a2)
fc407c82:	6e75                	lui	t3,0x1d
fc407c84:	696e                	flw	fs2,216(sp)
fc407c86:	676e                	flw	fa4,216(sp)
fc407c88:	0021                	c.nop	8
	...

fc407c8c <.Lanon.db373ce25dfeaf41079e038efc6d12ac.4>:
fc407c8c:	7c68                	flw	fa0,124(s0)
fc407c8e:	fc40                	fsw	fs0,60(s0)
fc407c90:	0021                	c.nop	8
	...

fc407c94 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.5>:
fc407c94:	7266                	flw	ft4,120(sp)
fc407c96:	6565                	lui	a0,0x19
fc407c98:	6d20                	flw	fs0,88(a0)
fc407c9a:	6d65                	lui	s10,0x19
fc407c9c:	2079726f          	jal	tp,fc49f6a2 <ebss+0x80602>
fc407ca0:	6170                	flw	fa2,68(a0)
fc407ca2:	6464                	flw	fs1,76(s0)
fc407ca4:	2072                	fld	ft0,280(sp)
fc407ca6:	203d                	jal	fc407cd4 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.9+0x18>
fc407ca8:	          	0x202c5b

fc407ca9 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.6>:
fc407ca9:	202c                	fld	fa1,64(s0)
	...

fc407cac <.Lanon.db373ce25dfeaf41079e038efc6d12ac.7>:
fc407cac:	7c94                	flw	fa3,56(s1)
fc407cae:	fc40                	fsw	fs0,60(s0)
fc407cb0:	0015                	c.nop	5
fc407cb2:	0000                	unimp
fc407cb4:	7ca9                	lui	s9,0xfffea
fc407cb6:	fc40                	fsw	fs0,60(s0)
fc407cb8:	0002                	c.slli64	zero
	...

fc407cbc <.Lanon.db373ce25dfeaf41079e038efc6d12ac.9>:
fc407cbc:	0001                	nop
fc407cbe:	0000                	unimp
fc407cc0:	0000                	unimp
fc407cc2:	0000                	unimp
fc407cc4:	0020                	addi	s0,sp,8
fc407cc6:	0000                	unimp
fc407cc8:	0004                	0x4
fc407cca:	0000                	unimp
fc407ccc:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407cd0:	0000                	unimp
fc407cd2:	0000                	unimp
fc407cd4:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407cd8:	0000                	unimp
fc407cda:	0000                	unimp
fc407cdc:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407ce0:	0001                	nop
fc407ce2:	0000                	unimp
fc407ce4:	0001                	nop
fc407ce6:	0000                	unimp
fc407ce8:	0020                	addi	s0,sp,8
fc407cea:	0000                	unimp
fc407cec:	0004                	0x4
fc407cee:	0000                	unimp
fc407cf0:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407cf4:	0000                	unimp
fc407cf6:	0000                	unimp
fc407cf8:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407cfc:	0000                	unimp
fc407cfe:	0000                	unimp
fc407d00:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>

fc407d04 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.10>:
fc407d04:	7266                	flw	ft4,120(sp)
fc407d06:	6565                	lui	a0,0x19
fc407d08:	7020                	flw	fs0,96(s0)
fc407d0a:	7968                	flw	fa0,116(a0)
fc407d0c:	61636973          	csrrsi	s2,0x616,6
fc407d10:	206c                	fld	fa1,192(s0)
fc407d12:	656d                	lui	a0,0x1b
fc407d14:	6f6d                	lui	t5,0x1b
fc407d16:	7972                	flw	fs2,60(sp)
fc407d18:	7020                	flw	fs0,96(s0)
fc407d1a:	6e70                	flw	fa2,92(a2)
fc407d1c:	3d20                	fld	fs0,120(a0)
fc407d1e:	5b20                	lw	s0,112(a4)

fc407d20 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.11>:
fc407d20:	0029                	c.nop	10
	...

fc407d24 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.12>:
fc407d24:	7d04                	flw	fs1,56(a0)
fc407d26:	fc40                	fsw	fs0,60(s0)
fc407d28:	001c                	0x1c
fc407d2a:	0000                	unimp
fc407d2c:	7ca9                	lui	s9,0xfffea
fc407d2e:	fc40                	fsw	fs0,60(s0)
fc407d30:	0002                	c.slli64	zero
fc407d32:	0000                	unimp
fc407d34:	7d20                	flw	fs0,120(a0)
fc407d36:	fc40                	fsw	fs0,60(s0)
fc407d38:	0001                	nop
	...

fc407d3c <.Lanon.db373ce25dfeaf41079e038efc6d12ac.15>:
fc407d3c:	2f637273          	csrrci	tp,0x2f6,6
fc407d40:	6e69                	lui	t3,0x1a
fc407d42:	7469                	lui	s0,0xffffa
fc407d44:	722e                	flw	ft4,232(sp)
fc407d46:	          	0x66340073

fc407d48 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.16>:
fc407d48:	6634                	flw	fa3,72(a2)
fc407d4a:	fc40                	fsw	fs0,60(s0)
fc407d4c:	0010                	0x10
fc407d4e:	0000                	unimp
fc407d50:	7d3c                	flw	fa5,120(a0)
fc407d52:	fc40                	fsw	fs0,60(s0)
fc407d54:	0000000b          	0xb
fc407d58:	0026                	c.slli	zero,0x9
fc407d5a:	0000                	unimp
fc407d5c:	0005                	c.nop	1
	...

fc407d60 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.17>:
fc407d60:	6461                	lui	s0,0x18
fc407d62:	7264                	flw	fs1,100(a2)
fc407d64:	203a                	fld	ft0,392(sp)

fc407d66 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.18>:
fc407d66:	202c                	fld	fa1,64(s0)
fc407d68:	6176                	flw	ft2,92(sp)
fc407d6a:	756c                	flw	fa1,108(a0)
fc407d6c:	3a65                	jal	fc407724 <anon.fe7732283a7f5a795c6169f6eb5e8c98.60.llvm.7276170047363281110+0x25c>
fc407d6e:	0020                	addi	s0,sp,8

fc407d70 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.19>:
fc407d70:	7d60                	flw	fs0,124(a0)
fc407d72:	fc40                	fsw	fs0,60(s0)
fc407d74:	0006                	c.slli	zero,0x1
fc407d76:	0000                	unimp
fc407d78:	7d66                	flw	fs10,120(sp)
fc407d7a:	fc40                	fsw	fs0,60(s0)
fc407d7c:	0009                	c.nop	2
	...

fc407d80 <.Lanon.db373ce25dfeaf41079e038efc6d12ac.20>:
fc407d80:	0001                	nop
fc407d82:	0000                	unimp
fc407d84:	0000                	unimp
fc407d86:	0000                	unimp
fc407d88:	0020                	addi	s0,sp,8
fc407d8a:	0000                	unimp
fc407d8c:	0000                	unimp
fc407d8e:	0000                	unimp
fc407d90:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407d94:	0000                	unimp
fc407d96:	0000                	unimp
fc407d98:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407d9c:	0000                	unimp
fc407d9e:	0000                	unimp
fc407da0:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407da4:	0001                	nop
fc407da6:	0000                	unimp
fc407da8:	0001                	nop
fc407daa:	0000                	unimp
fc407dac:	0020                	addi	s0,sp,8
fc407dae:	0000                	unimp
fc407db0:	0004                	0x4
fc407db2:	0000                	unimp
fc407db4:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407db8:	0000                	unimp
fc407dba:	0000                	unimp
fc407dbc:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407dc0:	0000                	unimp
fc407dc2:	0000                	unimp
fc407dc4:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>

fc407dc8 <.Lanon.ae1a4b1c21036fdc19891c50d02bc86a.1>:
fc407dc8:	000a                	c.slli	zero,0x2
	...

fc407dcc <anon.ae1a4b1c21036fdc19891c50d02bc86a.2.llvm.6498213974988382756>:
fc407dcc:	7dc8                	flw	fa0,60(a1)
fc407dce:	fc40                	fsw	fs0,60(s0)
fc407dd0:	0000                	unimp
fc407dd2:	0000                	unimp
fc407dd4:	7dc8                	flw	fa0,60(a1)
fc407dd6:	fc40                	fsw	fs0,60(s0)
fc407dd8:	0001                	nop
	...

fc407ddc <.Lanon.ae1a4b1c21036fdc19891c50d02bc86a.3>:
fc407ddc:	2b2b2b2b          	0x2b2b2b2b
fc407de0:	75746573          	csrrsi	a0,0x757,8
fc407de4:	2070                	fld	fa2,192(s0)
fc407de6:	6974                	flw	fa3,84(a0)
fc407de8:	656d                	lui	a0,0x1b
fc407dea:	2072                	fld	ft0,280(sp)
fc407dec:	2b21                	jal	fc408304 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x178>
fc407dee:	002b2b2b          	0x2b2b2b
	...

fc407df4 <anon.ae1a4b1c21036fdc19891c50d02bc86a.4.llvm.6498213974988382756>:
fc407df4:	7ddc                	flw	fa5,60(a1)
fc407df6:	fc40                	fsw	fs0,60(s0)
fc407df8:	0015                	c.nop	5
	...

fc407dfc <.Lanon.67d479eb5d181c354140d3450fa4aa17.1>:
fc407dfc:	000a                	c.slli	zero,0x2
	...

fc407e00 <.Lanon.67d479eb5d181c354140d3450fa4aa17.2>:
fc407e00:	7dfc                	flw	fa5,124(a1)
fc407e02:	fc40                	fsw	fs0,60(s0)
fc407e04:	0000                	unimp
fc407e06:	0000                	unimp
fc407e08:	7dfc                	flw	fa5,124(a1)
fc407e0a:	fc40                	fsw	fs0,60(s0)
fc407e0c:	0001                	nop
	...

fc407e10 <.Lanon.67d479eb5d181c354140d3450fa4aa17.3>:
fc407e10:	2b2b2b2b          	0x2b2b2b2b
fc407e14:	75746573          	csrrsi	a0,0x757,8
fc407e18:	2070                	fld	fa2,192(s0)
fc407e1a:	6e69                	lui	t3,0x1a
fc407e1c:	6574                	flw	fa3,76(a0)
fc407e1e:	7272                	flw	ft4,60(sp)
fc407e20:	7075                	c.lui	zero,0xffffd
fc407e22:	2074                	fld	fa3,192(s0)
fc407e24:	2b21                	jal	fc40833c <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x1b0>
fc407e26:	002b2b2b          	0x2b2b2b
	...

fc407e2c <.Lanon.67d479eb5d181c354140d3450fa4aa17.4>:
fc407e2c:	7e10                	flw	fa2,56(a2)
fc407e2e:	fc40                	fsw	fs0,60(s0)
fc407e30:	0019                	c.nop	6
	...

fc407e34 <.Lanon.67d479eb5d181c354140d3450fa4aa17.5>:
fc407e34:	6e75                	lui	t3,0x1d
fc407e36:	7865                	lui	a6,0xffff9
fc407e38:	6570                	flw	fa2,76(a0)
fc407e3a:	64657463          	bgeu	a0,t1,fc408482 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x2f6>
fc407e3e:	7420                	flw	fs0,104(s0)
fc407e40:	6172                	flw	ft2,28(sp)
fc407e42:	3a70                	fld	fa2,240(a2)
fc407e44:	0020                	addi	s0,sp,8
	...

fc407e48 <.Lanon.67d479eb5d181c354140d3450fa4aa17.6>:
fc407e48:	7e34                	flw	fa3,120(a2)
fc407e4a:	fc40                	fsw	fs0,60(s0)
fc407e4c:	0011                	c.nop	4
	...

fc407e50 <.Lanon.67d479eb5d181c354140d3450fa4aa17.7>:
fc407e50:	0001                	nop
fc407e52:	0000                	unimp
fc407e54:	0000                	unimp
fc407e56:	0000                	unimp
fc407e58:	0020                	addi	s0,sp,8
fc407e5a:	0000                	unimp
fc407e5c:	0014                	0x14
fc407e5e:	0000                	unimp
fc407e60:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407e64:	0000                	unimp
fc407e66:	0000                	unimp
fc407e68:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407e6c:	0000                	unimp
fc407e6e:	0000                	unimp
fc407e70:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>

fc407e74 <.Lanon.67d479eb5d181c354140d3450fa4aa17.9>:
fc407e74:	6624                	flw	fs1,72(a2)
fc407e76:	fc40                	fsw	fs0,60(s0)
fc407e78:	0010                	0x10
fc407e7a:	0000                	unimp
fc407e7c:	001c                	0x1c
fc407e7e:	0000                	unimp
fc407e80:	000e                	c.slli	zero,0x3
	...

fc407e84 <.Lanon.67d479eb5d181c354140d3450fa4aa17.10>:
fc407e84:	4020                	lw	s0,64(s0)
fc407e86:	0020                	addi	s0,sp,8

fc407e88 <.Lanon.67d479eb5d181c354140d3450fa4aa17.11>:
fc407e88:	7dfc                	flw	fa5,124(a1)
fc407e8a:	fc40                	fsw	fs0,60(s0)
fc407e8c:	0000                	unimp
fc407e8e:	0000                	unimp
fc407e90:	7e84                	flw	fs1,56(a3)
fc407e92:	fc40                	fsw	fs0,60(s0)
fc407e94:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>

fc407e98 <.Lanon.67d479eb5d181c354140d3450fa4aa17.12>:
fc407e98:	0001                	nop
fc407e9a:	0000                	unimp
fc407e9c:	0000                	unimp
fc407e9e:	0000                	unimp
fc407ea0:	0020                	addi	s0,sp,8
fc407ea2:	0000                	unimp
fc407ea4:	0000                	unimp
fc407ea6:	0000                	unimp
fc407ea8:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407eac:	0000                	unimp
fc407eae:	0000                	unimp
fc407eb0:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407eb4:	0000                	unimp
fc407eb6:	0000                	unimp
fc407eb8:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407ebc:	0001                	nop
fc407ebe:	0000                	unimp
fc407ec0:	0001                	nop
fc407ec2:	0000                	unimp
fc407ec4:	0020                	addi	s0,sp,8
fc407ec6:	0000                	unimp
fc407ec8:	0004                	0x4
fc407eca:	0000                	unimp
fc407ecc:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407ed0:	0000                	unimp
fc407ed2:	0000                	unimp
fc407ed4:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>
fc407ed8:	0000                	unimp
fc407eda:	0000                	unimp
fc407edc:	00000003          	lb	zero,0(zero) # 0 <XLENB-0x4>

fc407ee0 <.Lanon.67d479eb5d181c354140d3450fa4aa17.13>:
fc407ee0:	6170                	flw	fa2,68(a0)
fc407ee2:	66206567          	0x66206567
fc407ee6:	7561                	lui	a0,0xffff8
fc407ee8:	746c                	flw	fa1,108(s0)
	...

fc407eec <.Lanon.67d479eb5d181c354140d3450fa4aa17.14>:
fc407eec:	7ee0                	flw	fs0,124(a3)
fc407eee:	fc40                	fsw	fs0,60(s0)
fc407ef0:	000a                	c.slli	zero,0x2
fc407ef2:	0000                	unimp
fc407ef4:	6624                	flw	fs1,72(a2)
fc407ef6:	fc40                	fsw	fs0,60(s0)
fc407ef8:	0010                	0x10
fc407efa:	0000                	unimp
fc407efc:	0022                	c.slli	zero,0x8
fc407efe:	0000                	unimp
fc407f00:	0005                	c.nop	1
	...

fc407f04 <.Lanon.67d479eb5d181c354140d3450fa4aa17.15>:
fc407f04:	2061                	jal	fc407f8c <.Lanon.abe0ececba2128385e4221fc8de0cae1.1+0x16>
fc407f06:	7262                	flw	ft4,56(sp)
fc407f08:	6165                	addi	sp,sp,112
fc407f0a:	696f706b          	0x696f706b
fc407f0e:	746e                	flw	fs0,248(sp)
fc407f10:	7320                	flw	fs0,96(a4)
fc407f12:	7465                	lui	s0,0xffff9
fc407f14:	6220                	flw	fs0,64(a2)
fc407f16:	2079                	jal	fc407fa4 <.Lanon.abe0ececba2128385e4221fc8de0cae1.1+0x2e>
fc407f18:	6e72656b          	0x6e72656b
fc407f1c:	6c65                	lui	s8,0x19
	...

fc407f20 <.Lanon.67d479eb5d181c354140d3450fa4aa17.16>:
fc407f20:	7f04                	flw	fs1,56(a4)
fc407f22:	fc40                	fsw	fs0,60(s0)
fc407f24:	001a                	c.slli	zero,0x6
fc407f26:	0000                	unimp
fc407f28:	6624                	flw	fs1,72(a2)
fc407f2a:	fc40                	fsw	fs0,60(s0)
fc407f2c:	0010                	0x10
fc407f2e:	0000                	unimp
fc407f30:	0026                	c.slli	zero,0x9
fc407f32:	0000                	unimp
fc407f34:	0005                	c.nop	1
	...

fc407f38 <.Lanon.67d479eb5d181c354140d3450fa4aa17.17>:
fc407f38:	3031                	jal	fc407744 <anon.fe7732283a7f5a795c6169f6eb5e8c98.60.llvm.7276170047363281110+0x27c>
fc407f3a:	7420                	flw	fs0,104(s0)
fc407f3c:	6369                	lui	t1,0x1a
fc407f3e:	0021736b          	0x21736b
	...

fc407f44 <.Lanon.67d479eb5d181c354140d3450fa4aa17.18>:
fc407f44:	7f38                	flw	fa4,120(a4)
fc407f46:	fc40                	fsw	fs0,60(s0)
fc407f48:	0009                	c.nop	2
	...

fc407f4c <.Lanon.abe0ececba2128385e4221fc8de0cae1.0>:
fc407f4c:	7361                	lui	t1,0xffff8
fc407f4e:	74726573          	csrrsi	a0,0x747,4
fc407f52:	6f69                	lui	t5,0x1a
fc407f54:	206e                	fld	ft0,216(sp)
fc407f56:	6166                	flw	ft2,88(sp)
fc407f58:	6c69                	lui	s8,0x1a
fc407f5a:	6465                	lui	s0,0x19
fc407f5c:	203a                	fld	ft0,392(sp)
fc407f5e:	6962                	flw	fs2,24(sp)
fc407f60:	2074                	fld	fa3,192(s0)
fc407f62:	203c                	fld	fa5,64(s0)
fc407f64:	666c6553          	0x666c6553
fc407f68:	3a3a                	fld	fs4,424(sp)
fc407f6a:	6962                	flw	fs2,24(sp)
fc407f6c:	5f74                	lw	a3,124(a4)
fc407f6e:	656c                	flw	fa1,76(a0)
fc407f70:	676e                	flw	fa4,216(sp)
fc407f72:	6874                	flw	fa3,84(s0)
fc407f74:	2928                	fld	fa0,80(a0)

fc407f76 <.Lanon.abe0ececba2128385e4221fc8de0cae1.1>:
fc407f76:	6d6f682f          	0x6d6f682f
fc407f7a:	2f65                	jal	fc408732 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x5a6>
fc407f7c:	6166                	flw	ft2,88(sp)
fc407f7e:	7a6e                	flw	fs4,248(sp)
fc407f80:	6968                	flw	fa0,84(a0)
fc407f82:	6570                	flw	fa2,76(a0)
fc407f84:	676e                	flw	fa4,216(sp)
fc407f86:	61632e2f          	amoand.w	t3,s6,(t1)
fc407f8a:	6772                	flw	fa4,28(sp)
fc407f8c:	65722f6f          	jal	t5,fc42ade2 <ebss+0xbd42>
fc407f90:	74736967          	0x74736967
fc407f94:	7972                	flw	fs2,60(sp)
fc407f96:	6372732f          	0x6372732f
fc407f9a:	7469672f          	0x7469672f
fc407f9e:	7568                	flw	fa0,108(a0)
fc407fa0:	2e62                	fld	ft8,24(sp)
fc407fa2:	2d6d6f63          	bltu	s10,s6,fc408280 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0xf4>
fc407fa6:	6531                	lui	a0,0xc
fc407fa8:	32366363          	bltu	a2,gp,fc4082ce <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x142>
fc407fac:	3939                	jal	fc407bca <str.0+0x3a>
fc407fae:	6264                	flw	fs1,68(a2)
fc407fb0:	6539                	lui	a0,0xe
fc407fb2:	33323863          	0x33323863
fc407fb6:	7469622f          	0x7469622f
fc407fba:	665f 6569 646c      	0x646c6569665f
fc407fc0:	302d                	jal	fc4077ea <anon.fe7732283a7f5a795c6169f6eb5e8c98.60.llvm.7276170047363281110+0x322>
fc407fc2:	392e                	fld	fs2,232(sp)
fc407fc4:	302e                	fld	ft0,232(sp)
fc407fc6:	6372732f          	0x6372732f
fc407fca:	62696c2f          	0x62696c2f
fc407fce:	722e                	flw	ft4,232(sp)
fc407fd0:	00000073          	ecall

fc407fd4 <.Lanon.abe0ececba2128385e4221fc8de0cae1.2>:
fc407fd4:	7f4c                	flw	fa1,60(a4)
fc407fd6:	fc40                	fsw	fs0,60(s0)
fc407fd8:	002a                	c.slli	zero,0xa
fc407fda:	0000                	unimp
fc407fdc:	7f76                	flw	ft10,124(sp)
fc407fde:	fc40                	fsw	fs0,60(s0)
fc407fe0:	0000005b          	0x5b
fc407fe4:	0106                	slli	sp,sp,0x1
fc407fe6:	0000                	unimp
fc407fe8:	0001                	nop
	...

fc407fec <.Lanon.a536d00a604b33263bcef2c3df135ebf.0>:
fc407fec:	7254                	flw	fa3,36(a2)
fc407fee:	7061                	c.lui	zero,0xffff8
fc407ff0:	7246                	flw	ft4,112(sp)
fc407ff2:	6d61                	lui	s10,0x18
fc407ff4:	                	lui	a6,0xffff9

fc407ff5 <.Lanon.a536d00a604b33263bcef2c3df135ebf.1>:
fc407ff5:	0078                	addi	a4,sp,12
	...

fc407ff8 <.Lanon.a536d00a604b33263bcef2c3df135ebf.2>:
fc407ff8:	4900                	lw	s0,16(a0)
fc407ffa:	fc40                	fsw	fs0,60(s0)
fc407ffc:	0004                	0x4
fc407ffe:	0000                	unimp
fc408000:	0004                	0x4
fc408002:	0000                	unimp
fc408004:	531c                	lw	a5,32(a4)
fc408006:	fc40                	fsw	fs0,60(s0)

fc408008 <.Lanon.a536d00a604b33263bcef2c3df135ebf.3>:
fc408008:	61747373          	csrrci	t1,0x617,8
fc40800c:	7574                	flw	fa3,108(a0)
fc40800e:	          	0x49000073

fc408010 <.Lanon.a536d00a604b33263bcef2c3df135ebf.4>:
fc408010:	4900                	lw	s0,16(a0)
fc408012:	fc40                	fsw	fs0,60(s0)
fc408014:	0004                	0x4
fc408016:	0000                	unimp
fc408018:	0004                	0x4
fc40801a:	0000                	unimp
fc40801c:	4a84                	lw	s1,16(a3)
fc40801e:	fc40                	fsw	fs0,60(s0)

fc408020 <.Lanon.a536d00a604b33263bcef2c3df135ebf.6>:
fc408020:	4900                	lw	s0,16(a0)
fc408022:	fc40                	fsw	fs0,60(s0)
fc408024:	0004                	0x4
fc408026:	0000                	unimp
fc408028:	0004                	0x4
fc40802a:	0000                	unimp
fc40802c:	528c                	lw	a1,32(a3)
fc40802e:	fc40                	fsw	fs0,60(s0)

fc408030 <.Lanon.a536d00a604b33263bcef2c3df135ebf.7>:
fc408030:	61767473          	csrrci	s0,0x617,12
fc408034:	                	flw	fa1,100(a4)

fc408035 <.Lanon.a536d00a604b33263bcef2c3df135ebf.8>:
fc408035:	75616373          	csrrsi	t1,0x756,2
fc408039:	          	csrrsi	a0,ustatus,0

fc40803c <.Lanon.a536d00a604b33263bcef2c3df135ebf.9>:
fc40803c:	4900                	lw	s0,16(a0)
fc40803e:	fc40                	fsw	fs0,60(s0)
fc408040:	0004                	0x4
fc408042:	0000                	unimp
fc408044:	0004                	0x4
fc408046:	0000                	unimp
fc408048:	4a5c                	lw	a5,20(a2)
fc40804a:	fc40                	fsw	fs0,60(s0)

fc40804c <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.0>:
fc40804c:	75616353          	0x75616353
fc408050:	00006573          	csrrsi	a0,ustatus,0

fc408054 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.2>:
fc408054:	4afc                	lw	a5,84(a3)
fc408056:	fc40                	fsw	fs0,60(s0)
fc408058:	0004                	0x4
fc40805a:	0000                	unimp
fc40805c:	0004                	0x4
fc40805e:	0000                	unimp
fc408060:	5158                	lw	a4,36(a0)
fc408062:	fc40                	fsw	fs0,60(s0)

fc408064 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.3>:
fc408064:	7845                	lui	a6,0xffff1
fc408066:	74706563          	bltu	zero,t2,fc4087b0 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x624>
fc40806a:	6f69                	lui	t5,0x1a
fc40806c:	006e                	c.slli	zero,0x1b
	...

fc408070 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.4>:
fc408070:	4afc                	lw	a5,84(a3)
fc408072:	fc40                	fsw	fs0,60(s0)
fc408074:	0004                	0x4
fc408076:	0000                	unimp
fc408078:	0004                	0x4
fc40807a:	0000                	unimp
fc40807c:	4ad4                	lw	a3,20(a3)
fc40807e:	fc40                	fsw	fs0,60(s0)

fc408080 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.5>:
fc408080:	6e49                	lui	t3,0x12
fc408082:	6574                	flw	fa3,76(a0)
fc408084:	7272                	flw	ft4,60(sp)
fc408086:	7075                	c.lui	zero,0xffffd
fc408088:	0074                	addi	a3,sp,12
	...

fc40808c <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.6>:
fc40808c:	4afc                	lw	a5,84(a3)
fc40808e:	fc40                	fsw	fs0,60(s0)
fc408090:	0004                	0x4
fc408092:	0000                	unimp
fc408094:	0004                	0x4
fc408096:	0000                	unimp
fc408098:	4aac                	lw	a1,80(a3)
fc40809a:	fc40                	fsw	fs0,60(s0)

fc40809c <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.7>:
fc40809c:	6e55                	lui	t3,0x15
fc40809e:	776f6e6b          	0x776f6e6b
fc4080a2:	                	lw	t1,248(sp)

fc4080a3 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.8>:
fc4080a3:	65707553          	0x65707553
fc4080a7:	7672                	flw	fa2,60(sp)
fc4080a9:	7369                	lui	t1,0xffffa
fc4080ab:	7845726f          	jal	tp,fc45f82f <ebss+0x4078f>
fc4080af:	6574                	flw	fa3,76(a0)
fc4080b1:	6e72                	flw	ft8,28(sp)
fc4080b3:	6c61                	lui	s8,0x18

fc4080b5 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.9>:
fc4080b5:	7355                	lui	t1,0xffff5
fc4080b7:	7265                	lui	tp,0xffff9
fc4080b9:	7845                	lui	a6,0xffff1
fc4080bb:	6574                	flw	fa3,76(a0)
fc4080bd:	6e72                	flw	ft8,28(sp)
fc4080bf:	6c61                	lui	s8,0x18

fc4080c1 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.10>:
fc4080c1:	65707553          	0x65707553
fc4080c5:	7672                	flw	fa2,60(sp)
fc4080c7:	7369                	lui	t1,0xffffa
fc4080c9:	6954726f          	jal	tp,fc44ff5d <ebss+0x30ebd>
fc4080cd:	656d                	lui	a0,0x1b
fc4080cf:	                	lw	a0,60(sp)

fc4080d0 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.11>:
fc4080d0:	7355                	lui	t1,0xffff5
fc4080d2:	7265                	lui	tp,0xffff9
fc4080d4:	6954                	flw	fa3,20(a0)
fc4080d6:	656d                	lui	a0,0x1b
fc4080d8:	                	lw	t1,60(sp)

fc4080d9 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.12>:
fc4080d9:	65707553          	0x65707553
fc4080dd:	7672                	flw	fa2,60(sp)
fc4080df:	7369                	lui	t1,0xffffa
fc4080e1:	6f53726f          	jal	tp,fc43ffd5 <ebss+0x20f35>
fc4080e5:	7466                	flw	fs0,120(sp)

fc4080e7 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.14>:
fc4080e7:	726f7453          	0x726f7453
fc4080eb:	5065                	c.li	zero,-7
fc4080ed:	6761                	lui	a4,0x18
fc4080ef:	4665                	li	a2,25
fc4080f1:	7561                	lui	a0,0xffff8
fc4080f3:	746c                	flw	fa1,108(s0)

fc4080f5 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.15>:
fc4080f5:	6f4c                	flw	fa1,28(a4)
fc4080f7:	6461                	lui	s0,0x18
fc4080f9:	6150                	flw	fa2,4(a0)
fc4080fb:	61466567          	0x61466567
fc4080ff:	6c75                	lui	s8,0x1d
fc408101:	                	lw	a3,84(a0)

fc408102 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.16>:
fc408102:	6e49                	lui	t3,0x12
fc408104:	75727473          	csrrci	s0,0x757,4
fc408108:	6f697463          	bgeu	s2,s6,fc4087f0 <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x664>
fc40810c:	506e                	0x506e
fc40810e:	6761                	lui	a4,0x18
fc408110:	4665                	li	a2,25
fc408112:	7561                	lui	a0,0xffff8
fc408114:	746c                	flw	fa1,108(s0)

fc408116 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.17>:
fc408116:	7355                	lui	t1,0xffff5
fc408118:	7265                	lui	tp,0xffff9
fc40811a:	6e45                	lui	t3,0x11
fc40811c:	4376                	lw	t1,92(sp)
fc40811e:	6c61                	lui	s8,0x18
fc408120:	                	lw	a1,100(a4)

fc408121 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.18>:
fc408121:	726f7453          	0x726f7453
fc408125:	4665                	li	a2,25
fc408127:	7561                	lui	a0,0xffff8
fc408129:	746c                	flw	fa1,108(s0)

fc40812b <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.19>:
fc40812b:	726f7453          	0x726f7453
fc40812f:	4d65                	li	s10,25
fc408131:	7369                	lui	t1,0xffffa
fc408133:	6c61                	lui	s8,0x18
fc408135:	6769                	lui	a4,0x1a
fc408137:	656e                	flw	fa0,216(sp)
fc408139:	                	lw	s1,92(s0)

fc40813a <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.20>:
fc40813a:	6f4c                	flw	fa1,28(a4)
fc40813c:	6461                	lui	s0,0x18
fc40813e:	6146                	flw	ft2,80(sp)
fc408140:	6c75                	lui	s8,0x1d
fc408142:	                	lw	a3,68(a2)

fc408143 <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.21>:
fc408143:	7242                	flw	ft4,48(sp)
fc408145:	6165                	addi	sp,sp,112
fc408147:	696f706b          	0x696f706b
fc40814b:	746e                	flw	fs0,248(sp)

fc40814d <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.22>:
fc40814d:	6c49                	lui	s8,0x12
fc40814f:	656c                	flw	fa1,76(a0)
fc408151:	496c6167          	0x496c6167
fc408155:	736e                	flw	ft6,248(sp)
fc408157:	7274                	flw	fa3,100(a2)
fc408159:	6375                	lui	t1,0x1d
fc40815b:	6974                	flw	fa3,84(a0)
fc40815d:	          	jal	t3,fc49e841 <ebss+0x7f7a1>

fc40815f <.Lanon.e09fae7ba66d8c0f6b02e370eeefaa8f.24>:
fc40815f:	6e49                	lui	t3,0x12
fc408161:	75727473          	csrrci	s0,0x757,4
fc408165:	6f697463          	bgeu	s2,s6,fc40884d <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967+0x6c1>
fc408169:	4d6e                	lw	s10,216(sp)
fc40816b:	7369                	lui	t1,0xffffa
fc40816d:	6c61                	lui	s8,0x18
fc40816f:	6769                	lui	a4,0x1a
fc408171:	656e                	flw	fa0,216(sp)
fc408173:	                	fsw	fs1,84(s0)

fc408174 <.Lanon.95835b6de2449355779ba99954b1fc99.2>:
fc408174:	51e8                	lw	a0,100(a1)
fc408176:	fc40                	fsw	fs0,60(s0)
fc408178:	0004                	0x4
fc40817a:	0000                	unimp
fc40817c:	0004                	0x4
fc40817e:	0000                	unimp
fc408180:	5158                	lw	a4,36(a0)
fc408182:	fc40                	fsw	fs0,60(s0)

fc408184 <.Lanon.95835b6de2449355779ba99954b1fc99.3>:
fc408184:	61747353          	0x61747353
fc408188:	7574                	flw	fa3,108(a0)
fc40818a:	          	0x57e80073

fc40818c <anon.259c51322c45397b4137a4f54536a0b1.0.llvm.2755556737986192967>:
fc40818c:	57e8                	lw	a0,108(a5)
fc40818e:	fc40                	fsw	fs0,60(s0)
fc408190:	0004                	0x4
fc408192:	0000                	unimp
fc408194:	0004                	0x4
fc408196:	0000                	unimp
fc408198:	528c                	lw	a1,32(a3)
fc40819a:	fc40                	fsw	fs0,60(s0)
	...

Disassembly of section .eh_frame:

fc409000 <.eh_frame>:
fc409000:	0010                	0x10
fc409002:	0000                	unimp
fc409004:	0000                	unimp
fc409006:	0000                	unimp
fc409008:	7a01                	lui	s4,0xfffe0
fc40900a:	0052                	c.slli	zero,0x14
fc40900c:	7c01                	lui	s8,0xfffe0
fc40900e:	0101                	addi	sp,sp,0
fc409010:	00020c1b          	0x20c1b
fc409014:	0000                	unimp
	...

Disassembly of section .stack:

fc40a000 <bootstack>:
	...

Disassembly of section .bss:

fc40e000 <sbss>:
	...

fc41e000 <_ZN2os6memory17DYNAMIC_ALLOCATOR17h67a12dba2c929049E.llvm.2536193249071152694>:
	...

fc41e090 <_ZN2os6memory15frame_allocator22SEGMENT_TREE_ALLOCATOR17he23892694a6eee45E>:
	...

Disassembly of section .sbss:

fc41f0a0 <_ZN2os5clock4TICK17hc9f49cf78dc7650bE>:
fc41f0a0:	0000                	unimp
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	694c                	flw	fa1,20(a0)
   2:	6b6e                	flw	fs6,216(sp)
   4:	7265                	lui	tp,0xffff9
   6:	203a                	fld	ft0,392(sp)
   8:	4c4c                	lw	a1,28(s0)
   a:	2044                	fld	fs1,128(s0)
   c:	2e39                	jal	32a <XLENB+0x326>
   e:	2e30                	fld	fa2,88(a2)
  10:	0030                	addi	a2,sp,8
