Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB31DE3AA
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 12:03:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc4Wi-00083W-0L
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 10:03:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jc4Wg-000836-G6
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 10:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Ly0FZ1XMvk/0WTHXshwlxj04l0m432nKVvBo4F3A6Q=; b=LFELm5yOpXuYqzbTlEkwDHug7r
 hFmKrm+fqiGnDLBdjlO/DG8i0PkQdjcXjotnsM+pprPVMuvwnLMMQtlfHzvgkIUrs9xsKC0Q2sAkF
 7Doz942L48BA9gZYxfeYXnHcRgmFeqW5TxBnWFydhCE+rAAD4lsZQXgHwQvQWngtqeNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Ly0FZ1XMvk/0WTHXshwlxj04l0m432nKVvBo4F3A6Q=; b=etcSF7Et+zTqlP/PYwy1nNUKV8
 Zfj6U+zLrXo1aed/zRAG5oWvX5QYb0kF90qKL67Dg2ZmUaIpns2gblXPICRLkw2EpWmy7HzlhGy3J
 AJbhi7hqD0QP8ggChm9ZGqde92ysqQTXyqI17BzLodXZM2Zh+hGrMolF53GveZtpTuZ0=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc4Wb-0027xx-6I
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 10:03:38 +0000
Received: by mail-pf1-f194.google.com with SMTP id 23so4993668pfy.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/Ly0FZ1XMvk/0WTHXshwlxj04l0m432nKVvBo4F3A6Q=;
 b=AozOV1JvUkbhSli/GuwvCZa+TcZ2IVZW1h1ssIA+PsgfpglluQQOZyPjlOzzguMWyt
 qKjOTrvJSjIwuwc53yi0bU83bMhGeDPTu7OPi5IUa/mZcOZDWLRi72u0U7Why35oq8Of
 gznlIWX0Poi4kVv1LZCO1+hbV+fGb+u6aDIpxk4ZwpBHFo3mBigaw8CtlHIInY5eXCzt
 +H2DhMWFVifQoptuWS4EPdDZS6kGG494BoEqxi+G9uFr5gH+FbAnCE1f5Id0SGmuArl4
 gAKuPyvy4IJr526ZgQmSGvo+Ywa25xEooqiPJFdQWwF0xmds3OYo5MU2Hhot5/t6FJ4C
 anxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/Ly0FZ1XMvk/0WTHXshwlxj04l0m432nKVvBo4F3A6Q=;
 b=uN0gQlAhdZInxPBNQ/+6XAGuHI47v8UPk4IUYtrW4jf3d4MwMrrZ1s3eWHpyrkhR1R
 5srLnWIpsiYrF4LrvJGQstWsq1unJdiN0hcgv9PbFbtKmmvKu8phYB7kJxtqPTDLUlcr
 rn8wVKsSfJs3w6HHV+Meq3N70TCD/t9PGzn/lTTUyLUewixib1Nv9g4+72VEO0kpxCIh
 zHwSmIjzu6Nj/kgbQAVKzZkOfRbSG/B2eke9wi+mYxyJEYjCqZ1Bkr1QPzzGbLDFyV1v
 EDkK1y4ypr69yBZYEz9bpe0Wik6XU4UAGo+T6faAJlsRl9c1Dql2BBT4rOIp0BR+JB/k
 FgMA==
X-Gm-Message-State: AOAM532Nz6r887ZW1sVqzo/DgUh8LYjAC5LkCTE3hQxpoQ/0z7QMdA7K
 8aOQLr0nw8eYKGgSygkEAJVd9Ot9G78=
X-Google-Smtp-Source: ABdhPJwWr2TfnrurtMH4xVDrw2CfDB32Bc5E8x2mOS8SX+3DgkeMHiuUcbAQx3t3cBf4wEFfwnvuug==
X-Received: by 2002:aa7:9297:: with SMTP id j23mr3099183pfa.15.1590141796773; 
 Fri, 22 May 2020 03:03:16 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id c24sm6477633pfp.186.2020.05.22.03.03.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 03:03:15 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 22 May 2020 15:32:26 +0530
Message-Id: <1590141746-23559-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc4Wb-0027xx-6I
Subject: [Kgdb-bugreport] [PATCH] kdb: Make kdb_printf robust to run in NMI
 context
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
Cc: pmladek@suse.com, daniel.thompson@linaro.org, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, jason.wessel@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

While rounding up CPUs via NMIs, its possible that a rounded up CPU
maybe holding a console port lock leading to kgdb master CPU stuck in
a deadlock during invocation of console write operations. So in order
to avoid such a deadlock, invoke bust_spinlocks() prior to invocation
of console handlers.

Also, add a check for console port to be enabled prior to invocation of
corresponding handler.

Suggested-by: Petr Mladek <pmladek@suse.com>
Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 924bc92..e32ece6 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -699,7 +699,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			}
 		}
 		for_each_console(c) {
+			if (!(c->flags & CON_ENABLED))
+				continue;
+			bust_spinlocks(1);
 			c->write(c, cp, retlen - (cp - kdb_buffer));
+			bust_spinlocks(0);
 			touch_nmi_watchdog();
 		}
 	}
@@ -761,7 +765,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			}
 		}
 		for_each_console(c) {
+			if (!(c->flags & CON_ENABLED))
+				continue;
+			bust_spinlocks(1);
 			c->write(c, moreprompt, strlen(moreprompt));
+			bust_spinlocks(0);
 			touch_nmi_watchdog();
 		}
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
