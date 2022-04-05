Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4DA4F299B
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  5 Apr 2022 11:48:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nbfnF-0005VR-Ff
	for lists+kgdb-bugreport@lfdr.de; Tue, 05 Apr 2022 09:48:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1nbfnD-0005VK-DK
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Apr 2022 09:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BYVW6WX01lxbIlBplOlyTJrApec1zUPjthaqTo2XYY0=; b=kvix047FVEGS+rkpqztPvbEQjC
 70d3HwDTW34OnnmxCRArfSRqxte01/q3V10LXHuZms2JAgbjQWmvfCGrixZGz9+3gBxZNjqW47t1Q
 cif/6mV3Z7tiOF9HYUEx75AhGUyT0/hJhmUaAuDw7Cj4PXRIFZLDPQ9thVFHB/cxFsB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BYVW6WX01lxbIlBplOlyTJrApec1zUPjthaqTo2XYY0=; b=IOw59ZrWSRyFWjhtWlv0EdPypa
 m7lYRouEcomEzQJT13qvNsawo0tlEbpMEkTE0f31zJ5LDxGCRoz8PXR2YOY7xl8ZtfvIKLy+Kc/JP
 ZKUED5EW+M0eCrSeGF/5y4L8aVpg82qPjQfrp13YOMbskq83nSZW40lcXpIYMZ+RjEgg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbfn4-0063Os-WF
 for kgdb-bugreport@lists.sourceforge.net; Tue, 05 Apr 2022 09:48:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DD6FFCE0B18;
 Tue,  5 Apr 2022 09:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88E1C385A4;
 Tue,  5 Apr 2022 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649152062;
 bh=JCLM8YKiiHyma2HgpUKFb0VzrXsL8iLb6rFhuU6ooFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDLrJs9yDmKjWWg8xZlefRWACd68U8pXbjZnCwL3jpGka+8sPeYPDQ7r9pa+mrYgK
 E7vaaohmKJBRgNhaDLN62tWMuaDkFskC4HHPYMpgqfDJiWw1WDXLjWfS8uWvDlG1uC
 e9iKo5Opa9qrbbM9BKfswVHrcPeFQL9lyNnPtz2o=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  5 Apr 2022 09:28:23 +0200
Message-Id: <20220405070359.054596577@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405070339.801210740@linuxfoundation.org>
References: <20220405070339.801210740@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Randy Dunlap <rdunlap@infradead.org> [ Upstream commit
 ab818c7aa7544bf8d2dd4bdf68878b17a02eb332 ] __setup() handlers should return
 1 to obsolete_checksetup() in init/main.c to indicate that the boot option
 has been handled. A return of 0 causes the boot option/value to be listed
 as an Unknown kern [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nbfn4-0063Os-WF
Subject: [Kgdb-bugreport] [PATCH 5.15 641/913] kgdboc: fix return value of
 __setup handler
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
Cc: Sasha Levin <sashal@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, He Zhe <zhe.he@windriver.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Igor Zhbanov <i.zhbanov@omprussia.ru>, linux-serial@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit ab818c7aa7544bf8d2dd4bdf68878b17a02eb332 ]

__setup() handlers should return 1 to obsolete_checksetup() in
init/main.c to indicate that the boot option has been handled.
A return of 0 causes the boot option/value to be listed as an Unknown
kernel parameter and added to init's (limited) environment strings.
So return 1 from kgdboc_option_setup().

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

Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
Fixes: 1bd54d851f50 ("kgdboc: Passing ekgdboc to command line causes panic")
Fixes: f2d937f3bf00 ("consoles: polling support, kgdboc")
Cc: He Zhe <zhe.he@windriver.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: kgdb-bugreport@lists.sourceforge.net
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: linux-serial@vger.kernel.org
Reported-by: Igor Zhbanov <i.zhbanov@omprussia.ru>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20220309033018.17936-1-rdunlap@infradead.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/kgdboc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index 49d0c7f2b29b..79b7db8580e0 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -403,16 +403,16 @@ static int kgdboc_option_setup(char *opt)
 {
 	if (!opt) {
 		pr_err("config string not provided\n");
-		return -EINVAL;
+		return 1;
 	}
 
 	if (strlen(opt) >= MAX_CONFIG_LEN) {
 		pr_err("config string too long\n");
-		return -ENOSPC;
+		return 1;
 	}
 	strcpy(config, opt);
 
-	return 0;
+	return 1;
 }
 
 __setup("kgdboc=", kgdboc_option_setup);
-- 
2.34.1





_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
