Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95B1EE2FA
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Jun 2020 13:08:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgnjz-0002Bi-1P
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Jun 2020 11:08:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgnjx-0002BK-Ex
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 11:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmlB+pXtYmTxvOHVpxLinB7XLVQiN2it0eFpYDWFPp8=; b=M+o5kCF27ikWcHeIR75cCIKWMk
 XBEL6PyyUqt9U5FeBV9VrT/tkeWiHJBhVvo5xPjXcXdEQZO+4zT3oHVr5oIsh+c7C3CtN9FLhVXyS
 RGFZ9HAqd/36R++AJRzKUUxYlAhnVLwcHjssu6zZI75bBB32YxFhQWWwjlA+oyjtVTKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lmlB+pXtYmTxvOHVpxLinB7XLVQiN2it0eFpYDWFPp8=; b=hgGIylzNVsDcf93AeOjM43uKp3
 Ua7UetmSU7eBHJ0PczluvT2JVN06M2A/+recvSbXwLHn5Tq/251BF1werAVfT7SY7WPmyhRIrL2tp
 rQtGGK2ka/wkvNSCGufqPa3llvdR0kW43LScptdfAYIWkRHlKd8O/1AxdTbsICFoUvC4=;
Received: from mail-qv1-f66.google.com ([209.85.219.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgnjq-005KGF-OZ
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 11:08:53 +0000
Received: by mail-qv1-f66.google.com with SMTP id g7so2655368qvx.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 04:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lmlB+pXtYmTxvOHVpxLinB7XLVQiN2it0eFpYDWFPp8=;
 b=IGSSRmtmpdky3rgwegSDEySfjuUJ2LVkZV2xvh9aO93mhqax8N8nuxhwVcjz0b/Gcj
 UIcAq42et3lewAn4TsiQ7+VifsxhjDGyyqPtVs5/a5XOE0WT+Bp1Pdg0AwHtH4LHE2MA
 6A2XNP2cgCaD73tESkCFaRfbF2IKmT9+QPQoH08drKD7PnzolRphdcvNbhybGzCipgIi
 yEA0I+tF7hRDBLwdKCBP3FDWVwDY2v5KqyF9F4d0EO44R7kc8AmsR003b0E1dN8ddppR
 8kCKr6SVXDDA2wMx/zghCP+uhvJZRsB0XeLQ7wyMMLdMoWQ7/mkWn8ul6E2sdKxPgklT
 n7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lmlB+pXtYmTxvOHVpxLinB7XLVQiN2it0eFpYDWFPp8=;
 b=ZjHWDaMCAmaoUbE2jyFIz+cTXh3QCDVXY5WXq5HYY+ii2uieHpPqKFTjurG6lUFt2N
 cMvnt51mvbStIQaCZxJ/gdVjb4t8ZJk7b+/jihzbRWqe5vhdnmYTl+HULe7RnCzNnL7F
 pW184jm8vRSLDd71wuLDsk4IAxcdLqO9OHrlWQWrLifCaCEn3vqUu3Bzp5OZJx6Dug8q
 mfQVwrJpkRO1O5ajWzQTCdDeB5Beutki8wNpRuPAhrpft1M4HzyLQKmpk4rPebP5R5JU
 ShCTuyyhsCNleLGHUIwVs8mBUQRfHETwySciW0K90UzC8+9mG/PcO9ulb/1FsCGkb4vD
 L97g==
X-Gm-Message-State: AOAM533tbO9kdNSR5wc6LP3bK93IoMTUo8PV6K8CurAfRWp3nFdqobsj
 TJ24JTEIj0P/GsK+Nxuwj0p2kffLwew=
X-Google-Smtp-Source: ABdhPJxZTc90zWLsV6P9Ws4zb95s6ky6KR+UaZDb84BhMPOjFe3tqmx/+tQh3/qZUtqlurXxgyOjng==
X-Received: by 2002:a17:902:47:: with SMTP id 65mr3843773pla.54.1591264911843; 
 Thu, 04 Jun 2020 03:01:51 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id np5sm5786992pjb.43.2020.06.04.03.01.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 03:01:50 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Thu,  4 Jun 2020 15:31:17 +0530
Message-Id: <1591264879-25920-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
References: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgnjq-005KGF-OZ
Subject: [Kgdb-bugreport] [PATCH v6 2/4] kdb: Check status of console prior
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
Revieved-by: Petr Mladek <pmladek@suse.com>
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
