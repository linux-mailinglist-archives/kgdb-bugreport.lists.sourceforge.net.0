Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6619A348D57
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 25 Mar 2021 10:48:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lPMbY-0005Ut-Oz
	for lists+kgdb-bugreport@lfdr.de; Thu, 25 Mar 2021 09:48:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lPMbW-0005Uf-Un
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Mar 2021 09:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CU5aVwO4hOksRXJAS6rMMVaEFRlnvSKQOotnYJMxE14=; b=VFxKMPkv0zCfimEZRlsj7QHxn4
 ajovkhEm/oZBokAHwnncPjG1Irb8VdaiVODfaKmiP++esiF2xRfHSS89w2rcU31GkldQUUjgkOacK
 jrmFIpvQsS8/h8Q66EgJUCHXoCeNdPO/G//LJArGCLRxJJzLMYC9xFH6e3dhXIHVhi+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CU5aVwO4hOksRXJAS6rMMVaEFRlnvSKQOotnYJMxE14=; b=b
 +oHoU2Pg3XIys5Rc4KPWwboIqtSlTN14fY6KHNNIX7l0DcfmCo8VhyG3t+detjBbvGQA29IbnpWF7
 w9QlBqcSWWMUu//BnN92FdKTdJa9GzofQkSyy/FcelpTIDtwXwHqSIozb3b7KkTPFUC6NVnQTg4xj
 o1nsaaSNkWiEwFlg=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lPMbR-0004jF-Az
 for kgdb-bugreport@lists.sourceforge.net; Thu, 25 Mar 2021 09:48:38 +0000
Received: by mail-ed1-f43.google.com with SMTP id bf3so1677969edb.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 25 Mar 2021 02:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CU5aVwO4hOksRXJAS6rMMVaEFRlnvSKQOotnYJMxE14=;
 b=IMO46dz1d0HsuvWoLbGPuZCVchugXStTPnECL4PZFBDYPCj/UrGrZcMudrRUkEXTEB
 rtisFYROWxSBTxlyzvmvgJnn6Mn+X+vjzQyNPeEo2tw5A3Xaq+k+4Y4vkQhktX03bBX0
 qiClEiWlO+YhLLb4ItXgPwkno0lDBMwV21X0BUaEl+5MkiDCqDDI0Gl3H0u/ne+D0FfL
 87HaoPNh0V4FtQay+53cS/dZcMHXP2uRSXR43YtCROtgSBH3GmuNDILF0JgIIkaAmj9j
 ZKtGZbpB67lhX8GO/rNUkdiRrJUQcVkMG3QK3JN5i42/nh951gfTxKSLz8jq7y/H7byL
 Sp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CU5aVwO4hOksRXJAS6rMMVaEFRlnvSKQOotnYJMxE14=;
 b=IWxfoDK5fQYBGV9+7u7OSV5Xg54SY+qaNLtHwrrydvbopoi2oaOoUqR4pzAEeH6WWr
 qdyX5S8wOBii3hxoqe90wsefClLqk/U7ww2i7tus7lqCTgnDz9QX14rWqP66cjfb7SmN
 x+0Jd8K+n7HRNkrSfx1+VAiXYJZhTHLE/D48AMDEiu6H9sfkA0QA7QrGrzZgXlJ5Ja+x
 z+rABLyASl/iEUZ+t7RmTh8myA6KgnqS1q/Lh2MYzpSz2X+8Y1mkUp7ehkN3mLtxAmFj
 zlOU32876Aj22YpJE3xTGM9/WHPFojBgx/KXWLocmW/ybmLQtRDOJpBmScpr6lccxlEh
 xZSA==
X-Gm-Message-State: AOAM5321vX93b7WwYpM1dFkGHPpGUi52iiWu2kKuHPqdQ/qDcDSXQiWB
 3gavih9cWebjmW8+TF7FnrGaEw==
X-Google-Smtp-Source: ABdhPJz1ZAjDVKR+dTVzswPMaI1j4qGh228Q0GARWAV4LDHA/bqkczDeqVxue+PevorUnYoPNGT6cA==
X-Received: by 2002:aa7:d5c9:: with SMTP id d9mr8467375eds.102.1616665706900; 
 Thu, 25 Mar 2021 02:48:26 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id b4sm2161596eja.47.2021.03.25.02.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 02:48:26 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net
Date: Thu, 25 Mar 2021 09:48:07 +0000
Message-Id: <20210325094807.3546702-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lPMbR-0004jF-Az
Subject: [Kgdb-bugreport] [PATCH] kgdbts: Switch to do_sys_openat2() for
 breakpoint testing
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kgdbts can get stuck waiting for do_sys_open() to be called
in some of the current tests. This is because C compilers often
automatically inline this function, which is a very thin wrapper around
do_sys_openat2(), into some of its callers. gcc-10 does this on (at least)
both x86 and arm64.

We can fix the test suite by placing the breakpoints on do_sys_openat2()
instead since that isn't (currently) inlined. However do_sys_openat2() is
a static function so we cannot simply use an addressof. Since we are
testing debug machinery it is acceptable to use kallsyms to lookup a
suitable address because this is more or less what kdb does in the same
circumstances. Re-implement lookup_addr() to be based on kallsyms rather
than function pointers.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Notes:
    So less than a week ago I said I had nothing pending for kgdbts.
    That was entirely true when I said it... but then this came up.

 drivers/misc/kgdbts.c | 48 ++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 945701bce5536..2679374ca8361 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -92,6 +92,7 @@
 #include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/sched/task.h>
+#include <linux/kallsyms.h>

 #include <asm/sections.h>

@@ -200,21 +201,30 @@ static noinline void kgdbts_break_test(void)
 	v2printk("kgdbts: breakpoint complete\n");
 }

-/* Lookup symbol info in the kernel */
+/*
+ * This is a cached wrapper for kallsyms_lookup_name().
+ *
+ * The cache is a big win for several tests. For example it more the doubles
+ * the cycles per second during the sys_open test. This is not theoretic,
+ * the performance improvement shows up at human scale, especially when
+ * testing using emulators.
+ *
+ * Obviously neither re-entrant nor thread-safe but that is OK since it
+ * can only be called from the debug trap (and therefore all other CPUs
+ * are halted).
+ */
 static unsigned long lookup_addr(char *arg)
 {
-	unsigned long addr = 0;
-
-	if (!strcmp(arg, "kgdbts_break_test"))
-		addr = (unsigned long)kgdbts_break_test;
-	else if (!strcmp(arg, "sys_open"))
-		addr = (unsigned long)do_sys_open;
-	else if (!strcmp(arg, "kernel_clone"))
-		addr = (unsigned long)kernel_clone;
-	else if (!strcmp(arg, "hw_break_val"))
-		addr = (unsigned long)&hw_break_val;
-	addr = (unsigned long) dereference_function_descriptor((void *)addr);
-	return addr;
+	static char cached_arg[KSYM_NAME_LEN];
+	static unsigned long cached_addr;
+
+	if (strcmp(arg, cached_arg)) {
+		strscpy(cached_arg, arg, KSYM_NAME_LEN);
+		cached_addr = kallsyms_lookup_name(arg);
+	}
+
+	return (unsigned long)dereference_function_descriptor(
+			(void *)cached_addr);
 }

 static void break_helper(char *bp_type, char *arg, unsigned long vaddr)
@@ -310,7 +320,7 @@ static int check_and_rewind_pc(char *put_str, char *arg)

 	if (arch_needs_sstep_emulation && sstep_addr &&
 	    ip + offset == sstep_addr &&
-	    ((!strcmp(arg, "sys_open") || !strcmp(arg, "kernel_clone")))) {
+	    ((!strcmp(arg, "do_sys_openat2") || !strcmp(arg, "kernel_clone")))) {
 		/* This is special case for emulated single step */
 		v2printk("Emul: rewind hit single step bp\n");
 		restart_from_top_after_write = 1;
@@ -619,14 +629,14 @@ static struct test_struct do_kernel_clone_test[] = {
  */
 static struct test_struct sys_open_test[] = {
 	{ "?", "S0*" }, /* Clear break points */
-	{ "sys_open", "OK", sw_break, }, /* set sw breakpoint */
+	{ "do_sys_openat2", "OK", sw_break, }, /* set sw breakpoint */
 	{ "c", "T0*", NULL, get_thread_id_continue }, /* Continue */
-	{ "sys_open", "OK", sw_rem_break }, /*remove breakpoint */
-	{ "g", "sys_open", NULL, check_and_rewind_pc }, /* check location */
+	{ "do_sys_openat2", "OK", sw_rem_break }, /*remove breakpoint */
+	{ "g", "do_sys_openat2", NULL, check_and_rewind_pc }, /* check location */
 	{ "write", "OK", write_regs, emul_reset }, /* Write registers */
 	{ "s", "T0*", emul_sstep_get, emul_sstep_put }, /* Single step */
-	{ "g", "sys_open", NULL, check_single_step },
-	{ "sys_open", "OK", sw_break, }, /* set sw breakpoint */
+	{ "g", "do_sys_openat2", NULL, check_single_step },
+	{ "do_sys_openat2", "OK", sw_break, }, /* set sw breakpoint */
 	{ "7", "T0*", skip_back_repeat_test }, /* Loop based on repeat_test */
 	{ "D", "OK", NULL, final_ack_set }, /* detach and unregister I/O */
 	{ "", "", get_cont_catch, put_cont_catch },

base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
--
2.29.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
