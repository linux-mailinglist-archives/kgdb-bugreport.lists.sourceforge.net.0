Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EBC4D0E5C
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  8 Mar 2022 04:33:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nRQb7-00049l-Jo
	for lists+kgdb-bugreport@lfdr.de; Tue, 08 Mar 2022 03:33:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rdunlap@infradead.org>) id 1nRQb6-00049b-53
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 03:33:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9XEr91lee3qrNYzlpnPyVenjfELdDDVrJO/lkq1NJYE=; b=VDTC5EeibU6kbWPompacRBFWLS
 slo8HSoFdvQPALQUsnoxEfOqmrpyTO8a6MC//l1fZxeVQUfOECP83m0x6MGkpuQ/WUSbBWd/SaIIU
 pg47qs+QQxipAalt6vBDVgWwTZpxbZZzPv+aEgVtbMBFwCn7cmjL7vf4pSPCgZLsSnxs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9XEr91lee3qrNYzlpnPyVenjfELdDDVrJO/lkq1NJYE=; b=U
 mzqKhNt6h5fwC7Wi9DmkzfS9HCuCWr08VKeSAB4LzNXNsPN/duXKZzj/hrjkiI7ne0bsnTpWEdvj1
 N0x7P6sSW9AtGHp0hx2XJ8yTS91ruP6sB1bBEqdmb4NUQNRXdOxgrcSpdAbV73pf3cRjQydchnWS4
 jSjv2siKtbGsyp/E=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRQaz-0085iR-8k
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Mar 2022 03:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9XEr91lee3qrNYzlpnPyVenjfELdDDVrJO/lkq1NJYE=; b=xeV7attVvYyZMnBV7Pr5TdS1Xt
 QLqPoCZ2TFVtZJrnLEwAqI8HJ5bycuTLpz1X2UzZdz2+x2+hakpf8nNPN2Gq1clWcXltTW1nF0iXF
 z2cD5EkFDFdEggVFBScWuYVrFY43rANStpP/RK/tKH9OvPd/b6Ws3qsj1ZmmCwMWSrbtybhawOZ+0
 WAdgYvMkLmUnkd5rEoMXqj24LvtxjI5v2UJ5LXNx04FfpYg6dL/y3k3Bqxypc8iPUYpF1Ck2UbBI/
 Bq0AerZNJz+jKdNCATRu57ZxG3VSiXYMEromSqeB0uLRrmGL7TuBesLMqr1xYEIKx0LOWGPEVYy5v
 9+6tH/Jg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRQam-002Xts-7d; Tue, 08 Mar 2022 03:32:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Mon,  7 Mar 2022 19:32:55 -0800
Message-Id: <20220308033255.22118-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __setup() handlers should return 1 to indicate that the boot
 option has been handled. A return of 0 causes the boot option/value to be
 listed as an Unknown kernel parameter and added to init's (limite [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nRQaz-0085iR-8k
Subject: [Kgdb-bugreport] [PATCH] kgdbts: fix return value of __setup handler
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kgdb-bugreport@lists.sourceforge.net, Igor Zhbanov <i.zhbanov@omprussia.ru>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

__setup() handlers should return 1 to indicate that the boot option
has been handled. A return of 0 causes the boot option/value to be
listed as an Unknown kernel parameter and added to init's (limited)
environment strings. So return 1 from kgdbts_option_setup().

Unknown kernel command line parameters "BOOT_IMAGE=/boot/bzImage-517rc7
  kgdboc=kbd kgdbts=", will be passed to user space.

 Run /sbin/init as init process
   with arguments:
     /sbin/init
   with environment:
     HOME=/
     TERM=linux
     BOOT_IMAGE=/boot/bzImage-517rc7
     kgdboc=kbd
     kgdbts=

Fixes: e8d31c204e36 ("kgdb: add kgdb internal test suite")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: Igor Zhbanov <i.zhbanov@omprussia.ru>
Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
Cc: kgdb-bugreport@lists.sourceforge.net
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/kgdbts.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- lnx-517-rc7.orig/drivers/misc/kgdbts.c
+++ lnx-517-rc7/drivers/misc/kgdbts.c
@@ -1070,10 +1070,10 @@ static int kgdbts_option_setup(char *opt
 {
 	if (strlen(opt) >= MAX_CONFIG_LEN) {
 		printk(KERN_ERR "kgdbts: config string too long\n");
-		return -ENOSPC;
+		return 1;
 	}
 	strcpy(config, opt);
-	return 0;
+	return 1;
 }
 
 __setup("kgdbts=", kgdbts_option_setup);


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
