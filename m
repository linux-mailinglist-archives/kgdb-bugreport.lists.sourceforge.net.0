Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EF819AC7F
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  1 Apr 2020 15:17:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jJdFL-0007Vz-RF
	for lists+kgdb-bugreport@lfdr.de; Wed, 01 Apr 2020 13:17:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <vincent.chen@sifive.com>) id 1jJJ8B-0001iy-FN
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCrdA5MN5HDmRWvhIbKgvpcA6cTGCEaCr5RCmsDhzt4=; b=eB1R+DgcBzhERHIJKUclsA9b7p
 Ho1Khvt6edG4iGqEK9yl6fTaL8k2PhBa/wv8f5T2UF7a2rgGfGpVGDTHDc10s56hWZTH1YGus5C+D
 Njcx6tGTpOGMvsabeKn492CMbnej4hpD8vzAsofOWebbPg+YE4pkK10g6CzJte3f6Tdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCrdA5MN5HDmRWvhIbKgvpcA6cTGCEaCr5RCmsDhzt4=; b=lCRV2hKs0/jqE+HcWj3OGe1UIz
 /9T4uwRECMXCKemi8v4pOM6oWQyYZ7rY8uUKfg9V6aB+KSgmj10nircjhdOrxgFvvLRHUkYHoLvEU
 U1CJ2ZI6udPaf5d7fB0lisAn2UTIMhK5RICOwi09lT6QKw+BK1jTBgfADzzqvzaH2XG8=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jJJ87-0030Wz-R8
 for kgdb-bugreport@lists.sourceforge.net; Tue, 31 Mar 2020 15:48:47 +0000
Received: by mail-pj1-f67.google.com with SMTP id o12so1243132pjs.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 31 Mar 2020 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KCrdA5MN5HDmRWvhIbKgvpcA6cTGCEaCr5RCmsDhzt4=;
 b=HJCBmI7GnkpLrP2Erc3KSvfkZm7buD0Ff3pwuVK9tYeFTW7NJCn/BOKMx3h9ksZDHL
 P0IU8e/qovVIcdZk5MhhqhocWfkNZE3WYd1mr8Bekb0jfe/8Y2MfOFu0K7SwKYjF5VcW
 JhhiODWSWzafiqwUT/Ou557k5TLW72mlZ4Yx6q679P07Hq2sjQ2g0F5VzjIfA9F5ntQJ
 j5UvpduYJmfeK3r+U/fZmJ6qQaZclX/JdaaBDA2Tzgpa1zqRg1m36UPyQdtmQpFr5UfU
 BcoUXcWQrgi8aNMtJCloOOZVgqEVUWwtmjyk3FQvKRtt5gFUpBlOBigkAg/YxpEcRwWl
 qlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KCrdA5MN5HDmRWvhIbKgvpcA6cTGCEaCr5RCmsDhzt4=;
 b=gLvEKcLanOPtvdfXj4x0TcyChhON+HpP94W/8Ghi/hF+HvLdptchYfHQJF+HFeJMiu
 JPWKH11nRc0VZq10K9Qw0eZUHNilHGa0ZoD/4w3yaJiqIG+lcHuA2onUrOJy7Lojz8ru
 NFB8gEzlx6csk8+ssSOWh3XEUwiOPxFFGmDqf+eY1XQQ6jWexAjcEc2/NvcjutYUyWpS
 R12zmf0412JRYwSWnnkWIH4AqD62FQXacf3WxRLSYSx1Ugii0VJLrhUDzSjRuhsFG/6R
 v5xIOtxFxtt+WRhuWvSUBayjoO9Mv499QTzNTteZ+EPmv6A8pl9cRuYBJqr+BOLOpee2
 mfGA==
X-Gm-Message-State: AGi0PuaNdc5W8EH4LTUKKEvZ44THQLwEv6AqG3NlpkK6e7nB+ib2hyM9
 l2cFS38g17aNB09HaUNcqBkeRaQ8G0k=
X-Google-Smtp-Source: ADFU+vu08mJhRZrwFU3ewE6NnM/TxAQuIzDLmXciLGPMKlAFAO96OoXb9SPsFUotJ0K2W3sT8orJGA==
X-Received: by 2002:a62:160b:: with SMTP id 11mr19539005pfw.189.1585668223812; 
 Tue, 31 Mar 2020 08:23:43 -0700 (PDT)
Received: from localhost.localdomain (123-195-35-41.dynamic.kbronet.com.tw.
 [123.195.35.41])
 by smtp.gmail.com with ESMTPSA id g30sm12097660pgn.40.2020.03.31.08.23.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 31 Mar 2020 08:23:43 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, paul.walmsley@sifive.com, palmer@dabbelt.com
Date: Tue, 31 Mar 2020 23:23:10 +0800
Message-Id: <1585668191-16287-5-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
References: <1585668191-16287-1-git-send-email-vincent.chen@sifive.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jJJ87-0030Wz-R8
X-Mailman-Approved-At: Wed, 01 Apr 2020 13:17:31 +0000
Subject: [Kgdb-bugreport] [PATCH v2 4/5] riscv: Use the XML target
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
 arch/riscv/kernel/kgdb.c         |  14 +++++
 4 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/gdb_xml.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 108794f4aa45..94b6f301007c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -67,6 +67,7 @@ config RISCV
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_ARCH_KASAN if MMU && 64BIT
 	select HAVE_ARCH_KGDB
+	select ARCH_SUPPORTS_GDB_XML
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
diff --git a/arch/riscv/include/asm/gdb_xml.h b/arch/riscv/include/asm/gdb_xml.h
new file mode 100644
index 000000000000..1d1459d06a1b
--- /dev/null
+++ b/arch/riscv/include/asm/gdb_xml.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GDB_XML_H_
+#define __ASM_GDB_XML_H_
+
+#define arch_gdb_stub_feature riscv_gdb_stub_feature
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
index e3b1075c3935..86d891b7ea2c 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -7,6 +7,7 @@
 #include <linux/irqflags.h>
 #include <linux/string.h>
 #include <asm/cacheflush.h>
+#include <asm/gdb_xml.h>
 
 enum {
 	NOT_KGDB_BREAK = 0,
@@ -48,6 +49,9 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	{DBG_REG_T5, GDB_SIZEOF_REG, offsetof(struct pt_regs, t5)},
 	{DBG_REG_T6, GDB_SIZEOF_REG, offsetof(struct pt_regs, t6)},
 	{DBG_REG_EPC, GDB_SIZEOF_REG, offsetof(struct pt_regs, epc)},
+	{DBG_REG_STATUS, GDB_SIZEOF_REG, offsetof(struct pt_regs, status)},
+	{DBG_REG_BADADDR, GDB_SIZEOF_REG, offsetof(struct pt_regs, badaddr)},
+	{DBG_REG_CAUSE, GDB_SIZEOF_REG, offsetof(struct pt_regs, cause)},
 };
 
 char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
@@ -100,6 +104,16 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 	regs->epc = pc;
 }
 
+void arch_handle_qxfer_pkt(char *remcom_in_buffer, char *remcom_out_buffer)
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
