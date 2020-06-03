Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E391ECA71
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Jun 2020 09:22:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgNjk-0007Cc-Tu
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Jun 2020 07:22:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgNjh-0007CJ-Bx
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KH9mdDVcPHEY0mojValvd3JCyi55UJUFJ61D84czA9Q=; b=UYfgqTwVOcP77mqEyG1uRSCKD9
 Qud1zvvEwpIjLbBXz2Ex3WEXXPXRE6HX6LFzMPwYx9tmLvb5Ak2R1fwDUBvv6rci3//W0J63YENEC
 6ShxLEEGHd1eluWiqTv+9H/hFDlnEaAhakyfuBgRDDepSlSej9leZl/4Dgn4RMeW7t0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KH9mdDVcPHEY0mojValvd3JCyi55UJUFJ61D84czA9Q=; b=EtPJIMpWUvV4X6wi+rG1wmNQwx
 YwPX5JQbPnEG8knPVeZGoO6Ull3SZOZfPnTCstBpkNFf3LicziShRTXyt7Zqak0LCUYAYcjH1oPU+
 Dry9pIr/IAUtLtqPqI88VnBwRktnwxVpX4aHE3DnfVMLAhLK0UZLZIpcwH+rPpnrwy1g=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgNjg-003bCc-6J
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Jun 2020 07:22:53 +0000
Received: by mail-pf1-f193.google.com with SMTP id b5so1013456pfp.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Jun 2020 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KH9mdDVcPHEY0mojValvd3JCyi55UJUFJ61D84czA9Q=;
 b=I0S3XYU+nNeK9ISWU1458r0kuMd3K6rN3SacyxgQr4DuSLAFPR9t4UhOauqbuhZ20a
 yPdlKC9njptkxgd0ZbIPtSUEepv9SglcMj5d0r2RY+ztemInMrrqQMKxZy3fxHIc1dpx
 N0G4bvRaNTwS68qdSTC/GjutgZjwd4gPu5FvrAn6s8S2iYs9zOpr3G7CCJ/n42dPfe8z
 x158WQg1stswQjoqv9wfJBP1i7XSDB33JFHoVujRwZvQyvf3sCN+rO/94JYQUWrF7h6p
 laiQKIEttSSC0ugoS9IaUiwu5Ob3mP8NiEE3NCuC88Yb5XpYdDCngMAGq6NVoPUMlPjK
 wEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KH9mdDVcPHEY0mojValvd3JCyi55UJUFJ61D84czA9Q=;
 b=NKnuFQzGNTAhGWpYoTF1SEMaJqZw+SgtoekxMq8iTb97bdSVDccKCJY7g6YGLQBBiI
 gG6nlGKUSosvmps78qpGKLBTa6A862fRaUSl0CD6GH5581fbG/MlaNOAa8UlWTqKazbg
 do8N5RqrM7YUU1QcCILLHIdePgMeOOGji/9iyldTe/GnPHCOec9uWXPJjje5nEGptFoU
 6oGn3tyO9hH3+cRjCt/645X5LOp0MHEOa6zDpW7JDoU2vwiYk7qpgpd7isQV64efTh7q
 Q2ZSODU4AzBpNDQCo9GVzmQfq2VLBG1rMTo2UXyNYSnPcwXlGhr9YP16ZXMBXDRgi3XC
 I4NA==
X-Gm-Message-State: AOAM531c0t/rO1owhio0UfXGaHg50JgZ/JJZYrj2sjiZyuSw05n6MA7u
 mmOw/XUcKAYbp975oZh+uCp8bw==
X-Google-Smtp-Source: ABdhPJzbIj0dPQSD91jSKU+b3V+XS3Q+jbXkgTqE7TWO3f+KavuzGx+MLzMkc43ztjLhIFtbPkoPgQ==
X-Received: by 2002:a17:90a:f198:: with SMTP id
 bv24mr4099950pjb.206.1591168966618; 
 Wed, 03 Jun 2020 00:22:46 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id j17sm1407272pjy.22.2020.06.03.00.22.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jun 2020 00:22:45 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed,  3 Jun 2020 12:52:13 +0530
Message-Id: <1591168935-6382-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
References: <1591168935-6382-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jgNjg-003bCc-6J
Subject: [Kgdb-bugreport] [PATCH v5 2/4] kdb: Check status of console prior
 to invoking handlers
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

Check if a console is enabled prior to invoking corresponding write
handler.

Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 2d42a02..58b7d25 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -560,6 +560,8 @@ static void kdb_msg_write(const char *msg, int msg_len)
 	}
 
 	for_each_console(c) {
+		if (!(c->flags & CON_ENABLED))
+			continue;
 		c->write(c, msg, msg_len);
 		touch_nmi_watchdog();
 	}
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
