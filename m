Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A4F1A5BDC
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 12 Apr 2020 03:48:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jNRjK-0004dR-IJ
	for lists+kgdb-bugreport@lfdr.de; Sun, 12 Apr 2020 01:48:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jNRjI-0004dJ-81
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+oedu93ee4lBnDm/Q0/OOEeGi6QyaP6RZRVkOxDT3Y=; b=Iozq+TAZuTirozPWQ+FWCiuRti
 NlhIatbwvQOS2uF00p9ky7fr2AZrVD5iJPay9xH5r+GsVSSBm8bX4Fc2dAY9mv2K2PdxzlwFowdkd
 B2W72buV7ul9ixZVibk3u6hZSHbrwwBEFuMnVc9WNa29JD29f6YvQz3xdPuNq2VAX8mk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A+oedu93ee4lBnDm/Q0/OOEeGi6QyaP6RZRVkOxDT3Y=; b=mIpBqzDgm/vjR2zZxQScTu1jTG
 awTQt0zokQkGAwQgmvajcnaO6mq7AMxkUj9sAfWt/37bjaYfvnftgJtddrqJgXWL2Q2DtcSCUt9Kb
 4thhOL6niJrfHsTNTXTiS8FT2Zg1eogtk3/d33ZDo92pJrrwMf55AGxvauJJtNkcAhVI=;
Received: from mail-qv1-f65.google.com ([209.85.219.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jNRjD-00CLdo-KX
 for kgdb-bugreport@lists.sourceforge.net; Sun, 12 Apr 2020 01:48:12 +0000
Received: by mail-qv1-f65.google.com with SMTP id s18so2845196qvn.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 11 Apr 2020 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A+oedu93ee4lBnDm/Q0/OOEeGi6QyaP6RZRVkOxDT3Y=;
 b=bfGoqTX3asZVTxuEt1mjtWuXh+cM02cG8VIeObf//T6gjDhgCMiA3Dlld9oKhmVql8
 lbNJg+upbba3iA0gHXKxAnHn9Dpeq/JPXVHvvmlnw4Cl8n96fXkUWaYUo98vJ8pJ1Oy8
 bt+gHt0adxx+q1N8d0qTg2nvkyBKxuVc+eejz0BEggH0URYrxDrRD/wn39z89LsGqnoI
 9meYwUupLWlpifU60bz1McZ31rgyK9vGlshx/SzhwTaviomPrT/+SUoaVZhOHW2u5Uvy
 JomzOet7xAD14pWQD07NpGVMXLeYXESHrV98Nb29/a3LXiIbMBIqnzMPdGufgwqujuZg
 Eqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A+oedu93ee4lBnDm/Q0/OOEeGi6QyaP6RZRVkOxDT3Y=;
 b=I3T6EIVSYrpo0mO7oKLyW4shPas7lsxMF/Rw0RaWSLpUmnV/SWjhzvNPrTY1uXy7/9
 oaBQDggX0OksJTJz3MGAIA01FANi0D/tEGTI7lQoD0ETayqLj7czG7yEBEqRjHiEXsfP
 0qQNjt8MoNZYSDrfpl8NvS6fZrKUrNB0sRh61dwD6Ijw5E+dTMNQnmEmmQIkvcGAOfnF
 OfcBP+BlRAt2sJIpIpn17KR50WKlMWG0qIHg2/96IJmroQ/xq7rn9o5T5LtYhHP85g3w
 w/A9pjru6wrUA9BZC7HnmvGVHkLZUakN5ZbAhKyYESypmh2fV/1jPuUm+1OFmwuUtFUy
 46LA==
X-Gm-Message-State: AGi0PubWI8Py/YO6Y9WRWx0FnW0AUBEC69wICrIMEBjovWYrHX/vEThq
 9NQb7UrgRHi+MxVTYs48EHer5FsxFoY=
X-Google-Smtp-Source: APiQypKqQrGXGJCj6/2G8NG6u3zg5TsvaOe4fYBrcprgQlA/QWCheAVDVs18AUN4LPSmPgeybc/Djg==
X-Received: by 2002:aa7:9471:: with SMTP id t17mr11716246pfq.272.1586655762986; 
 Sat, 11 Apr 2020 18:42:42 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id w90sm5252900pjj.2.2020.04.11.18.42.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Apr 2020 18:42:42 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: daniel.thompson@linaro.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Sun, 12 Apr 2020 09:42:00 +0800
Message-Id: <1586655721-22567-5-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
References: <1586655721-22567-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sifive.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jNRjD-00CLdo-KX
Subject: [Kgdb-bugreport] [PATCH v3 4/5] riscv: Use the XML target
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

The $sstatus, $badaddr, and $scause registers belong to the thread context,
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
---
 arch/riscv/Kconfig               |   1 +
 arch/riscv/include/asm/gdb_xml.h | 117 +++++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/kgdb.h    |   8 ++-
 arch/riscv/kernel/kgdb.c         |  15 +++++
 4 files changed, 140 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/gdb_xml.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7db9a81cda75..6730468e8b92 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -69,6 +69,7 @@ config RISCV
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
 	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_KGDB_QXFER_PKT
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/gdb_xml.h b/arch/riscv/include/asm/gdb_xml.h
new file mode 100644
index 000000000000..041b45f5b997
--- /dev/null
+++ b/arch/riscv/include/asm/gdb_xml.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GDB_XML_H_
+#define __ASM_GDB_XML_H_
+
+#define kgdb_arch_gdb_stub_feature riscv_gdb_stub_feature
+static const char riscv_gdb_stub_feature[64] =
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
index 69bc6a03081d..6c35a853940d 100644
--- a/arch/riscv/include/asm/kgdb.h
+++ b/arch/riscv/include/asm/kgdb.h
@@ -7,7 +7,7 @@
 
 #define GDB_SIZEOF_REG sizeof(unsigned long)
 
-#define DBG_MAX_REG_NUM (33)
+#define DBG_MAX_REG_NUM (36)
 #define NUMREGBYTES ((DBG_MAX_REG_NUM) * GDB_SIZEOF_REG)
 #define CACHE_FLUSH_IS_SAFE     1
 #define BUFMAX                  2048
@@ -66,6 +66,9 @@ static inline void arch_kgdb_breakpoint(void)
 #define DBG_REG_T5 "t5"
 #define DBG_REG_T6 "t6"
 #define DBG_REG_EPC "pc"
+#define DBG_REG_STATUS "sstatus"
+#define DBG_REG_BADADDR "stval"
+#define DBG_REG_CAUSE "scause"
 
 #define DBG_REG_ZERO_OFF 0
 #define DBG_REG_RA_OFF 1
@@ -103,5 +106,8 @@ static inline void arch_kgdb_breakpoint(void)
 #define DBG_REG_STATUS_OFF 33
 #define DBG_REG_BADADDR_OFF 34
 #define DBG_REG_CAUSE_OFF 35
+
+#include <asm/gdb_xml.h>
+
 #endif
 #endif
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 6bdc0908a5b8..eb1afab47679 100644
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
