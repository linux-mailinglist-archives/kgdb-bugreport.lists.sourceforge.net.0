Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2852D1DE90D
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 16:34:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc8kj-0000WJ-R3
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 14:34:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jc8ki-0000WB-2b
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jt95gM7bDaZUZl096LfhQlytpSjYv3RkW970ThzaFFA=; b=AOYifP5q2zMZoekYR3na/K/7JS
 NQXUK3Th3UhLNy8B+Ov7Lm91wMfl1Lq5k3EYhqI5Ft0n0HrLHoh9BZb3n5P7UMFjT2sOKJPPDFkNp
 aqy6ie2s3ZHkABHzVGAfi+jniDpimFYfe8YrjszgUHCZFf+oqZiDl+upfRCcSwhJVd9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jt95gM7bDaZUZl096LfhQlytpSjYv3RkW970ThzaFFA=; b=bJKNTag9rq9VIoIefPL3EuS1Ah
 NlXU6ZlHIdir+z4Enb+bTz+ohFGs08jdO7LE8codFNuiZzKHTVHIz2kfe/M1s+nY9vUiJe3Rpb5E5
 KIZf+7ES4ehlC6MBjwTrdNXZuZ0gTXxpe8Y4Drj2EibwqlQp4fQFuxpLiLKylbiVxz5o=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc8kf-005RMY-AU
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:34:24 +0000
Received: by mail-pj1-f66.google.com with SMTP id cx22so5014110pjb.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=jt95gM7bDaZUZl096LfhQlytpSjYv3RkW970ThzaFFA=;
 b=IA4Vzz42923hj72QNNcuVRP/Txsfsry0y7VVQ453xTFlJkzgmIqq5tWR1wl7ywD7jE
 ff9YJ72Pa1DMNZfT/neHIll7EA8oHhxHsYA811SYOTMpoVoaVlqCpQAuMzIuMh5pSWjS
 Webi0gLSSquYMpAoUA139QPmQDlz6IT/fR2bLQ9udlwxdRp2pyvi4VAI+ivSmXEkfF7a
 0TK+s81lg1eOw1GX5Txyhs11DZkjcC64QtTbqq7KgQUKCoZR3idaEbR+Awh1wrzagGE1
 OzOh/mM0H6DqIjcmX6zmrWyGiLpZldAxi/u8hm/NO439ICLl+RJyLDjfVVPovBaKLb13
 vzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jt95gM7bDaZUZl096LfhQlytpSjYv3RkW970ThzaFFA=;
 b=q8Qn5I94Q/C5QLjnKkqC2pXl02xklVOabSLAi9d8FfVitMavJqdE2Dg7FdHZRSakeL
 n+Dntqy2TRneu2q+WVaSnZpJT2LMJMVETWpvn0fnZLgmZ/3C1jbGS/nlfXuOHY5OTjdl
 kYnU+nOfIiE12wsU0LUKwSQE1+Cz0QhCsQ8+P40djxsSOIz/v7SiyITsshusHd6gMWhd
 MPc4Q2cG4jsF22LTNnp6L5L/4+DOcsxtcNzWmTemOgvW8M8Z/DmYSJONwrxnqMcwlW5f
 WPr+u43H6ikZKK7UfubFourWNPz9FQKqwsFZr8QiZ3YNQif4ANew1HzKrO1ftRGnb280
 +j8g==
X-Gm-Message-State: AOAM530mYvrnaE9ChcjM+m7PMNti9mWg6gTZttYp1YvS3y00WEEHtCWR
 EIri2Ku5MMbE8Zac1d/0JwgxD8PoEdg=
X-Google-Smtp-Source: ABdhPJwL0Aom7OL3QO7sP6rWI4bhVxcyO1dbOlAn6mkTgxiIBT3D8I7zFT6+ruJ9GGI9iCbEmyr17A==
X-Received: by 2002:a17:90a:f0d8:: with SMTP id
 fa24mr4722575pjb.93.1590158055272; 
 Fri, 22 May 2020 07:34:15 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id r2sm7247889pfq.194.2020.05.22.07.34.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 07:34:14 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 22 May 2020 20:03:47 +0530
Message-Id: <1590158027-15254-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc8kf-005RMY-AU
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Make kdb_printf robust to run in
 NMI context
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

Changes in v2:
- Use oops_in_progress directly instead of bust_spinlocks().

 kernel/debug/kdb/kdb_io.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 924bc92..3a5a068 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -699,7 +699,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			}
 		}
 		for_each_console(c) {
+			if (!(c->flags & CON_ENABLED))
+				continue;
+			++oops_in_progress;
 			c->write(c, cp, retlen - (cp - kdb_buffer));
+			--oops_in_progress;
 			touch_nmi_watchdog();
 		}
 	}
@@ -761,7 +765,11 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			}
 		}
 		for_each_console(c) {
+			if (!(c->flags & CON_ENABLED))
+				continue;
+			++oops_in_progress;
 			c->write(c, moreprompt, strlen(moreprompt));
+			--oops_in_progress;
 			touch_nmi_watchdog();
 		}
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
