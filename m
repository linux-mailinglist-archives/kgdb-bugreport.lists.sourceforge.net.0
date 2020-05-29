Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 199DF1E7BB6
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 May 2020 13:27:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jedAr-0001Xn-TS
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 May 2020 11:27:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jedAq-0001Xg-Ui
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8dgP79jKEPP7MXwHzZbUN9d9FldjpP7lv+/aoMCM0w8=; b=CWxvgH9uOFByu2nA6rvGtXVNOq
 +l9PRfbKnnA9l9NQplt42xilqP490cHYNLytaL6PwlKeBarDVbaTifS8OTK0ZJKDNE2AL7u2ZWMn6
 yNm89tzLLTBtuiYka/Em8Dg/q/TrzanL9QZEIcHb310DBeBpPicBEp43dXCG3idpBZ+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8dgP79jKEPP7MXwHzZbUN9d9FldjpP7lv+/aoMCM0w8=; b=DO92rXOu6b+LdxNB8tHWIkdigh
 gnF2nXYiyKUSZ3ymROQCpZ7YIqhDeOAvW54Wa+0SJYBnZhR/hXQ4vCIC6WolxaMSya5+IdnVqIcua
 pollDEchUOZnQz3rMXKwpUxpAq+r/7H4MZixmAMFbE4Scvl2zepnG7KFsb/m2Do0c+gY=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jedAl-00HCf2-BM
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:40 +0000
Received: by mail-pf1-f196.google.com with SMTP id z64so1265774pfb.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 May 2020 04:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8dgP79jKEPP7MXwHzZbUN9d9FldjpP7lv+/aoMCM0w8=;
 b=j6aJEOLx37LQfqAoeR/X9q4rItRoAeT0fPUkFBEX7Hli6YASNxJ8UHQFbMxl+5JYtG
 STQKCElCBMXh1RsorGJgqG3IOtnuRuuqPOuHaOg+julJFcPP0vTUgTAWQzoC4LpbmzPj
 n0Z7SLDnUTt8r80X8g/FSdnAWUpqoZdNTXR5yFHpo/Rb4Vhtksy2d6cNIZ+7C+WQmu9Z
 RLHpqIALYyyhRCZucQUFAkduwGAzyoJ2A707AizR2b54at5vFaRsG6aD26yj4Bd9QICO
 mYaXY8HseNlE5NMYYYnNvxb1MOkgvvSGxLwUN683D5cvNwCVzF6c1OA2QgP6WzS0Dyyl
 8F7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8dgP79jKEPP7MXwHzZbUN9d9FldjpP7lv+/aoMCM0w8=;
 b=Gjosem0QlrpfEAaMHq5f5u95nSXWUvcKnhIijaIAuNV4xw7KUDrWGxaFZtjJi5MHAS
 We1eF/vzmB4YmpGgSu0PRexnQCqLVLAQw8jZux2YiMH2QCT2Koor3Tw2q6Orw/0344dn
 OZgJkmsSSxjB6qlo2cczNJzQYQrcicHPPOSsFBdi4RYDCJjmcfIGJ5hpM1W79XUHSI2Q
 k08Hl7DEOzAoQXPm691ZXkYIAyHQfpP247msPuO3TEBqXPf1Q7C/0BH7FYtr+5vFylRz
 Ct19ND3JBHTIuDkb0HZsVmB32GKwlu3HOHemgMGRWF8sShyZsTmJjSxJ7JlE1+7yLssQ
 yo7w==
X-Gm-Message-State: AOAM530yqp72jKkFO3o+AIkKq8cGHDhEiBqhg9ySmQihG6opTSuQTsNe
 Xldf03l0dhbSVlKRMiiHXdGau+IyWNs=
X-Google-Smtp-Source: ABdhPJyvF+SNj9X0aE2+/RwtRzMTeO8LTpn+2cGSVbSgb/wP+z5c/ho0ttS4850+4J4iLj6vCdF/Xg==
X-Received: by 2002:a62:e913:: with SMTP id j19mr8462277pfh.78.1590751649824; 
 Fri, 29 May 2020 04:27:29 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id w190sm7016741pfw.35.2020.05.29.04.27.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 04:27:28 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Fri, 29 May 2020 16:56:45 +0530
Message-Id: <1590751607-29676-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jedAl-00HCf2-BM
Subject: [Kgdb-bugreport] [PATCH v4 2/4] kdb: Check status of console prior
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
---
 kernel/debug/kdb/kdb_io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index e46f33e..fad38eb 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -564,6 +564,8 @@ static void kdb_msg_write(char *msg, int msg_len)
 		kdb_io_write(msg, msg_len);
 
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
