Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C041A2226C1
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Jul 2020 17:20:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jw5gK-0006qL-GZ
	for lists+kgdb-bugreport@lfdr.de; Thu, 16 Jul 2020 15:20:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jw5gI-0006qD-Br
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MA+kP4DlJmfdXBdpErlC9E+irTIJBNObkffFIf2y82I=; b=k8T0XtjLGzSKhlLBit+Mjv5iRI
 0oZjTY+f9N5A7q6MOQ66gt69yHyVo9TmtkKaQqa+bb6ATnyBkkIrEytgOPQsDnDZTWyUxzeguw2R4
 +6sSiUy+YDB7LszENI3bLdtAaSNCYdFnMazFTRB8MYU3UrkgULO4PHfJ+cn31LaBD87s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MA+kP4DlJmfdXBdpErlC9E+irTIJBNObkffFIf2y82I=; b=FbobUC7auUkYRVayNtoWpySqQk
 xYVT2Zi/zBCVaUEEUm4IdvpqX6WDdQX0Mq09F07zIOMkIAkZoY6yD2n1r9Egv14vro3+wxU7fnm3n
 8N1Ahp7acNYFl5NepD+lXLz7LcL54TgblYLfolqkUzjSmvF38m6ycO1F0xtQB2q0+ves=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jw5gD-00AaDo-Dh
 for kgdb-bugreport@lists.sourceforge.net; Thu, 16 Jul 2020 15:20:17 +0000
Received: by mail-wm1-f68.google.com with SMTP id j18so10653608wmi.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Jul 2020 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MA+kP4DlJmfdXBdpErlC9E+irTIJBNObkffFIf2y82I=;
 b=JqIq+nSSgbqT32taOoagK4GvW1IjeH/ECen5VaQpTPssRfgi2K/8DOcl6JBC0QxDeW
 L9hLCUvRYISHnV89d2sJRdD+6c5sxQkufYhP3jxVx68jsxG0TdCDZiP70lmDH+wZdRTC
 FznHjEsKE7OT6A1QXZ5HM+aeuVDeWOUeieYNavx54TIHRGrU3K6MgOS/grSopWEWTAaO
 hlCL5R4TMZFizDEe8gDbVEiz3XHHsc3Q22RNnsXKbadgu4t28iDUBY7TwTIPfdOnEURW
 2jL1tZurcc5gb75TDGPuPCEicPFYNSgzjJ08eexA4pnUfomSRpk/TrpZMqsicqzagoh1
 vmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MA+kP4DlJmfdXBdpErlC9E+irTIJBNObkffFIf2y82I=;
 b=mSBcVYD8Vuj4xBVW5wsR0A8Kd70hII+sKtGo5W9btBH1QUIhabXuubN0v08uaNG4gI
 v5JuVnWJbXqUPuDkgM3joVNmAJT0r0Ds0TlxKGL4Or8lJlUUIn0QaGgz2N3fSiRx+dho
 4OD+uTTcBhUM03ctNJAMhRmwhQdSc3WAModBK1n6pYRqoouEYhhuvRUcQUktytU+Ln33
 E9wKCVs/+m7/OeGL85lpHciKep6GpojyBycc4nXR4iKkBqihLl7B6J4Yu7j0H9devwL1
 cflQVHC9HBNujsseb1VpNG6EuSZf2yu8tAkTHhMAIVa2V/Ga2U0kvtAwWgacunmcbVAt
 e87g==
X-Gm-Message-State: AOAM530I3WGtf8U/1tNUbqPOo8bP9Jm51M2I+YLc9e6fPjrpan87FXSQ
 SU6nWgeqqVC6CEKxyytsuXNrwQ==
X-Google-Smtp-Source: ABdhPJwWZzro9ckYK2greM7KjTK8oMd0961HXp/aw47Rj9PySVK21oCV8YKb2OYPEOZ0KHUJkUyCTw==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr4799097wmj.136.1594912807056; 
 Thu, 16 Jul 2020 08:20:07 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u17sm9877687wrp.70.2020.07.16.08.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 08:20:06 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 16 Jul 2020 16:19:42 +0100
Message-Id: <20200716151943.2167652-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200716151943.2167652-1-daniel.thompson@linaro.org>
References: <20200716151943.2167652-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jw5gD-00AaDo-Dh
Subject: [Kgdb-bugreport] [PATCH v2 2/3] kgdb: Use the kprobe blocklist to
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
 Masami Hiramatsu <mhiramat@kernel.org>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

If we are running in a part of the kernel that dislikes breakpoint
debugging then it is very unlikely to be safe to single step. Add
some safety rails to prevent stepping through anything on the kprobe
blocklist.

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
index 7caba4604edc..aefe823998cb 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -214,6 +214,7 @@ extern void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc);
 
 /* Optional functions. */
 extern int kgdb_validate_break_address(unsigned long addr);
+extern int kgdb_validate_single_step_address(unsigned long addr);
 extern int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt);
 extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
 
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 133a361578dc..4b59bcc90c5d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -208,6 +208,19 @@ int __weak kgdb_validate_break_address(unsigned long addr)
 	return err;
 }
 
+int __weak kgdb_validate_single_step_address(unsigned long addr)
+{
+	/*
+	 * Disallow stepping when we are executing code that is marked
+	 * as unsuitable for breakpointing... stepping won't be safe
+	 * either!
+	 */
+	if (kgdb_within_blocklist(addr))
+		return -EINVAL;
+
+	return 0;
+}
+
 unsigned long __weak kgdb_arch_pc(int exception, struct pt_regs *regs)
 {
 	return instruction_pointer(regs);
diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index 61774aec46b4..f1c88007cc2b 100644
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
index 5c7949061671..cd40bf780b93 100644
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
