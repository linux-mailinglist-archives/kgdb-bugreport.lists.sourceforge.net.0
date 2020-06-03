Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5B1ECA73
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 09:23:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgNjw-0003oD-5M
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 07:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgNjv-0003mz-1f
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=epHTx4WtH5eVO53u9vYRGtnDvl2Fou6agb9RgeFaY18=; b=mxy7udo5W6tIaILSRIFbA0+xnB
 sE15Hw7a2o4mCPmC6c5wlHUpEkSV4BLHvRL7wWwWvHQmKsrzoj3njzNtQDb3A8VIAIjw/xnuSBhAP
 sfSn6oH1LdbRsILtXm/h4KVKJ9YIKsjdOEXaHUGRiAj8S7IELAbX+KaIxzRwHDv6OyCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=epHTx4WtH5eVO53u9vYRGtnDvl2Fou6agb9RgeFaY18=; b=b4teqsCzoxC4X2154rf69yFMSr
 vLw2Xh8NMSuYLo/07Rnbv2PqzYafJLAng4OTAvWytr6iPoOVk9jTw5JI54fNL7KSLghrPBxVeLr0S
 Xt6T3NEEXCAbUiKENHutrhSHI0nc/Acoi3QrYYed6TfnE2SvDg/sc9t00sJrqnHIzGdw=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgNjm-003bCr-G3
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:23:00 +0000
Received: by mail-pg1-f196.google.com with SMTP id p30so1129842pgl.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 00:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=epHTx4WtH5eVO53u9vYRGtnDvl2Fou6agb9RgeFaY18=;
 b=CDPwO3olv9s5zteGYUfVc+sp3PPPJPLARUW/0rVxq1+Ly8PTZYNTR2mW3V2vZmsLiT
 3oAMpGGkbkfHTmeJlqmXYWVqv+T3LSm8sk0Qx1h+VYo3kBBoWeyhjdKvwlQo/3jUlCrW
 0ttOmubv94mXOn3Yyl/JahnMEW2Sk4SvsuahvpEihKkHm1Ci7nGsbhs2eWHxRWT3ar8H
 lAoF0PK0LLTzSTDLIX0NKc4v3lVMpP9I7hfAR1t57cPwBtKiglm+xeqlwoEkpzgF2Lmi
 QPCkwbuBYt7tpDeHN7sZa2qWc3ua/uLsB+hsIW6e0xDasBj+32acrZyV0pl5oMp0Ba/Z
 u3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=epHTx4WtH5eVO53u9vYRGtnDvl2Fou6agb9RgeFaY18=;
 b=pfEv3vvoP5WPSYEnLL/eBrJ0gSvcj/V63+KZNFoG079fSUBiQFF9/AjTRZZ/jaGfNM
 tViLrdkZ1Cdm3mQIVwh2UDK75hjlhc4dGULtIks8697yH0rggOfEmIKF9RuLjMc4UzRz
 4g2iwEJgfDOLJhf+mKMj7/2GGlFrPM4EaJ9hbQudfa/HvEAZtalKsBFUc3eExW+oalwp
 iezeKEb0T3caKt7iCdhHklW/7VENAkWVnRaH/3ybvluvSN0PjUgHOr/dPHkaJVdEu8Up
 3Tt69YyJXMezaCPgQV01KclQIDMwSr05IV7YxbIrMEs0OQXmYv+5vF38ok8iP95ccxHo
 PmMA==
X-Gm-Message-State: AOAM532HP0mFVD3rzXQDndUPcc8Eyg9i+0Mm04JMCICDsmOgGSQstjAw
 MCLsP/KwSeQHS6VRHyh4Jjw3vA==
X-Google-Smtp-Source: ABdhPJxq6b+TRxfiJi4+MW8+OSaaHBj+RxXJSsUHooYPQOdqGK6CI23+Yc+zOpHUP8us0rlfL65g2g==
X-Received: by 2002:a17:90a:2686:: with SMTP id
 m6mr4101227pje.11.1591168972877; 
 Wed, 03 Jun 2020 00:22:52 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id j17sm1407272pjy.22.2020.06.03.00.22.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 00:22:52 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed,  3 Jun 2020 12:52:14 +0530
Message-Id: <1591168935-6382-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgNjm-003bCr-G3
Subject: [Kgdb-bugreport] [PATCH v5 3/4] kdb: Make kdb_printf() console
 handling more robust
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
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, gregkh@linuxfoundation.org, jslaby@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

While rounding up CPUs via NMIs, its possible that a rounded up CPU
maybe holding a console port lock leading to kgdb master CPU stuck in
a deadlock during invocation of console write operations. A similar
deadlock could also be possible while using synchronous breakpoints.

So in order to avoid such a deadlock, set oops_in_progress to encourage
the console drivers to disregard their internal spin locks: in the
current calling context the risk of deadlock is a bigger problem than
risks due to re-entering the console driver. We operate directly on
oops_in_progress rather than using bust_spinlocks() because the calls
bust_spinlocks() makes on exit are not appropriate for this calling
context.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_io.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 58b7d25..0e4f2ed 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -562,7 +562,18 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	for_each_console(c) {
 		if (!(c->flags & CON_ENABLED))
 			continue;
+		/*
+		 * Set oops_in_progress to encourage the console drivers to
+		 * disregard their internal spin locks: in the current calling
+		 * context the risk of deadlock is a bigger problem than risks
+		 * due to re-entering the console driver. We operate directly on
+		 * oops_in_progress rather than using bust_spinlocks() because
+		 * the calls bust_spinlocks() makes on exit are not appropriate
+		 * for this calling context.
+		 */
+		++oops_in_progress;
 		c->write(c, msg, msg_len);
+		--oops_in_progress;
 		touch_nmi_watchdog();
 	}
 }
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
