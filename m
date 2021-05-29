Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E28D2396EAD
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  1 Jun 2021 10:17:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lnzaP-0003yK-TM
	for lists+kgdb-bugreport@lfdr.de; Tue, 01 Jun 2021 08:17:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <thunder.leizhen@huawei.com>) id 1lmwkw-0001s1-TT
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 11:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yu4hVHCnqtWAWef74GkQWvsVWtNpQBoTnSPnAo0F2c0=; b=ggWKiCxiL0JJ2RdojO4fsqe198
 489a6yObF+7Jbw/eGlhPD+vRoWWpodp5LwksRQJQmDo0PMHyoMBch7Mxvi9d65Y5NjJClblwOCteP
 a49blLq+JatTqWjH2qs4ZTtYOAqsKCrv+w9lNpQ8GzWw4IeLt+hLEtL6nIVXq/UuBgtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yu4hVHCnqtWAWef74GkQWvsVWtNpQBoTnSPnAo0F2c0=; b=Eyb4kxGnPsaayozoi+JL1okiQX
 mF+rzxPuDLoRJ5BvQOD7Hy/jL6RrOqbysnXjAPyexsBeYrMBwOm3cPodkQWAciH1aViRaEftTpVrP
 O4URc5JjLeC6lIWLzMEXiJ8GmBhq5YaJKd6xrlHz+/lp2nCedgQOTw98GE+DNO38IDRY=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lmwkp-00005L-1K
 for kgdb-bugreport@lists.sourceforge.net; Sat, 29 May 2021 11:03:52 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FsdpW1r0YzWpxn;
 Sat, 29 May 2021 18:58:59 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 19:03:28 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 19:03:26 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jason Wessel <jason.wessel@windriver.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Balbir Singh <bsingharora@gmail.com>, Barry Song
 <song.bao.hua@hisilicon.com>, Christoph Hellwig <hch@lst.de>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, Eric Biederman <ebiederm@xmission.com>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "Steffen Klassert" <steffen.klassert@secunet.com>, Daniel Jordan
 <daniel.m.jordan@oracle.com>, Oleg Nesterov <oleg@redhat.com>, John Stultz
 <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, kgdb-bugreport
 <kgdb-bugreport@lists.sourceforge.net>, kexec <kexec@lists.infradead.org>,
 linux-crypto <linux-crypto@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Date: Sat, 29 May 2021 19:03:03 +0800
Message-ID: <20210529110305.9446-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210529110305.9446-1-thunder.leizhen@huawei.com>
References: <20210529110305.9446-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lmwkp-00005L-1K
X-Mailman-Approved-At: Tue, 01 Jun 2021 08:17:15 +0000
Subject: [Kgdb-bugreport] [PATCH v2 2/4] kgdb: Fix spelling mistakes
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Fix some spelling mistakes in comments:
initalization ==> initialization
detatch ==> detach
represntation ==> representation
hexidecimal ==> hexadecimal
delimeter ==> delimiter
architecure ==> architecture

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 include/linux/kgdb.h           | 8 ++++----
 kernel/debug/debug_core.c      | 2 +-
 kernel/debug/kdb/kdb_main.c    | 8 ++++----
 kernel/debug/kdb/kdb_private.h | 2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 392a3670944c..258cdde8d356 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -105,9 +105,9 @@ extern int dbg_set_reg(int regno, void *mem, struct pt_regs *regs);
  */
 
 /**
- *	kgdb_arch_init - Perform any architecture specific initalization.
+ *	kgdb_arch_init - Perform any architecture specific initialization.
  *
- *	This function will handle the initalization of any architecture
+ *	This function will handle the initialization of any architecture
  *	specific callbacks.
  */
 extern int kgdb_arch_init(void);
@@ -229,9 +229,9 @@ extern int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt);
 extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
 
 /**
- *	kgdb_arch_late - Perform any architecture specific initalization.
+ *	kgdb_arch_late - Perform any architecture specific initialization.
  *
- *	This function will handle the late initalization of any
+ *	This function will handle the late initialization of any
  *	architecture specific callbacks.  This is an optional function for
  *	handling things like late initialization of hw breakpoints.  The
  *	default implementation does nothing.
diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 4708aec492df..a1f26766eb90 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1032,7 +1032,7 @@ dbg_notify_reboot(struct notifier_block *this, unsigned long code, void *x)
 	/*
 	 * Take the following action on reboot notify depending on value:
 	 *    1 == Enter debugger
-	 *    0 == [the default] detatch debug client
+	 *    0 == [the default] detach debug client
 	 *   -1 == Do nothing... and use this until the board resets
 	 */
 	switch (kgdbreboot) {
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 622410c45da1..d8ee5647b732 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -253,7 +253,7 @@ static char *kdballocenv(size_t bytes)
  * Parameters:
  *	match	A character string representing a numeric value
  * Outputs:
- *	*value  the unsigned long represntation of the env variable 'match'
+ *	*value  the unsigned long representation of the env variable 'match'
  * Returns:
  *	Zero on success, a kdb diagnostic on failure.
  */
@@ -356,7 +356,7 @@ static void kdb_printenv(void)
  * Parameters:
  *	arg	A character string representing a numeric value
  * Outputs:
- *	*value  the unsigned long represntation of arg.
+ *	*value  the unsigned long representation of arg.
  * Returns:
  *	Zero on success, a kdb diagnostic on failure.
  */
@@ -470,7 +470,7 @@ static int kdb_check_regs(void)
  *	symbol name, and offset to the caller.
  *
  *	The argument may consist of a numeric value (decimal or
- *	hexidecimal), a symbol name, a register name (preceded by the
+ *	hexadecimal), a symbol name, a register name (preceded by the
  *	percent sign), an environment variable with a numeric value
  *	(preceded by a dollar sign) or a simple arithmetic expression
  *	consisting of a symbol name, +/-, and a numeric constant value
@@ -894,7 +894,7 @@ static void parse_grep(const char *str)
  *	Limited to 20 tokens.
  *
  *	Real rudimentary tokenization. Basically only whitespace
- *	is considered a token delimeter (but special consideration
+ *	is considered a token delimiter (but special consideration
  *	is taken of the '=' sign as used by the 'set' command).
  *
  *	The algorithm used to tokenize the input string relies on
diff --git a/kernel/debug/kdb/kdb_private.h b/kernel/debug/kdb/kdb_private.h
index ccbed9089808..170c69aedebb 100644
--- a/kernel/debug/kdb/kdb_private.h
+++ b/kernel/debug/kdb/kdb_private.h
@@ -64,7 +64,7 @@
 
 /*
  * KDB_MAXBPT describes the total number of breakpoints
- * supported by this architecure.
+ * supported by this architecture.
  */
 #define KDB_MAXBPT	16
 
-- 
2.25.1




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
