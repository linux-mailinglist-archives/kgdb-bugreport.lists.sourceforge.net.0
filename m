Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E731C1B3294
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 22 Apr 2020 00:22:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jR1Ht-0001Lq-OM
	for lists+kgdb-bugreport@lfdr.de; Tue, 21 Apr 2020 22:22:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jR1HP-0001Kl-B0
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 22:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u1Fvyyf5nczEffjGBcL+8ckFidnOh9Vp/pUQ4gio37U=; b=NQAIKT1NVneBJAQlIgGmuQ/dYo
 15IGQbeZTHORZW/GYmJ/Y28DerTDFVBqvHIcHb1mJ8raAjjo5OZSxqfQ+pHIYw6nlgaPNQHIqwhoI
 2WC40+9xdXUWyi7BlwVJf8Lr71XEJOtHukjjizq94kDeeezqK49hkNC7c27NdKIpE5TE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u1Fvyyf5nczEffjGBcL+8ckFidnOh9Vp/pUQ4gio37U=; b=C6SeHNCBxO6NyfvXaceS/ZM2hW
 pgMAK+aHYJl1wNv/y6C7V8fgrFLPVbNl0k4VwGtEFbauE/fFCGaS+4Udu/RJGRJDlpicFX1obFcy3
 XpxsLcLpvng2SWujZbx7sXBPdqFCi4n72cUQxp/U6fYyJHXQZttVzNCzZllM2Go3oqxI=;
Received: from mail-qv1-f67.google.com ([209.85.219.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jR1HO-009Obd-3Y
 for kgdb-bugreport@lists.sourceforge.net; Tue, 21 Apr 2020 22:22:11 +0000
Received: by mail-qv1-f67.google.com with SMTP id fb4so7399950qvb.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 21 Apr 2020 15:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u1Fvyyf5nczEffjGBcL+8ckFidnOh9Vp/pUQ4gio37U=;
 b=PKvElx00HHdwyyEhNv9HrFEWal6afEqN2MXBKrf15GbVJ1eqTVjzJ6PBhfgwxArQ19
 utaZDQ51WhLVHhZzbl4Ndd3g3CEgTOuSoyzsZq6y/bGCEj9EjYU3rkyWXz+mEGaXN0ri
 A/vxKbYEYsvT+2dcKVPlQPPPY8HZwtQmJYTV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u1Fvyyf5nczEffjGBcL+8ckFidnOh9Vp/pUQ4gio37U=;
 b=s/QVlmyAWbtzvrUFvf5lImjDLtfTVmw0JHV4FIXglt0Jc+ynblhFsNR76ugWyQPlGG
 GRRCMDumYu6PKGDcQ10CUjUi3qSKll/PLe8AMYSpSB9bWqWYsh98hwxGOyiim/4xyOZI
 v5J08xz9RkVR4BsmoE/vc6JIdKMH1XJ9KXB4Qum8PZGVra0nE+4qJCpXy1+HvCsxNucW
 YTO9FARzMx13Cl5Vtb/7JKHcp+7Nx3029dXa0qVo9vPd21uu0WbgToV8K9X9Pj+jjzCL
 rAa9gEPDn+ZBH2bzaRZ0G2KJufYZXLTZuE0mQj5SKSsuvHE9IqWi66tQPgH2GsFlqiSf
 umEw==
X-Gm-Message-State: AGi0Puat6tHn3txNQN56Lmisv002sZJu8e61qir/jAupHHc/0Zy+1I3k
 2l2dUCgz/nU9b/ux75C/PNX7WbOV+D4Usw==
X-Google-Smtp-Source: APiQypLO8Vq+2uFDtn1QekfYaQkMUKtaot3jc7Cj/gRVKWbD0siljhiALve3Rxk+OpHLYMMkTVAwJA==
X-Received: by 2002:a17:902:c111:: with SMTP id
 17mr23179231pli.334.1587503720751; 
 Tue, 21 Apr 2020 14:15:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id c1sm3287880pfo.152.2020.04.21.14.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 14:15:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Tue, 21 Apr 2020 14:14:40 -0700
Message-Id: <20200421141234.v2.2.I02258eee1497e55bcbe8dc477de90369c7c7c2c5@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421211447.193860-1-dianders@chromium.org>
References: <20200421211447.193860-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jR1HO-009Obd-3Y
Subject: [Kgdb-bugreport] [PATCH v2 2/9] Revert "kgdboc: disable the console
 lock when in kgdb"
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This reverts commit 81eaadcae81b4c1bf01649a3053d1f54e2d81cf1.

Commit 81eaadcae81b ("kgdboc: disable the console lock when in kgdb")
is no longer needed now that we have the patch ("kgdb: Disable
WARN_CONSOLE_UNLOCKED for all kgdb").  Revert it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Revert "kgdboc: disable the console lock when in kgdb"") new for v2.

 drivers/tty/serial/kgdboc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/tty/serial/kgdboc.c b/drivers/tty/serial/kgdboc.c
index c9f94fa82be4..8a1a4d1b6768 100644
--- a/drivers/tty/serial/kgdboc.c
+++ b/drivers/tty/serial/kgdboc.c
@@ -275,14 +275,10 @@ static void kgdboc_pre_exp_handler(void)
 	/* Increment the module count when the debugger is active */
 	if (!kgdb_connected)
 		try_module_get(THIS_MODULE);
-
-	atomic_inc(&ignore_console_lock_warning);
 }
 
 static void kgdboc_post_exp_handler(void)
 {
-	atomic_dec(&ignore_console_lock_warning);
-
 	/* decrement the module count when the debugger detaches */
 	if (!kgdb_connected)
 		module_put(THIS_MODULE);
-- 
2.26.1.301.g55bc3eb7cb9-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
