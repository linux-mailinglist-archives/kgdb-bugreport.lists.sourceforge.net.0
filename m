Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4FE912294
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 12:37:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKbe8-0001w6-65
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 10:37:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengzengkai@huawei.com>) id 1sKIIu-0007As-J9
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Jun 2024 13:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=meCZsXasSK5ysPre2L4XAlOZjGIH3AkaUcAhY/FiadM=; b=B1rt08OQEHt6uJsLO8L7d3z36l
 51Fj3wkrSbmw46JjZzO+gzCSqu2lJlCdg7XXg/vQETmMtOfRAaWsK+N+6SWgGl1EbXcp037bYaooY
 n0pVlYlNoYzU4LC1uye3WGHVEef+yhiT+5oPv8anR2zbOTmPt5NLnpTJTpzIkT2HaCqw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=meCZsXasSK5ysPre2L4XAlOZjGIH3AkaUcAhY/FiadM=; b=k
 XByCowG0M9Mlyp0Jfbj29wC2MeO1+rFraTcuLObqKE0whbbCW+LXXfimE7jJ3Y9xpIJap0PsDx/S4
 8te8KeQqu12sA84jQHxIOJ1MgMpo9XiZ8omDSbCO5CVyt0WzW2B6obs0ZjxAc2ZMAaHElq1T1rsk9
 h02Efwv2HsxuRGMo=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKIIt-0008IZ-9k for kgdb-bugreport@lists.sourceforge.net;
 Thu, 20 Jun 2024 13:58:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4W4hmF25Dxz1N7vY;
 Thu, 20 Jun 2024 21:53:49 +0800 (CST)
Received: from kwepemd200010.china.huawei.com (unknown [7.221.188.124])
 by mail.maildlp.com (Postfix) with ESMTPS id A2D1C140123;
 Thu, 20 Jun 2024 21:58:05 +0800 (CST)
Received: from huawei.com (10.175.113.25) by kwepemd200010.china.huawei.com
 (7.221.188.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 20 Jun
 2024 21:58:04 +0800
To: <jason.wessel@windriver.com>, <daniel.thompson@linaro.org>,
 <dianders@chromium.org>
Date: Thu, 20 Jun 2024 22:21:32 +0800
Message-ID: <20240620142132.157518-1-zhengzengkai@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200010.china.huawei.com (7.221.188.124)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit cf8e8658100d ("arch: Remove Itanium (IA-64)
 architecture")
 removed the only definition of macro _TIF_MCA_INIT, so kdb_curr_task() is
 actually the same as curr_task() now and becomes redundant. 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.255 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.255 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.255 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sKIIt-0008IZ-9k
X-Mailman-Approved-At: Fri, 21 Jun 2024 10:37:30 +0000
Subject: [Kgdb-bugreport] [PATCH RESEND] kdb: Get rid of redundant
 kdb_curr_task()
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
From: Zheng Zengkai via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Zheng Zengkai <zhengzengkai@huawei.com>
Cc: pmladek@suse.com, zhengzengkai@huawei.com,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 thorsten.blum@toblux.com, christophe.jaillet@wanadoo.fr,
 yuran.pereira@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
removed the only definition of macro _TIF_MCA_INIT, so kdb_curr_task()
is actually the same as curr_task() now and becomes redundant.

Let's remove the definition of kdb_curr_task() and replace remaining
calls with curr_task().

Signed-off-by: Zheng Zengkai <zhengzengkai@huawei.com>
---
 kernel/debug/kdb/kdb_bt.c      |  2 +-
 kernel/debug/kdb/kdb_main.c    | 18 ++++--------------
 kernel/debug/kdb/kdb_private.h |  2 --
 3 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 10b454554ab0..137ba73f56fc 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -144,7 +144,7 @@ kdb_bt(int argc, const char **argv)
 			kdb_ps_suppressed();
 		/* Run the active tasks first */
 		for_each_online_cpu(cpu) {
-			p = kdb_curr_task(cpu);
+			p = curr_task(cpu);
 			if (kdb_bt1(p, mask, btaprompt))
 				return 0;
 		}
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 664bae55f2c9..f5f7d7fb5936 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -155,16 +155,6 @@ static char *__env[31] = {
 
 static const int __nenv = ARRAY_SIZE(__env);
 
-struct task_struct *kdb_curr_task(int cpu)
-{
-	struct task_struct *p = curr_task(cpu);
-#ifdef	_TIF_MCA_INIT
-	if ((task_thread_info(p)->flags & _TIF_MCA_INIT) && KDB_TSK(cpu))
-		p = krp->p;
-#endif
-	return p;
-}
-
 /*
  * Update the permissions flags (kdb_cmd_enabled) to match the
  * current lockdown state.
@@ -1228,7 +1218,7 @@ static int kdb_local(kdb_reason_t reason, int error, struct pt_regs *regs,
 	char *cmdbuf;
 	int diag;
 	struct task_struct *kdb_current =
-		kdb_curr_task(raw_smp_processor_id());
+		curr_task(raw_smp_processor_id());
 
 	KDB_DEBUG_STATE("kdb_local 1", reason);
 
@@ -2278,7 +2268,7 @@ void kdb_ps_suppressed(void)
 	unsigned long cpu;
 	const struct task_struct *p, *g;
 	for_each_online_cpu(cpu) {
-		p = kdb_curr_task(cpu);
+		p = curr_task(cpu);
 		if (kdb_task_state(p, "-"))
 			++idle;
 	}
@@ -2314,7 +2304,7 @@ void kdb_ps1(const struct task_struct *p)
 		   kdb_task_has_cpu(p), kdb_process_cpu(p),
 		   kdb_task_state_char(p),
 		   (void *)(&p->thread),
-		   p == kdb_curr_task(raw_smp_processor_id()) ? '*' : ' ',
+		   p == curr_task(raw_smp_processor_id()) ? '*' : ' ',
 		   p->comm);
 	if (kdb_task_has_cpu(p)) {
 		if (!KDB_TSK(cpu)) {
@@ -2350,7 +2340,7 @@ static int kdb_ps(int argc, const char **argv)
 	for_each_online_cpu(cpu) {
 		if (KDB_FLAG(CMD_INTERRUPT))
 			return 0;
-		p = kdb_curr_task(cpu);
+		p = curr_task(cpu);
 		if (kdb_task_state(p, mask))
 			kdb_ps1(p);
 	}
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index 548fd4059bf9..d2520d72b1f5 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -210,8 +210,6 @@ extern void kdb_gdb_state_pass(char *buf);
 #define KDB_TSK(cpu) kgdb_info[cpu].task
 #define KDB_TSKREGS(cpu) kgdb_info[cpu].debuggerinfo
 
-extern struct task_struct *kdb_curr_task(int);
-
 #define kdb_task_has_cpu(p) (task_curr(p))
 
 #define GFP_KDB (in_dbg_master() ? GFP_ATOMIC : GFP_KERNEL)
-- 
2.20.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
