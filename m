Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 067851E3928
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 27 May 2020 08:26:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jdpWi-0007WI-R8
	for lists+kgdb-bugreport@lfdr.de; Wed, 27 May 2020 06:26:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jdpWh-0007W3-9g
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5F8AuAdD6vIH5WTUv671XyQbSMrH4wURkSBRo5DqQ6I=; b=l4Qt7Y06tUTEGalYIEnaEMgt+G
 zsfc1giwrHwMGjrn+WaBrsm04uNtR2OI+rySVilascva4fKRJLP9FaR7BsCUgwITCafn35WAstf2y
 ch9Nud02JvFXs9IT+sY7EfrI9TSVKdJNPQlhUdbj1tkdQFnO+F7mq1O7kRubOZoopXbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5F8AuAdD6vIH5WTUv671XyQbSMrH4wURkSBRo5DqQ6I=; b=KMD8kM21kXvviV1zxkl9wtsyKn
 0CkeE4Tii+lJxurTYdiLdSmm9kvif/Xp7s+Cg6A4LG9DhV2dfLN4vVx7USxpkaXyvbq7jhU73IT9a
 UXqgN72CvtHMvGSd/n1rzeyVCQYSt/TT8ODsYw0oE3fCuXhwAW2XE5eXvRpCq9dTI02I=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jdpWc-008pkK-Nx
 for kgdb-bugreport@lists.sourceforge.net; Wed, 27 May 2020 06:26:55 +0000
Received: by mail-pf1-f193.google.com with SMTP id y198so11399860pfb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 26 May 2020 23:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5F8AuAdD6vIH5WTUv671XyQbSMrH4wURkSBRo5DqQ6I=;
 b=VCMH9aJZEMUKwdWpD907O6d8TMaPjL4JJT4vpgHMwChl2TQh+0cIkUtMSXgS2ZH6aN
 bvMDRnH156mxfIHNj/zo6p7qGmmMeqaaUhEVvaFikc4qGaCK1koc7PLRxw5tNNHdY2Mb
 jtIwF/7tRuPFWH5QwPRZ7KyTU+s9nBN9h2e0GSy3ObZyqPkqHNmMHICCJQ42Jlcj9xLI
 8lgYj2RjFBgVwqk7nyzvyNNZb8S8eNqrKSf52wkkVDL0c+AlKll1IyK77BFOPAYYWyTC
 YgMZz2JkmOl42xHfxOV7PDWHf9Elfa3KofSAP08d2xpMV9jDgUlNFwAn4bjEc3bcOEhO
 cFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5F8AuAdD6vIH5WTUv671XyQbSMrH4wURkSBRo5DqQ6I=;
 b=VlPf8NyXXZ8BVuzQUExgPVCBFnaZbIQUSIp/LaOn2cw6bBr7kXJ9QjV5K2rRiGPhi4
 L0VjnLz7zGHarBJBeittbUzEmarnAfziLzqACoTx+T6+NiB+diFFx3sp5Z27jY5mIlYv
 27ZwvQ5fKLBdQSuzOINJnQHzuGS346vKZVPo0YcK6WZFR9+c9jxyS5rEtLKOlMApL9Xx
 pd35MgBVXAqkE6j0mrazi2W18+yT3bJuBwnLhpF0CDW6U9bKcBguAyXrLV/gNrKzxcY5
 Xtt4iJ9/OUZJISlCCIlpIliYZVT5n8VVmHIW6h5LCH0zSBCj6y5NLCp/7ZeQZt6BFyh7
 ZoDQ==
X-Gm-Message-State: AOAM531shB3Zwo1iOSj3MUYP6IyWK9fdI6nd6m//Hp66iDkKhw7lLS43
 jsHIj5+MqVI4iqVv6osoMeFQyw==
X-Google-Smtp-Source: ABdhPJyeT+KxjyC94j5N+rfQfDyWTDiqqHSfAO3JO/MYUToUrCmwpPVeBGCcFCYe1rG45lq2kx/2Tw==
X-Received: by 2002:a63:689:: with SMTP id 131mr2278235pgg.401.1590560805099; 
 Tue, 26 May 2020 23:26:45 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id m12sm1239121pjs.41.2020.05.26.23.26.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 May 2020 23:26:44 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Wed, 27 May 2020 11:55:57 +0530
Message-Id: <1590560759-21453-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
References: <1590560759-21453-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jdpWc-008pkK-Nx
Subject: [Kgdb-bugreport] [PATCH v3 2/4] kdb: Check status of console prior
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
 linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Check if a console is enabled prior to invoking corresponding write
handler.

Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index f6b4d47..349dfcc 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -564,6 +564,8 @@ static void kdb_msg_write(char *msg, int msg_len)
 		kdb_io_write(msg, msg_len, dbg_io_ops->write_char);
 
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
