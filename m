Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2896719AC81
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Apr 2020 15:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jJdFL-0007WJ-UU
	for lists+kgdb-bugreport@lfdr.de; Wed, 01 Apr 2020 13:17:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jJJ8K-0003Ya-Qj
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZJavPzRhxDrK4yWg9uL5kYJ4OsY8JA4e9kgiuaWLjDs=; b=b8vav+jyk3+69GUGW627sy6smT
 /YLJSytMPAfxzdgL3ovhSx2XwuWb3CRkDWEgw/ePBVrSyo5SVxKjYO8t0k95X35Kesb1dePF2Y3kB
 8Ap9SfzyNidUGjJb6ZV68m7hXB0CROr7ll9kazg+P/OSNI+QWh7/EN8vdDi/hmUfM6p4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZJavPzRhxDrK4yWg9uL5kYJ4OsY8JA4e9kgiuaWLjDs=; b=KP9SBA3a77+5Y+DQ8hIEDmcoXs
 F9UX4FXPeZu7yNu2u9XY/D3vp4Qz0I7uh1quwZw5L5PDFNjMAAK68UH0dHRHhZe9uqejCJmTLHNFW
 7Km3hRZZz9gwiMRzW4DO30NpyZuJe5R41LpRHGTE0Co2jkPKe0Mf1tP7msgwQ6ZnintU=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJJ8I-00GuqZ-Ji
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:48:56 +0000
Received: by mail-pl1-f195.google.com with SMTP id g18so8282757plq.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 31 Mar 2020 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZJavPzRhxDrK4yWg9uL5kYJ4OsY8JA4e9kgiuaWLjDs=;
 b=MWRk3vrfENyZ5w2Isu7z9fSnahvP+Tla6eIeFGlllzLT9BkwQVlxzBdorAfWGgRa/1
 kAj8kx7EhAIvkAIPzFzwepsnqnDNQisETjeMbic4/5ULzHxaDcVLgBnBOtv7EPxZri6s
 m18NstFZIptxD/t/w0JhwHbObNGeoMlHYwlp2sAj2d4PofLNWj5bkiBY46Z+neKzll5A
 r96PNfkiv8hKvbyq0bp7KYuYSlTKvkW6d+6hAD61oKWYV4FnnyhHsY9XPqdbR5n6Thmd
 E66OSxYCBHFp1hTvS1LlGcLrF9ymfdDKU2p61hS385Kpux1mnXf1TAWK6BlqQQNUaA39
 0uKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZJavPzRhxDrK4yWg9uL5kYJ4OsY8JA4e9kgiuaWLjDs=;
 b=S9IPskToJxr7V8IfF8hvVFO/Tz2neBm5zdCUlgxoyTgd4ZFv13HWrl3UnFTSYgNkmL
 g4/UpBAGLkWzuqTNmQORWyUrFabGoefvL5WPRzF+76HVHjIWyyVwlXwf9bl8zEdkZlCT
 KzgGm8vWMWRHJcHc+8OgmQ+jrlJybKoNsQYBRx8QvNSQDLC9WgC9Lp74gbMrNL3SEVh7
 C0WXY4QvRxkiJwVMxKegrkwNHrxdsNzX7q5DSnYnwDzhFQK+uB0ILz35VEtXDRWKOvJO
 UcgFhms9TDvEcufsjJqM3I538/T+RiZjRNVIUfjZnKbL7mrzxOc0YBZ4J5TZWXTS8kwK
 WEAA==
X-Gm-Message-State: ANhLgQ3NEcjWZp3kfxtCEQqRPgzr6RyAJXtu/9ucKUAhvyR2GuQJAr/u
 YqPGK7qY65sXRYwq56waqmywTbMNFEQ=
X-Google-Smtp-Source: ADFU+vuMZG+MXpfrtt2IQVgoG7koZtV5lmYJnRotfqH87svHbxcTRu2KAzLUpUPe/Luu2sMCr6utXQ==
X-Received: by 2002:a17:902:d695:: with SMTP id
 v21mr17529966ply.135.1585668215702; 
 Tue, 31 Mar 2020 08:23:35 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id g30sm12097660pgn.40.2020.03.31.08.23.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Mar 2020 08:23:35 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Tue, 31 Mar 2020 23:23:08 +0800
Message-Id: <1585668191-16287-3-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jJJ8I-00GuqZ-Ji
X-Mailman-Approved-At: Wed, 01 Apr 2020 13:17:31 +0000
Subject: [Kgdb-bugreport] [PATCH v2 2/5] riscv: Add KGDB support
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The skeleton of RISC-V KGDB port.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig              |   1 +
 arch/riscv/include/asm/Kbuild   |   1 -
 arch/riscv/include/asm/kdebug.h |  12 +++
 arch/riscv/include/asm/kgdb.h   | 107 +++++++++++++++++++++
 arch/riscv/kernel/Makefile      |   1 +
 arch/riscv/kernel/kgdb.c        | 199 ++++++++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/traps.c       |   5 +
 7 files changed, 325 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/kdebug.h
 create mode 100644 arch/riscv/include/asm/kgdb.h
 create mode 100644 arch/riscv/kernel/kgdb.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 73f029eae0cc..108794f4aa45 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -66,6 +66,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
+	select HAVE_ARCH_KGDB
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index ec0ca8c6ab64..625e46cbdec8 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -15,7 +15,6 @@ generic-y += hardirq.h
 generic-y += hw_irq.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
-generic-y += kdebug.h
 generic-y += kmap_types.h
 generic-y += kvm_para.h
 generic-y += local.h
diff --git a/arch/riscv/include/asm/kdebug.h b/arch/riscv/include/asm/kdebug.h
new file mode 100644
index 000000000000..85ac00411f6e
--- /dev/null
+++ b/arch/riscv/include/asm/kdebug.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_ARC_KDEBUG_H
+#define _ASM_ARC_KDEBUG_H
+
+enum die_val {
+	DIE_UNUSED,
+	DIE_TRAP,
+	DIE_OOPS
+};
+
+#endif
diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
new file mode 100644
index 000000000000..69bc6a03081d
--- /dev/null
+++ b/arch/riscv/include/asm/kgdb.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_KGDB_H_
+#define __ASM_KGDB_H_
+
+#ifdef __KERNEL__
+
+#define GDB_SIZEOF_REG sizeof(unsigned long)
+
+#define DBG_MAX_REG_NUM (33)
+#define NUMREGBYTES ((DBG_MAX_REG_NUM) * GDB_SIZEOF_REG)
+#define CACHE_FLUSH_IS_SAFE     1
+#define BUFMAX                  2048
+#ifdef CONFIG_RISCV_ISA_C
+#define BREAK_INSTR_SIZE	2
+#else
+#define BREAK_INSTR_SIZE	4
+#endif
+#define CACHE_FLUSH_IS_SAFE 1
+
+#ifndef	__ASSEMBLY__
+
+extern int kgdb_has_hit_break(unsigned long addr);
+extern unsigned long kgdb_compiled_break;
+
+static inline void arch_kgdb_breakpoint(void)
+{
+	asm(".global kgdb_compiled_break\n"
+	    ".option norvc\n"
+	    "kgdb_compiled_break: ebreak\n"
+	    ".option rvc\n");
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#define DBG_REG_ZERO "zero"
+#define DBG_REG_RA "ra"
+#define DBG_REG_SP "sp"
+#define DBG_REG_GP "gp"
+#define DBG_REG_TP "tp"
+#define DBG_REG_T0 "t0"
+#define DBG_REG_T1 "t1"
+#define DBG_REG_T2 "t2"
+#define DBG_REG_FP "fp"
+#define DBG_REG_S1 "s1"
+#define DBG_REG_A0 "a0"
+#define DBG_REG_A1 "a1"
+#define DBG_REG_A2 "a2"
+#define DBG_REG_A3 "a3"
+#define DBG_REG_A4 "a4"
+#define DBG_REG_A5 "a5"
+#define DBG_REG_A6 "a6"
+#define DBG_REG_A7 "a7"
+#define DBG_REG_S2 "s2"
+#define DBG_REG_S3 "s3"
+#define DBG_REG_S4 "s4"
+#define DBG_REG_S5 "s5"
+#define DBG_REG_S6 "s6"
+#define DBG_REG_S7 "s7"
+#define DBG_REG_S8 "s8"
+#define DBG_REG_S9 "s9"
+#define DBG_REG_S10 "s10"
+#define DBG_REG_S11 "s11"
+#define DBG_REG_T3 "t3"
+#define DBG_REG_T4 "t4"
+#define DBG_REG_T5 "t5"
+#define DBG_REG_T6 "t6"
+#define DBG_REG_EPC "pc"
+
+#define DBG_REG_ZERO_OFF 0
+#define DBG_REG_RA_OFF 1
+#define DBG_REG_SP_OFF 2
+#define DBG_REG_GP_OFF 3
+#define DBG_REG_TP_OFF 4
+#define DBG_REG_T0_OFF 5
+#define DBG_REG_T1_OFF 6
+#define DBG_REG_T2_OFF 7
+#define DBG_REG_FP_OFF 8
+#define DBG_REG_S1_OFF 9
+#define DBG_REG_A0_OFF 10
+#define DBG_REG_A1_OFF 11
+#define DBG_REG_A2_OFF 12
+#define DBG_REG_A3_OFF 13
+#define DBG_REG_A4_OFF 14
+#define DBG_REG_A5_OFF 15
+#define DBG_REG_A6_OFF 16
+#define DBG_REG_A7_OFF 17
+#define DBG_REG_S2_OFF 18
+#define DBG_REG_S3_OFF 19
+#define DBG_REG_S4_OFF 20
+#define DBG_REG_S5_OFF 21
+#define DBG_REG_S6_OFF 22
+#define DBG_REG_S7_OFF 23
+#define DBG_REG_S8_OFF 24
+#define DBG_REG_S9_OFF 25
+#define DBG_REG_S10_OFF 26
+#define DBG_REG_S11_OFF 27
+#define DBG_REG_T3_OFF 28
+#define DBG_REG_T4_OFF 29
+#define DBG_REG_T5_OFF 30
+#define DBG_REG_T6_OFF 31
+#define DBG_REG_EPC_OFF 32
+#define DBG_REG_STATUS_OFF 33
+#define DBG_REG_BADADDR_OFF 34
+#define DBG_REG_CAUSE_OFF 35
+#endif
+#endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f40205cb9a22..8956543f7d6b 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -42,5 +42,6 @@ obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o
+obj-$(CONFIG_KGDB)		+= kgdb.o
 
 clean:
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
new file mode 100644
index 000000000000..e3b1075c3935
--- /dev/null
+++ b/arch/riscv/kernel/kgdb.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/ptrace.h>
+#include <linux/kdebug.h>
+#include <linux/bug.h>
+#include <linux/kgdb.h>
+#include <linux/irqflags.h>
+#include <linux/string.h>
+#include <asm/cacheflush.h>
+
+enum {
+	NOT_KGDB_BREAK = 0,
+	KGDB_SW_BREAK,
+	KGDB_COMPILED_BREAK,
+};
+
+struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
+	{DBG_REG_ZERO, GDB_SIZEOF_REG, -1},
+	{DBG_REG_RA, GDB_SIZEOF_REG, offsetof(struct pt_regs, ra)},
+	{DBG_REG_SP, GDB_SIZEOF_REG, offsetof(struct pt_regs, sp)},
+	{DBG_REG_GP, GDB_SIZEOF_REG, offsetof(struct pt_regs, gp)},
+	{DBG_REG_TP, GDB_SIZEOF_REG, offsetof(struct pt_regs, tp)},
+	{DBG_REG_T0, GDB_SIZEOF_REG, offsetof(struct pt_regs, t0)},
+	{DBG_REG_T1, GDB_SIZEOF_REG, offsetof(struct pt_regs, t1)},
+	{DBG_REG_T2, GDB_SIZEOF_REG, offsetof(struct pt_regs, t2)},
+	{DBG_REG_FP, GDB_SIZEOF_REG, offsetof(struct pt_regs, s0)},
+	{DBG_REG_S1, GDB_SIZEOF_REG, offsetof(struct pt_regs, a1)},
+	{DBG_REG_A0, GDB_SIZEOF_REG, offsetof(struct pt_regs, a0)},
+	{DBG_REG_A1, GDB_SIZEOF_REG, offsetof(struct pt_regs, a1)},
+	{DBG_REG_A2, GDB_SIZEOF_REG, offsetof(struct pt_regs, a2)},
+	{DBG_REG_A3, GDB_SIZEOF_REG, offsetof(struct pt_regs, a3)},
+	{DBG_REG_A4, GDB_SIZEOF_REG, offsetof(struct pt_regs, a4)},
+	{DBG_REG_A5, GDB_SIZEOF_REG, offsetof(struct pt_regs, a5)},
+	{DBG_REG_A6, GDB_SIZEOF_REG, offsetof(struct pt_regs, a6)},
+	{DBG_REG_A7, GDB_SIZEOF_REG, offsetof(struct pt_regs, a7)},
+	{DBG_REG_S2, GDB_SIZEOF_REG, offsetof(struct pt_regs, s2)},
+	{DBG_REG_S3, GDB_SIZEOF_REG, offsetof(struct pt_regs, s3)},
+	{DBG_REG_S4, GDB_SIZEOF_REG, offsetof(struct pt_regs, s4)},
+	{DBG_REG_S5, GDB_SIZEOF_REG, offsetof(struct pt_regs, s5)},
+	{DBG_REG_S6, GDB_SIZEOF_REG, offsetof(struct pt_regs, s6)},
+	{DBG_REG_S7, GDB_SIZEOF_REG, offsetof(struct pt_regs, s7)},
+	{DBG_REG_S8, GDB_SIZEOF_REG, offsetof(struct pt_regs, s8)},
+	{DBG_REG_S9, GDB_SIZEOF_REG, offsetof(struct pt_regs, s9)},
+	{DBG_REG_S10, GDB_SIZEOF_REG, offsetof(struct pt_regs, s10)},
+	{DBG_REG_S11, GDB_SIZEOF_REG, offsetof(struct pt_regs, s11)},
+	{DBG_REG_T3, GDB_SIZEOF_REG, offsetof(struct pt_regs, t3)},
+	{DBG_REG_T4, GDB_SIZEOF_REG, offsetof(struct pt_regs, t4)},
+	{DBG_REG_T5, GDB_SIZEOF_REG, offsetof(struct pt_regs, t5)},
+	{DBG_REG_T6, GDB_SIZEOF_REG, offsetof(struct pt_regs, t6)},
+	{DBG_REG_EPC, GDB_SIZEOF_REG, offsetof(struct pt_regs, epc)},
+};
+
+char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
+{
+	if (regno >= DBG_MAX_REG_NUM || regno < 0)
+		return NULL;
+
+	if (dbg_reg_def[regno].offset != -1)
+		memcpy(mem, (void *)regs + dbg_reg_def[regno].offset,
+		       dbg_reg_def[regno].size);
+	else
+		memset(mem, 0, dbg_reg_def[regno].size);
+	return dbg_reg_def[regno].name;
+}
+
+int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
+{
+	if (regno >= DBG_MAX_REG_NUM || regno < 0)
+		return -EINVAL;
+
+	if (dbg_reg_def[regno].offset != -1)
+		memcpy((void *)regs + dbg_reg_def[regno].offset, mem,
+		       dbg_reg_def[regno].size);
+	return 0;
+}
+
+void
+sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *task)
+{
+	/* Initialize to zero */
+	memset((char *)gdb_regs, 0, NUMREGBYTES);
+
+	gdb_regs[DBG_REG_SP_OFF] = task->thread.sp;
+	gdb_regs[DBG_REG_FP_OFF] = task->thread.s[0];
+	gdb_regs[DBG_REG_S1_OFF] = task->thread.s[1];
+	gdb_regs[DBG_REG_S2_OFF] = task->thread.s[2];
+	gdb_regs[DBG_REG_S3_OFF] = task->thread.s[3];
+	gdb_regs[DBG_REG_S4_OFF] = task->thread.s[4];
+	gdb_regs[DBG_REG_S5_OFF] = task->thread.s[5];
+	gdb_regs[DBG_REG_S6_OFF] = task->thread.s[6];
+	gdb_regs[DBG_REG_S7_OFF] = task->thread.s[7];
+	gdb_regs[DBG_REG_S8_OFF] = task->thread.s[8];
+	gdb_regs[DBG_REG_S9_OFF] = task->thread.s[10];
+	gdb_regs[DBG_REG_S10_OFF] = task->thread.s[11];
+	gdb_regs[DBG_REG_EPC_OFF] = task->thread.ra;
+}
+
+void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
+{
+	regs->epc = pc;
+}
+
+static inline void kgdb_arch_update_addr(struct pt_regs *regs,
+					 char *remcom_in_buffer)
+{
+	unsigned long addr;
+	char *ptr;
+
+	ptr = &remcom_in_buffer[1];
+	if (kgdb_hex2long(&ptr, &addr))
+		regs->epc = addr;
+}
+
+int kgdb_arch_handle_exception(int vector, int signo, int err_code,
+			       char *remcom_in_buffer, char *remcom_out_buffer,
+			       struct pt_regs *regs)
+{
+	int err = 0;
+
+	switch (remcom_in_buffer[0]) {
+	case 'c':
+	case 'D':
+	case 'k':
+		if (remcom_in_buffer[0] == 'c')
+			kgdb_arch_update_addr(regs, remcom_in_buffer);
+		atomic_set(&kgdb_cpu_doing_single_step, -1);
+		kgdb_single_step = 0;
+		break;
+	default:
+		err = -1;
+	}
+
+	return err;
+}
+
+int kgdb_riscv_kgdbbreak(unsigned long addr)
+{
+	if (atomic_read(&kgdb_setting_breakpoint))
+		if (addr == (unsigned long)&kgdb_compiled_break)
+			return KGDB_COMPILED_BREAK;
+
+	return kgdb_has_hit_break(addr);
+}
+
+static int kgdb_riscv_notify(struct notifier_block *self, unsigned long cmd,
+			     void *ptr)
+{
+	struct die_args *args = (struct die_args *)ptr;
+	struct pt_regs *regs = args->regs;
+	unsigned long flags;
+	int type;
+
+	if (user_mode(regs))
+		return NOTIFY_DONE;
+
+	type = kgdb_riscv_kgdbbreak(regs->epc);
+	if (type == NOT_KGDB_BREAK && cmd == DIE_TRAP)
+		return NOTIFY_DONE;
+
+	local_irq_save(flags);
+	if (kgdb_handle_exception(1, args->signr, cmd, regs))
+		return NOTIFY_DONE;
+
+	if (type == KGDB_COMPILED_BREAK)
+		regs->epc += 4;
+
+	local_irq_restore(flags);
+
+	return NOTIFY_STOP;
+}
+
+static struct notifier_block kgdb_notifier = {
+	.notifier_call = kgdb_riscv_notify,
+};
+
+int kgdb_arch_init(void)
+{
+	register_die_notifier(&kgdb_notifier);
+
+	return 0;
+}
+
+void kgdb_arch_exit(void)
+{
+	unregister_die_notifier(&kgdb_notifier);
+}
+
+/*
+ * Global data
+ */
+#ifdef CONFIG_RISCV_ISA_C
+const struct kgdb_arch arch_kgdb_ops = {
+	.gdb_bpt_instr = {0x02, 0x90},	/* c.ebreak */
+};
+#else
+const struct kgdb_arch arch_kgdb_ops = {
+	.gdb_bpt_instr = {0x73, 0x00, 0x10, 0x00},	/* ebreak */
+};
+#endif
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f4cad5163bf2..7e017c2131cf 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -125,6 +125,11 @@ asmlinkage __visible void do_trap_break(struct pt_regs *regs)
 {
 	if (user_mode(regs))
 		force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->epc);
+#ifdef CONFIG_KGDB
+	else if (notify_die(DIE_TRAP, "EBREAK", regs, 0, regs->cause, SIGTRAP)
+								== NOTIFY_STOP)
+		return;
+#endif
 	else if (report_bug(regs->epc, regs) == BUG_TRAP_TYPE_WARN)
 		regs->epc += get_break_insn_length(regs->epc);
 	else
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
