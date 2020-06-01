Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3088A1E9C58
	for <lists+kgdb-bugreport@lfdr.de>; Mon,  1 Jun 2020 06:06:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jfbiG-00040g-0u
	for lists+kgdb-bugreport@lfdr.de; Mon, 01 Jun 2020 04:06:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jfbiE-00040S-LO
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9R35bhp9wOMsOfqu7C7Ex549gBWsaOIaUsg0Jdgmxuc=; b=LyUpS0wu3eiyD40gn6z/FKfXQv
 xaJ/Ue3k6xSrNH9nqSG2PgB61ngAcc9EIj5skwsUQaDk0ZeVOSK/F6Rwi2/IDsXmAsErIvD5hq0S0
 2CW3MoJ1huE9hrVSxnw64YDubS5uAgx3w7SZPHlz3krVoIyARQ68xRS1EwK/wcOALiZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9R35bhp9wOMsOfqu7C7Ex549gBWsaOIaUsg0Jdgmxuc=; b=MyO3IbbZWb/9pS/YXBPPwdegZQ
 l6EXGC/YEZNHb06IeCN32Qu0+XW+Vcsl+BhtQjlIQBomvbn6OUz/+/zUEqa2/+zNPmCHOMkbE4i9/
 DgBrCGC0t1x/JtZi1+bhIDV+UTYNkuPQIqL8e5CwQ13a75IsZMd3zb+S2g77RhlDktrE=;
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jfbiA-00GAd1-1f
 for kgdb-bugreport@lists.sourceforge.net; Mon, 01 Jun 2020 04:06:10 +0000
Received: by mail-oi1-f177.google.com with SMTP id l6so7885993oic.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 31 May 2020 21:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9R35bhp9wOMsOfqu7C7Ex549gBWsaOIaUsg0Jdgmxuc=;
 b=f+sXrWpgo5tcm9HgCpaIDwO4TaPacCQtJJvL6/HJ9+JK0F0sNwiyPEDe2yhKj5+EeN
 jJQySI9vYVOFEf71RzwLwrfZ5Wz4HegkLS1MzbIS8WXIfpkiUQLMc/0VpUnOM0CJ6B/B
 kQJaufifIG41HKnGvcVhMmmPYe9DCWLdobzvwJBGiDNeURLe5jnUt+DtZf4pPAOWomH0
 w/BHuJVmpVfVysJiRQqjXhTfe3iOEU8s6pVDe3+9l8y403Mf1aKnTZ8Ub6oWnX9SKvx2
 i8uso5GFQFMNwipv+lKVhDGr1EVd9c0uIpIkpR84ohhg9WgvvIlPWH1+DCpaEXh1VY7L
 6VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9R35bhp9wOMsOfqu7C7Ex549gBWsaOIaUsg0Jdgmxuc=;
 b=qmWP1nYTJ1AeU5x/ZPktNeBgqvO7CdNIimjKWdYgJJz8guxzxG9llwFcRhLh1Q+1jT
 ZyR4T9zU0upjY1280PO9N8iEARcuw/owp1bDMVSz1TggpT9U4hvgM23m5QaopFRP2Mk2
 wUfSfFQNnAiVJRwnUw1gROlFVh7dwsNWMNBnxjiy+YVN3O99IQ0BkV2zlyGl3gM760v8
 K1K4PCvjvqr7n9+auxNFHOhFwbA8cuGQgtF0vT4J7JFbVUIuM5qAQwZ3f6L677yowjLq
 BjqU1crmrdfgjIH/SjUs0t0lk4c9mO+g3g4a87wLW7LbRZRzENXVgjsrv1FKXB8bo+is
 WYGw==
X-Gm-Message-State: AOAM533msg5h+SWvthe/nfv/d7i44ragHSthXyGCr8GgJR30YlQBAGrN
 VMBlxMCXUbVRPWkyA99aa+/XrB8cJ+Y=
X-Google-Smtp-Source: ABdhPJzMbHWMrql4TwE1IweM27kqF51Ry+ehCvY4LaqufRYaEIxBJfKwGBgVgZAxJZKkh/hOrVdg7w==
X-Received: by 2002:a17:90a:64c9:: with SMTP id
 i9mr157695pjm.135.1590982805644; 
 Sun, 31 May 2020 20:40:05 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (2001-b400-e3df-96c7-30f0-f751-b645-f4e3.emome-ip6.hinet.net.
 [2001:b400:e3df:96c7:30f0:f751:b645:f4e3])
 by smtp.gmail.com with ESMTPSA id a7sm13102527pfa.187.2020.05.31.20.40.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 31 May 2020 20:40:05 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Date: Mon,  1 Jun 2020 11:39:10 +0800
Message-Id: <1590982751-13401-6-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
References: <1590982751-13401-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.177 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.177 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfbiA-00GAd1-1f
Subject: [Kgdb-bugreport] [V5 patch 5/6] riscv: Use the XML target
 descriptions to report 3 system registers
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

The $status, $badaddr, and $cause registers belong to the thread context,
so KGDB can obtain their contents from pt_regs in each trap. However, the
sequential number of these registers in the gdb register list is far from
the general-purpose registers. If riscv port uses the existing method to
report these three registers, many trivial registers with sequence numbers
in the middle of them will also be packaged to the reply packets. To solve
this problem, the riscv port wants to introduce the GDB target description
mechanism to customize the reported register list. By the list, the KGDB
can ignore the intermediate registers and just reports the general-purpose
registers and these three system registers.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig               |   1 +
 arch/riscv/include/asm/gdb_xml.h | 116 +++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/kgdb.h    |  10 +++-
 arch/riscv/kernel/kgdb.c         |  15 +++++
 4 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/gdb_xml.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c12d471280f7..4f95c0ea24b1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -70,6 +70,7 @@ config RISCV
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
 	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_KGDB_QXFER_PKT
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/gdb_xml.h b/arch/riscv/include/asm/gdb_xml.h
new file mode 100644
index 000000000000..09342111f227
--- /dev/null
+++ b/arch/riscv/include/asm/gdb_xml.h
@@ -0,0 +1,116 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GDB_XML_H_
+#define __ASM_GDB_XML_H_
+
+const char riscv_gdb_stub_feature[64] =
+			"PacketSize=800;qXfer:features:read+;";
+
+static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
+
+#ifdef CONFIG_64BIT
+static const char gdb_xfer_read_cpuxml[39] =
+			"qXfer:features:read:riscv-64bit-cpu.xml";
+
+static const char riscv_gdb_stub_target_desc[256] =
+"l<?xml version=\"1.0\"?>"
+"<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+"<target>"
+"<xi:include href=\"riscv-64bit-cpu.xml\"/>"
+"</target>";
+
+static const char riscv_gdb_stub_cpuxml[2048] =
+"l<?xml version=\"1.0\"?>"
+"<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
+"<feature name=\"org.gnu.gdb.riscv.cpu\">"
+"<reg name=\""DBG_REG_ZERO"\" bitsize=\"64\" type=\"int\" regnum=\"0\"/>"
+"<reg name=\""DBG_REG_RA"\" bitsize=\"64\" type=\"code_ptr\"/>"
+"<reg name=\""DBG_REG_SP"\" bitsize=\"64\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_GP"\" bitsize=\"64\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_TP"\" bitsize=\"64\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_T0"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T1"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T2"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_FP"\" bitsize=\"64\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_S1"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A0"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A1"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A2"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A3"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A4"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A5"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A6"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A7"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S2"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S3"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S4"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S5"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S6"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S7"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S8"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S9"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S10"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S11"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T3"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T4"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T5"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T6"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_EPC"\" bitsize=\"64\" type=\"code_ptr\"/>"
+"<reg name=\""DBG_REG_STATUS"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_BADADDR"\" bitsize=\"64\" type=\"int\"/>"
+"<reg name=\""DBG_REG_CAUSE"\" bitsize=\"64\" type=\"int\"/>"
+"</feature>";
+#else
+static const char gdb_xfer_read_cpuxml[39] =
+			"qXfer:features:read:riscv-32bit-cpu.xml";
+
+static const char riscv_gdb_stub_target_desc[256] =
+"l<?xml version=\"1.0\"?>"
+"<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
+"<target>"
+"<xi:include href=\"riscv-32bit-cpu.xml\"/>"
+"</target>";
+
+static const char riscv_gdb_stub_cpuxml[2048] =
+"l<?xml version=\"1.0\"?>"
+"<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
+"<feature name=\"org.gnu.gdb.riscv.cpu\">"
+"<reg name=\""DBG_REG_ZERO"\" bitsize=\"32\" type=\"int\" regnum=\"0\"/>"
+"<reg name=\""DBG_REG_RA"\" bitsize=\"32\" type=\"code_ptr\"/>"
+"<reg name=\""DBG_REG_SP"\" bitsize=\"32\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_GP"\" bitsize=\"32\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_TP"\" bitsize=\"32\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_T0"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T1"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T2"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_FP"\" bitsize=\"32\" type=\"data_ptr\"/>"
+"<reg name=\""DBG_REG_S1"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A0"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A1"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A2"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A3"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A4"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A5"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A6"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_A7"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S2"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S3"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S4"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S5"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S6"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S7"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S8"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S9"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S10"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_S11"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T3"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T4"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T5"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_T6"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_EPC"\" bitsize=\"32\" type=\"code_ptr\"/>"
+"<reg name=\""DBG_REG_STATUS"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_BADADDR"\" bitsize=\"32\" type=\"int\"/>"
+"<reg name=\""DBG_REG_CAUSE"\" bitsize=\"32\" type=\"int\"/>"
+"</feature>";
+#endif
+#endif
diff --git a/arch/riscv/include/asm/kgdb.h b/arch/riscv/include/asm/kgdb.h
index a348efbf04d1..46677daf708b 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -7,7 +7,7 @@
 
 #define GDB_SIZEOF_REG sizeof(unsigned long)
 
-#define DBG_MAX_REG_NUM (33)
+#define DBG_MAX_REG_NUM (36)
 #define NUMREGBYTES ((DBG_MAX_REG_NUM) * GDB_SIZEOF_REG)
 #define CACHE_FLUSH_IS_SAFE     1
 #define BUFMAX                  2048
@@ -64,6 +64,9 @@ static inline void arch_kgdb_breakpoint(void)
 #define DBG_REG_T5 "t5"
 #define DBG_REG_T6 "t6"
 #define DBG_REG_EPC "pc"
+#define DBG_REG_STATUS "sstatus"
+#define DBG_REG_BADADDR "stval"
+#define DBG_REG_CAUSE "scause"
 
 #define DBG_REG_ZERO_OFF 0
 #define DBG_REG_RA_OFF 1
@@ -101,5 +104,10 @@ static inline void arch_kgdb_breakpoint(void)
 #define DBG_REG_STATUS_OFF 33
 #define DBG_REG_BADADDR_OFF 34
 #define DBG_REG_CAUSE_OFF 35
+
+extern const char riscv_gdb_stub_feature[64];
+
+#define kgdb_arch_gdb_stub_feature riscv_gdb_stub_feature
+
 #endif
 #endif
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index e6b1f989f704..3b7276cadbe3 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -10,6 +10,7 @@
 #include <linux/irqflags.h>
 #include <linux/string.h>
 #include <asm/cacheflush.h>
+#include <asm/gdb_xml.h>
 
 enum {
 	NOT_KGDB_BREAK = 0,
@@ -51,6 +52,9 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	{DBG_REG_T5, GDB_SIZEOF_REG, offsetof(struct pt_regs, t5)},
 	{DBG_REG_T6, GDB_SIZEOF_REG, offsetof(struct pt_regs, t6)},
 	{DBG_REG_EPC, GDB_SIZEOF_REG, offsetof(struct pt_regs, epc)},
+	{DBG_REG_STATUS, GDB_SIZEOF_REG, offsetof(struct pt_regs, status)},
+	{DBG_REG_BADADDR, GDB_SIZEOF_REG, offsetof(struct pt_regs, badaddr)},
+	{DBG_REG_CAUSE, GDB_SIZEOF_REG, offsetof(struct pt_regs, cause)},
 };
 
 char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
@@ -103,6 +107,17 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 	regs->epc = pc;
 }
 
+void kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
+				char *remcom_out_buffer)
+{
+	if (!strncmp(remcom_in_buffer, gdb_xfer_read_target,
+		     sizeof(gdb_xfer_read_target)))
+		strcpy(remcom_out_buffer, riscv_gdb_stub_target_desc);
+	else if (!strncmp(remcom_in_buffer, gdb_xfer_read_cpuxml,
+			  sizeof(gdb_xfer_read_cpuxml)))
+		strcpy(remcom_out_buffer, riscv_gdb_stub_cpuxml);
+}
+
 static inline void kgdb_arch_update_addr(struct pt_regs *regs,
 					 char *remcom_in_buffer)
 {
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
