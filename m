Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC4820D053
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 29 Jun 2020 19:15:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jpxNt-0004Ud-I3
	for lists+kgdb-bugreport@lfdr.de; Mon, 29 Jun 2020 17:15:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jpxNs-0004UT-Th
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 17:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LdmyDXtA8EIM1jxYalqYHcGVicYKfXEl1rpwhzYY7yY=; b=j4jdzeehjEp6IG6eIoz2NJUrHb
 zLzIsCGea5xKND78QsITEbxllppsF2IJKC8pFk25taKbQfe5OviGVCEWlb2k2usLK5b+VMBa4TFHk
 1muxCsbhHAHXjX2y0zF7xkXmKF9wGIQHZRieQcG13YETdX0LnFNx7kh9jqw09YIO73sY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LdmyDXtA8EIM1jxYalqYHcGVicYKfXEl1rpwhzYY7yY=; b=U
 yKXRzMHnmIRylrbYoUdyAaSd5dkm1XmvV0BP3Fuc4iAipwt07qculO6LcyvrGXwV2srjKLXx1D9Ph
 cr4fdNOUoTdIV7pvVogt41eS2gCtAcO9MpliLlRx9bBzo4TwaNu64CClP346OMpydZXSU5CTmORDK
 otPx525jZ52RANi0=;
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jpxNl-002FIy-RH
 for kgdb-bugreport@lists.sourceforge.net; Mon, 29 Jun 2020 17:15:56 +0000
Received: by mail-wr1-f66.google.com with SMTP id b6so17282781wrs.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 29 Jun 2020 10:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdmyDXtA8EIM1jxYalqYHcGVicYKfXEl1rpwhzYY7yY=;
 b=c9p9Gar7D2nXzpz2YR/ib39Abgv4y6hEa91cr786gH8hhBcc2XHPgejdMauKVSCXyw
 EgAsOWswu0yM60MBbUpqEjXeok6FXbZK3cY12YvSpijtvD0BGihf4HyPCLh9I970OF+w
 78MwbI9PqGOns9VkUov0ZQ9RbuCV+fwXeAcEtPspxUT9Uk7UyYJvZDXRhVlIPAhOgy1r
 0ebCtAluvcdaAZtdvp/iG7aZAmwyeaGzf8o6royVXgBp6bmZYTZ+EEf7K6vitzPvHvWn
 wVU1xmaE5kyGW65gr+wCRjIx7La2Aae9t0Re8V+Heu0ZC4EarsLzwXx5hOPENYGaf8DM
 nFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdmyDXtA8EIM1jxYalqYHcGVicYKfXEl1rpwhzYY7yY=;
 b=XovnD9ZZOnwD7vO6P7E4bKZ5unRgjZT96buLUeZdGGZ0y/PxcE5Ga68YK6J4M1GG/W
 Js2ntRl/Wp7i+RFQYNcAW4Q+rO1/bMEXYSizO12DL2YtqI+LLDO0WBFuTY9O23+knaTm
 7zg0M0Jf7TZH1vuo/84q3PuiwO4ReJn0qODz4J/Nb0TijG86cXD65q40/AnE97lBJVRM
 MiV9Er+1usdABTgLQotj++OKFEGcFCbCe0EhHpcwsRMPYtZT6Mn/R+EkPK1nFolH79Y4
 ETaMroHPg4CvECL2RGGa5lZ9hD5bFFq/KtoR6/KlmkyvTSs036Tyu88pK63XzA3ylbZH
 b1gw==
X-Gm-Message-State: AOAM531ribzOg3Ek5gVpm70TiwUTgqSLG+V+sl7ZmCPU2rMW0nxBTLd2
 Dk9exiCd07tBLL89cOXAb5XpEw==
X-Google-Smtp-Source: ABdhPJzs30159xRqcvLpbN8z4ChYHhI0ngFXg57huo/LOl0+OMOWqLHYtRb1FBzKVGwD5ZJ8obYgyw==
X-Received: by 2002:a5d:66ca:: with SMTP id k10mr7472015wrw.244.1593450943526; 
 Mon, 29 Jun 2020 10:15:43 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g195sm517482wme.38.2020.06.29.10.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 10:15:42 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 29 Jun 2020 18:15:29 +0100
Message-Id: <20200629171529.558003-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jpxNl-002FIy-RH
Subject: [Kgdb-bugreport] [PATCH] kgdb: Resolve races during
 kgdb_io_register/unregister_module
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
Cc: pmladek@suse.com, Daniel Thompson <daniel.thompson@linaro.org>,
 patches@linaro.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kgdb_register_callbacks() and kgdb_unregister_callbacks()
are called outside the scope of the kgdb_registration_lock. This
allows them to race with each other. This could do all sorts of crazy
things up to and including dbg_io_ops becoming NULL partway through the
execution of the kgdb trap handler (which isn't allowed and would be
fatal).

Fix this by bringing the trap handler setup and teardown into the scope
of the registration lock.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 9e5934780f41..9799f2c6dc94 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1117,9 +1117,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)

 	dbg_io_ops = new_dbg_io_ops;

-	spin_unlock(&kgdb_registration_lock);
-
 	if (old_dbg_io_ops) {
+		spin_unlock(&kgdb_registration_lock);
 		old_dbg_io_ops->deinit();
 		return 0;
 	}
@@ -1129,6 +1128,8 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 	/* Arm KGDB now. */
 	kgdb_register_callbacks();

+	spin_unlock(&kgdb_registration_lock);
+
 	if (kgdb_break_asap &&
 	    (!dbg_is_early || IS_ENABLED(CONFIG_ARCH_HAS_EARLY_DEBUG)))
 		kgdb_initial_breakpoint();
@@ -1147,13 +1148,14 @@ void kgdb_unregister_io_module(struct kgdb_io *old_dbg_io_ops)
 {
 	BUG_ON(kgdb_connected);

+	spin_lock(&kgdb_registration_lock);
+
 	/*
 	 * KGDB is no longer able to communicate out, so
 	 * unregister our callbacks and reset state.
 	 */
 	kgdb_unregister_callbacks();

-	spin_lock(&kgdb_registration_lock);

 	WARN_ON_ONCE(dbg_io_ops != old_dbg_io_ops);
 	dbg_io_ops = NULL;

base-commit: 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68
--
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
