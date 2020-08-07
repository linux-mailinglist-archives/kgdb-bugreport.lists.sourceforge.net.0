Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA52403A8
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 Aug 2020 10:56:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k53bB-0004h9-Tz
	for lists+kgdb-bugreport@lfdr.de; Mon, 10 Aug 2020 08:56:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tangyouling@loongson.cn>) id 1k3yvy-0004Mx-Bs
 for kgdb-bugreport@lists.sourceforge.net; Fri, 07 Aug 2020 09:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VEnepu9H8GhgZ60QB7rOu7zSL5sBMOFG6ejQbw/B/X4=; b=IAlwUtLLF9yEHjn1Q+hKf9If9t
 WzUGuU2SLJHfLmP8Ww+NOI4Ln626A4bz8CYdRA7BD7U+cxXA8lEP99ufMHvOrrkYTfA786gVlsPtM
 ustaInPlooTsNThq0DwrkFSN5vQCC1l+2A16LO1OCuVC3Bzn9l/nhmebtuTqqYxruSEI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VEnepu9H8GhgZ60QB7rOu7zSL5sBMOFG6ejQbw/B/X4=; b=O3YzuU3QDEorUIS+vIauCWX40z
 3RliayMy/MkOUiwULxkmPVgIpJ429tvqflGhxVtso3suaGA7JLnFevXX39cE4WdqF5nwLt2+Ibs/a
 Kio9MwpPAB5JHbRemDxoAjG4K6LuYkabazDzbmxUbeY4C54C9Iz7mmXvkzDrM2idx2kI=;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1k3yvt-00FPrq-TK
 for kgdb-bugreport@lists.sourceforge.net; Fri, 07 Aug 2020 09:45:06 +0000
Received: from bogon.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxG+SIIi1fvqkFAA--.1496S2;
 Fri, 07 Aug 2020 17:44:41 +0800 (CST)
From: Youling Tang <tangyouling@loongson.cn>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri,  7 Aug 2020 17:44:40 +0800
Message-Id: <1596793480-22559-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9BxG+SIIi1fvqkFAA--.1496S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFy5Ar1DGr1kCw4fWF1UGFg_yoWDtFg_Kw
 n2yws5Ca1UJ345Ar4UCw1rXFnY9w4UZFZ8Ar1agrZF9a4Dt34UXwsYqF1kGFWrWrWDXr9x
 Ar9avr4ayr12gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb2xYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8uwCF04k2
 0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
 z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUID73DUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: loongson.cn]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1k3yvt-00FPrq-TK
X-Mailman-Approved-At: Mon, 10 Aug 2020 08:56:04 +0000
Subject: [Kgdb-bugreport] [PATCH] kernel/debug: Fix spelling mistake in
 debug_core.c
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Fix typo: "notifiter" --> "notifier"
	  "overriden" --> "overridden"

Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 kernel/debug/debug_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index b16dbc1..3eeee0a 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -80,7 +80,7 @@ static int			exception_level;
 struct kgdb_io		*dbg_io_ops;
 static DEFINE_SPINLOCK(kgdb_registration_lock);
 
-/* Action for the reboot notifiter, a global allow kdb to change it */
+/* Action for the reboot notifier, a global allow kdb to change it */
 static int kgdbreboot;
 /* kgdb console driver is loaded */
 static int kgdb_con_registered;
@@ -163,7 +163,7 @@ early_param("nokgdbroundup", opt_nokgdbroundup);
 
 /*
  * Weak aliases for breakpoint management,
- * can be overriden by architectures when needed:
+ * can be overridden by architectures when needed:
  */
 int __weak kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
 {
-- 
2.1.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
