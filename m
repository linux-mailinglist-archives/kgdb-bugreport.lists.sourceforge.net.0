Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 194E81EF8E0
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Jun 2020 15:22:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jhCJ2-0003FS-U7
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Jun 2020 13:22:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jhCIs-0003Ej-HH
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Wd49qJJfphbkQd0zc5Sg32oNGChg1bIC5PBSadN6hM=; b=LIvb/AuJ7smEYlZmBhubAu1rIg
 ryUl+XgikW0+vGD6u+kELXCUSciE4bz2U2ZoOrpdpTdMRUCFugg+4PJeIWGm+pdN3Yy8PLA9FMZXA
 MgvkcFa4qB3v23BSl+ZmWSe8OeRfG0r6hP+ot4xc7HDzL6rwXSI41Pq20163hnrb4Rbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Wd49qJJfphbkQd0zc5Sg32oNGChg1bIC5PBSadN6hM=; b=QLmpm62yJPT+X4BG8D02hAop/Y
 rVjW/Req+gH/1uiQm7lCWhfJW457Bn3nOnyTXPxxa5+TCazrOjLA69BKDbvzU4iUeMoI07FOXYXJY
 FjpUrDwn2VNIHtVwvsc5SvI3sgYob3Yc5kCvmd2nN143eTuR7Ety70KqSzcqPwrgqd9o=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhCIo-006wqF-VI
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:34 +0000
Received: by mail-wr1-f66.google.com with SMTP id y17so9722425wrn.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Jun 2020 06:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Wd49qJJfphbkQd0zc5Sg32oNGChg1bIC5PBSadN6hM=;
 b=Ki1mWzQUC6JcLvWE/8DkDtIIdjhYtPuZOCRYcToxv8LWR6pRb4lGurJyBIOkPuorTR
 Bsi8zComYX+iO1sRCteKaKGKyFUrV6SX6hjPxqnASoH0k1DXUJXEKyc3HGx2ueMIE2qb
 uywx8D1qZVnXSdiKKLdwXvNKLMNFIU9Bu8JHD5HLksHo/nlTZTGo8jsu+Ah8CXeONqWi
 hvJhuA1ziakt2ACYLpIUSNY1wMXCd97jniit9A4a3KTg0apr2Lf0h7yCyZefMoacoO2C
 9q2d2vkvbL2DdSsZcTpTomTgUQeXMVAHG5xrferfVgiIys/NkQQv1KlcJViHEKl8u1a0
 kXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Wd49qJJfphbkQd0zc5Sg32oNGChg1bIC5PBSadN6hM=;
 b=gJNdsVjpkbTLo1HIwVIXaG+RJtJlMet5vY1b1okrhicr+j70bdBPIe9sVluEpNcL2I
 zTeP0Q75lleadtfUaiHn53R2NqFqxQqAkvDY/ZZuSQXZg/1BXI/xQU5Y3BhZLLpeG5cf
 Lcx/0FcDXNt9ILpGf0HLEFPWTQDNsHrrYffVi0OEH9JiBZtZ1dMJu4U+aHylxr4K52B6
 MF4frs+wP0xgmVG5plGqTrPvcoX6fPmU7U3TlBfY+VjAIEH00Xo6Rc7KR5zOXJV4ECAi
 UHs+VDSCajt8Sr9S4iiXGvnUwTn7kZlwWnUnnPo/3/Fexx3BfWfYwouHtuSASK8FOl8W
 rnvQ==
X-Gm-Message-State: AOAM5310Esk+wpqxqlojJ7C5iIOunFMqhmhMtnBJjQ8vNhnFuc1zRm6k
 20Cu/+qph24tMOB/bgyi6aKiFA==
X-Google-Smtp-Source: ABdhPJzpXOyKm+//aW91zcmMraLFE6hXoKeh/4G6ONWrnUgxSkq+Twz2EbRA9faf1wyV0IhllSZGdQ==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr9434014wrq.310.1591363344584; 
 Fri, 05 Jun 2020 06:22:24 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 1sm11419211wmz.13.2020.06.05.06.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:22:24 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri,  5 Jun 2020 14:21:28 +0100
Message-Id: <20200605132130.1411255-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200605132130.1411255-1-daniel.thompson@linaro.org>
References: <20200605132130.1411255-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jhCIo-006wqF-VI
Subject: [Kgdb-bugreport] [RFC PATCH 2/4] kgdb: Use the kprobe blacklist to
 limit single stepping
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, pmladek@suse.com,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 patches@linaro.org, linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

If we are running in a part of the kernel that dislikes breakpoint
debugging then it is very unlikely to be safe to single step. Add
some safety rails to prevent stepping through anything on the kprobe
blacklist.

As part of this kdb_ss() will no longer set the DOING_SS flags when it
requests a step. This is safe because this flag is already redundant,
returning KDB_CMD_SS is all that is needed to request a step (and this
saves us from having to unset the flag if the safety check fails).

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h        |  1 +
 kernel/debug/debug_core.c   | 13 +++++++++++++
 kernel/debug/gdbstub.c      | 10 +++++++++-
 kernel/debug/kdb/kdb_bp.c   |  8 ++------
 kernel/debug/kdb/kdb_main.c | 10 ++++++++--
 5 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index c62d76478adc..93b612d81714 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -213,6 +213,7 @@ extern void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc);
 
 /* Optional functions. */
 extern int kgdb_validate_break_address(unsigned long addr);
+extern int kgdb_validate_single_step_address(unsigned long addr);
 extern int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt);
 extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
 
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 81f56d616e04..4a2df4509fe1 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -215,6 +215,18 @@ int __weak kgdb_validate_break_address(unsigned long addr)
 	return err;
 }
 
+int __weak kgdb_validate_single_step_address(unsigned long addr)
+{
+	/*
+	 * Disallow stepping when we are executing code that is marked
+	 * as unsuitable for kprobing.
+	 */
+	if (within_kprobe_blacklist(addr))
+		return -EINVAL;
+
+	return 0;
+}
+
 unsigned long __weak kgdb_arch_pc(int exception, struct pt_regs *regs)
 {
 	return instruction_pointer(regs);
@@ -1192,6 +1204,7 @@ noinline void kgdb_breakpoint(void)
 	atomic_dec(&kgdb_setting_breakpoint);
 }
 EXPORT_SYMBOL_GPL(kgdb_breakpoint);
+NOKPROBE_SYMBOL(kgdb_breakpoint);
 
 static int __init opt_kgdb_wait(char *str)
 {
diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index 4b280fc7dd67..beb73a61a16d 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -1041,8 +1041,16 @@ int gdb_serial_stub(struct kgdb_state *ks)
 			if (tmp == 0)
 				break;
 			/* Fall through - on tmp < 0 */
-		case 'c': /* Continue packet */
 		case 's': /* Single step packet */
+			error = kgdb_validate_single_step_address(
+					kgdb_arch_pc(ks->ex_vector,
+						     ks->linux_regs));
+			if (error != 0) {
+				error_packet(remcom_out_buffer, error);
+				break;
+			}
+			fallthrough;
+		case 'c': /* Continue packet */
 			if (kgdb_contthread && kgdb_contthread != current) {
 				/* Can't switch threads in kgdb */
 				error_packet(remcom_out_buffer, -EINVAL);
diff --git a/kernel/debug/kdb/kdb_bp.c b/kernel/debug/kdb/kdb_bp.c
index ec4940146612..4853c413f579 100644
--- a/kernel/debug/kdb/kdb_bp.c
+++ b/kernel/debug/kdb/kdb_bp.c
@@ -507,18 +507,14 @@ static int kdb_bc(int argc, const char **argv)
  *	None.
  * Remarks:
  *
- *	Set the arch specific option to trigger a debug trap after the next
- *	instruction.
+ *	KDB_CMD_SS is a command that our caller acts on to effect the step.
  */
 
 static int kdb_ss(int argc, const char **argv)
 {
 	if (argc != 0)
 		return KDB_ARGCOUNT;
-	/*
-	 * Set trace flag and go.
-	 */
-	KDB_STATE_SET(DOING_SS);
+
 	return KDB_CMD_SS;
 }
 
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index ec190569f690..4b277c066f48 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1189,7 +1189,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 		     kdb_dbtrap_t db_result)
 {
 	char *cmdbuf;
-	int diag;
+	int diag, res;
 	struct task_struct *kdb_current =
 		kdb_curr_task(raw_smp_processor_id());
 
@@ -1346,10 +1346,16 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 		}
 		if (diag == KDB_CMD_GO
 		 || diag == KDB_CMD_CPU
-		 || diag == KDB_CMD_SS
 		 || diag == KDB_CMD_KGDB)
 			break;
 
+		if (diag == KDB_CMD_SS) {
+			res = kgdb_validate_single_step_address(instruction_pointer(regs));
+			if (res == 0)
+				break;
+			diag = res;
+		}
+
 		if (diag)
 			kdb_cmderror(diag);
 	}
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
