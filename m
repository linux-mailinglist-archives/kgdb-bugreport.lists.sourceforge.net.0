Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A24571E310F
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 May 2020 23:20:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdh04-0001zQ-G4
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 May 2020 21:20:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jdh03-0001z6-1E
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 21:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mGisQOmV53APODapZGkiDQDW8pXpGOOkL2XHOF+ONZg=; b=VLpU52AAZyvUdaUujYRdJF05HJ
 JAEcGM4KDX1/BfuP4V2CeeScrFSFR72emZ/Ql8h/cDVDLYz9JzwYh4bpcLlDebggz4PgCVWrg3jOV
 lmDPA+oo1vlELlAzCmaVzv/Rm4MBVDKCj51CGBBGTulNOV2l4SLuSeypbJUyAPX2UU0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mGisQOmV53APODapZGkiDQDW8pXpGOOkL2XHOF+ONZg=; b=H
 rAzP7MzJKF0h/u6sKcp7v+5y0k/0pBD+NDXnSMRc6ySQRkoQDd+UEbY0sM1WrlJcg9cc15HUYe+cc
 D2cs6QHP92S8OH/NZ2vdlOBQkE2BwkFgliQSnyWOUuHAlc8J6Hpy4SdFfFt+i4BAOfTPOqphyLcse
 M8rEjoyetdSiKWi4=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdh01-00H3yU-Lk
 for kgdb-bugreport@lists.sourceforge.net; Tue, 26 May 2020 21:20:38 +0000
Received: by mail-pg1-f194.google.com with SMTP id w20so5654373pga.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGisQOmV53APODapZGkiDQDW8pXpGOOkL2XHOF+ONZg=;
 b=KK2BAaIAJ5Yi+TjwvE6MIde1Xjru0T5NibzAPzJhO8RKPqzn8GcPkr2VIoE6xPH0+U
 FGSplpDbAP61D36YAYEzx+L9yoZlEuUje6O2N5qNB5tgNN7uaWi4EKhtqhAialpU+Hmo
 ct7qVgSi0UawvYteoDUGFGo1alXKRElYtmWgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGisQOmV53APODapZGkiDQDW8pXpGOOkL2XHOF+ONZg=;
 b=a7nNktsbaM4NWOKxA7dCesJF6+vlK+o8tvrd2NEZS7GtMMA0wl8bfSruhwMmP+KKnI
 rM5TYLg1l+XMWvzsBOpU1NPvXvmtpnFHS4BlwYJM2PD9PK2Hho3J4o8hbVvdRLzECGGL
 K9+26wxaUZVAzwsJODuDJEmbropfE2czNyacXQt5tGEVzpcXfcziSrqCjc1xgs7Btd3X
 SpWMdpQWcG5F8R/ycCFXS3QfgiV6NSId2DRICbspyMwqLnP1HOTFL+RvfVqRnI8xOaI9
 VuROD3X4dZZUWcIrfoVUbIuagZ1teBZBSjkRvTdTrCYGxY49NM2bVHUbLUUOLIQoAFTz
 lH+Q==
X-Gm-Message-State: AOAM53291hhIx6o8pODumyypqWcO+6bCRUVpYZise2a5Vy1RYYVndgWe
 ymOyezZ6/Rs0UEzoOBkd4nImeg==
X-Google-Smtp-Source: ABdhPJyRUTHJ2NTlACR9GHLm4lZWKlgOuHItqYb8TuIugAbs40aIbrPeUzCFI4VokAb2FKgL8osG4A==
X-Received: by 2002:aa7:9464:: with SMTP id t4mr696239pfq.52.1590528032045;
 Tue, 26 May 2020 14:20:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id j124sm382333pfd.116.2020.05.26.14.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 14:20:31 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 26 May 2020 14:20:06 -0700
Message-Id: <20200526142001.1.I523dc33f96589cb9956f5679976d402c8cda36fa@changeid>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jdh01-00H3yU-Lk
Subject: [Kgdb-bugreport] [PATCH] kgdb: Don't call the deinit under spinlock
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 akashast@codeaurora.org, mka@chromium.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

When I combined kgdboc_earlycon with an inflight patch titled ("soc:
qcom-geni-se: Add interconnect support to fix earlycon crash") [1]
things went boom.  Specifically I got a crash during the transition
between kgdboc_earlycon and the main kgdboc that looked like this:

Call trace:
 __schedule_bug+0x68/0x6c
 __schedule+0x75c/0x924
 schedule+0x8c/0xbc
 schedule_timeout+0x9c/0xfc
 do_wait_for_common+0xd0/0x160
 wait_for_completion_timeout+0x54/0x74
 rpmh_write_batch+0x1fc/0x23c
 qcom_icc_bcm_voter_commit+0x1b4/0x388
 qcom_icc_set+0x2c/0x3c
 apply_constraints+0x5c/0x98
 icc_set_bw+0x204/0x3bc
 icc_put+0x30/0xf8
 geni_remove_earlycon_icc_vote+0x6c/0x9c
 qcom_geni_serial_earlycon_exit+0x10/0x1c
 kgdboc_earlycon_deinit+0x38/0x58
 kgdb_register_io_module+0x11c/0x194
 configure_kgdboc+0x108/0x174
 kgdboc_probe+0x38/0x60
 platform_drv_probe+0x90/0xb0
 really_probe+0x130/0x2fc
 ...

The problem was that we were holding the "kgdb_registration_lock"
while calling into code that didn't expect to be called in spinlock
context.

Let's slightly defer when we call the deinit code so that it's not
done under spinlock.

NOTE: this does mean that the "deinit" call of the old kgdb IO module
is now made _after_ the init of the new IO module, but presumably
that's OK.

[1] https://lkml.kernel.org/r/1588919619-21355-3-git-send-email-akashast@codeaurora.org

Fixes: 220995622da5 ("kgdboc: Add kgdboc_earlycon to support early kgdb using boot consoles")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/debug_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 4d59aa907fdc..ef94e906f05a 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1089,7 +1089,6 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 		}
 		pr_info("Replacing I/O driver %s with %s\n",
 			old_dbg_io_ops->name, new_dbg_io_ops->name);
-		old_dbg_io_ops->deinit();
 	}
 
 	if (new_dbg_io_ops->init) {
@@ -1104,8 +1103,10 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 
 	spin_unlock(&kgdb_registration_lock);
 
-	if (old_dbg_io_ops)
+	if (old_dbg_io_ops) {
+		old_dbg_io_ops->deinit();
 		return 0;
+	}
 
 	pr_info("Registered I/O driver %s\n", new_dbg_io_ops->name);
 
-- 
2.27.0.rc0.183.gde8f92d652-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
