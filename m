Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCB61DE915
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 May 2020 16:35:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jc8lZ-0000cS-TV
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 May 2020 14:35:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jc8lX-0000bj-VO
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=40rREeQMNZRNzVvKI3RsdQwOOpr5Hq74BH4Z18GJSk4=; b=AdOfNR8uggnG7cecGHDQxv4i7D
 Lav3m7ULslXe75lIcLw4M3JuCMLmIBIrwgSnAeJ7L1iA6oE0DYw+ogUF85FM5S9t/ahv9YX3n3vFw
 PcfQrzdwifJDPt9GmlXZrXZmzO8BcqKKRTy5sS2WWxQfsTyqJJan+VLh/TKnF4de2eG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=40rREeQMNZRNzVvKI3RsdQwOOpr5Hq74BH4Z18GJSk4=; b=AJEWiov3jMNC6O+ejUr1fqydbA
 uHRHN08iCCujA3OHuMd+kStO13muYEpef81fxpFiJ3vNGg8w4jB7Q3Od282WFdHdFmw7Zfr1aVgbr
 T92XeSMlEIqHAJSw8XNvRqbgoNNpVIyRMA7+Vhi/ZnmLJtyY9aNtDS+qDDmQ23chB6xE=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jc8lR-002P5q-W6
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 May 2020 14:35:15 +0000
Received: by mail-pg1-f193.google.com with SMTP id d10so5087930pgn.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 May 2020 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=40rREeQMNZRNzVvKI3RsdQwOOpr5Hq74BH4Z18GJSk4=;
 b=uN45YW4tw5D0FgwoNORtV54gmgbTluyIq0aSQaeMi7KCyrcStZFZMJ+orbDu/nqQnF
 Nb2PTjMZuG4ZX2Oxf6o9I3PTwm5Mr5ppE0P+4hmG8wi+MWM7Ix18h9xLBjH5qIZm60DO
 wyPiJiZB6KdD1PLs7Hlg+C6oimuKA55JObI9T5pp+83pwnzuv6s9YMN44sh3ITkty9/P
 NBSqk9um/JP+LPhb9TpbnEmmkajvQQKDPz9xF2amcMA44g4vF4h1v4AJQlMIK7Vcg9Up
 66JWgWmPJGqtgKfr11R7XIkjvmpDCq19ESERhsQNnvZyErAVIoM1jxXLwDFdXESq0z2e
 65SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=40rREeQMNZRNzVvKI3RsdQwOOpr5Hq74BH4Z18GJSk4=;
 b=TfCq5pFoUEZGOEbapL453/+D9QQD5PAn07EZ9bmKYA43OCQJ7fbHl1DlibEuc36tRl
 tFBPv0l2p5QykfsN6FQboKK/UZm0nFi1qwUAzv0FrSE/lVqWQoXXb3M9dAUdQytZ2Kri
 FfzuQ8rmqXdudXsdt3joIHVqOzSkfTuFxxx6/kBkJg3JzT8Mn516bvhqYo8KOzn9oth9
 9RvktP+BeyGs+YCHWEW1Ij4fwv7Ki5Aed6A+9z3U4UMqu9etLwMwlYukGeeLIuWs4432
 dE+2FVLXyv3l99esjNqcnDAmjvcwgkQXQG+vpN25+DNIkXygVZXbiabRXcD4uPClbhRt
 tZhQ==
X-Gm-Message-State: AOAM530+dsS0sN4xhOItIph/UrH6WJreKPcnKAg/X5vmqX9YWxFINUi2
 C2TPAFlbA/aB9VJql/hNB35sXCIizAE=
X-Google-Smtp-Source: ABdhPJwrZRHOfM6L3mN940SNqqfhLIyCYCUZVuvyQcynkBdfeibkcfVH2yK05wo1GjCH7DMHNHZxXQ==
X-Received: by 2002:a62:15c7:: with SMTP id 190mr4204642pfv.190.1590158096802; 
 Fri, 22 May 2020 07:34:56 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.136])
 by smtp.gmail.com with ESMTPSA id y20sm6774642pfo.173.2020.05.22.07.34.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 May 2020 07:34:56 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: kgdb-bugreport@lists.sourceforge.net
Date: Fri, 22 May 2020 20:04:31 +0530
Message-Id: <1590158071-15325-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jc8lR-002P5q-W6
Subject: [Kgdb-bugreport] [RFC] kdb: Switch kdb_printf to use safer console
 poll APIs
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

In kgdb NMI context, polling driver APIs are more safer to use instead
of console APIs since the polling drivers know they will execute from
all sorts of crazy places. And for the most common use cases this would
also result in no console handler ever being called. So switch to use
polling driver APIs in case a particular console supports polling mode.

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 3a5a068..8e0d581 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -24,6 +24,7 @@
 #include <linux/kgdb.h>
 #include <linux/kdb.h>
 #include <linux/kallsyms.h>
+#include <linux/tty_driver.h>
 #include "kdb_private.h"
 
 #define CMD_BUFLEN 256
@@ -699,11 +700,24 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			}
 		}
 		for_each_console(c) {
+			int line;
+			struct tty_driver *p;
+
 			if (!(c->flags & CON_ENABLED))
 				continue;
-			++oops_in_progress;
-			c->write(c, cp, retlen - (cp - kdb_buffer));
-			--oops_in_progress;
+			p = c->device ? c->device(c, &line) : NULL;
+			if (p && p->ops && p->ops->poll_put_char) {
+				len = retlen - (cp - kdb_buffer);
+				cp2 = cp;
+				while (len--) {
+					p->ops->poll_put_char(p, line, *cp2);
+					cp2++;
+				}
+			} else {
+				++oops_in_progress;
+				c->write(c, cp, retlen - (cp - kdb_buffer));
+				--oops_in_progress;
+			}
 			touch_nmi_watchdog();
 		}
 	}
@@ -765,11 +779,24 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
 			}
 		}
 		for_each_console(c) {
+			int line;
+			struct tty_driver *p;
+
 			if (!(c->flags & CON_ENABLED))
 				continue;
-			++oops_in_progress;
-			c->write(c, moreprompt, strlen(moreprompt));
-			--oops_in_progress;
+			p = c->device ? c->device(c, &line) : NULL;
+			if (p && p->ops && p->ops->poll_put_char) {
+				len = strlen(moreprompt);
+				cp = moreprompt;
+				while (len--) {
+					p->ops->poll_put_char(p, line, *cp);
+					cp++;
+				}
+			} else {
+				++oops_in_progress;
+				c->write(c, moreprompt, strlen(moreprompt));
+				--oops_in_progress;
+			}
 			touch_nmi_watchdog();
 		}
 
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
