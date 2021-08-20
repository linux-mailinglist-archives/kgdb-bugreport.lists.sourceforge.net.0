Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706F3FC5AA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 31 Aug 2021 12:33:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1mL151-00038f-P3
	for lists+kgdb-bugreport@lfdr.de; Tue, 31 Aug 2021 10:33:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgel.zte@gmail.com>) id 1mGuDY-0001di-CQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 Aug 2021 02:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e12Fdj0H/GzNvYiPmXkZR9coJxYkGDOj8wc4ZBlhff8=; b=dHY8VB+4U61x9i4OxHK6fk9s+x
 yPVQ6r2f7fCXc3HAQ/TaWWc9o7iufvf9IJmTRibOdWVjGlic+ZmzL6Oj4HudA5UbzdbwKyoAL4CkD
 2y3rt67XjkmjO2LxiS6rCE2cwXZy3ZWO/y7S+QRqA3YJA5mYi36bFQXBVAVX8I/jmqJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e12Fdj0H/GzNvYiPmXkZR9coJxYkGDOj8wc4ZBlhff8=; b=g
 xVKzxNCOF96F2M/Jqsse7axzETc0Bk3Gvxn0Y8SpVprowYt4wLoQsnevHt1WwR1TDUU2a5+qJHTVC
 FT6BRtItUWDFunlb6uJfIuMf1/aMglJzf62QTGiGOT8GbaukQUohj+3OxuTCPIrZPCi9+IgVUZUgw
 hqLKs3iBO0w6fgw0=;
Received: from mail-qk1-f172.google.com ([209.85.222.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mGuDU-0000Bf-Ih
 for kgdb-bugreport@lists.sourceforge.net; Fri, 20 Aug 2021 02:25:12 +0000
Received: by mail-qk1-f172.google.com with SMTP id 14so9436392qkc.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 19 Aug 2021 19:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e12Fdj0H/GzNvYiPmXkZR9coJxYkGDOj8wc4ZBlhff8=;
 b=Vk5qUmT6JpyL0tQl7SYZTk25N5BoXeC9/+yEfiI+yRMOmQmU0UOfwi5d76NOrjoKWE
 4DvR9WCNUPYFWxfF2VXDZOMqo79zWdvt1APShnn2yg5OfgTVH+fDGiWa7UxGIpb/1yte
 wU1DKoiqDF54JqjTay3sM2DsT9zRO7DKFAFEmektQAx5eq0SpPedf2pns2wWP50Wy2J3
 lpw7hc5bsk5AcF3VNcCnG69og8ORqph4dzlpS8FzFEp1ZbHmGu5w/PU5DifqT3Nl/QXz
 +jcaTmx97QoqyiGd4APkSKd0fj+ynBoLXq65mHFvu3yT/rxR4tzrFUrOwwuBD19/tsW+
 xEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e12Fdj0H/GzNvYiPmXkZR9coJxYkGDOj8wc4ZBlhff8=;
 b=gV/2w9Oyyi2VoSD5FHQPiLsDixN/D9OXZAxAFt3anZwJzgCUoSQvwOr5g/V4xU5FN4
 AZJOsHYp0BQuJCy/8dCgxXXsrUWMWO2hNaMSVVmtgw7B5l9unXtUpxQtmbHDyPRhsP8L
 X6JcDSxNHX99aIzaRGCs9LlcEHvhkUr+zm9ioYoJkn0xTI3ZmvN1gJ75zuqsY1aQ05XX
 5f26clJwTtazNj2il11mL7MDCfJ4QxO9XDqK/1T45gu+V4Hx5L9gfGXaoGiZqhUg0v6A
 13rPjheQNavqbAA3O15mdpfoh9Uh0/l3Hp+9VinRMz0OcFh42ebL66Y+684vbcvz/9PQ
 9hYw==
X-Gm-Message-State: AOAM530BljAod9Nw+AydILYka/FN2GWXFTnoQCH/4ZXg5AfkjnXxKTcd
 fvU4RyfifanPQXXUoKwjP/E=
X-Google-Smtp-Source: ABdhPJzMvF5SJh0bN8VWKI3dxiY8iD94/z4UdRgqg5m1jG4vlfCimhoAUS317AsU7+zc0xyp3H0QjA==
X-Received: by 2002:a05:620a:1525:: with SMTP id
 n5mr6726722qkk.386.1629426302750; 
 Thu, 19 Aug 2021 19:25:02 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id d26sm2586626qkl.6.2021.08.19.19.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 19:25:02 -0700 (PDT)
From: jing yangyang <cgel.zte@gmail.com>
X-Google-Original-From: jing yangyang <jing.yangyang@zte.com.cn>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Sumit Garg <sumit.garg@linaro.org>, Will Deacon <will@kernel.org>,
 Stephen Zhang <stephenzhangzsd@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Thu, 19 Aug 2021 19:24:42 -0700
Message-Id: <20210820022442.11107-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zte.com.cn]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (cgel.zte[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.172 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mGuDU-0000Bf-Ih
X-Mailman-Approved-At: Tue, 31 Aug 2021 10:33:22 +0000
Subject: [Kgdb-bugreport] [PATCH linux-next] debug:kdb: fix unsigned int win
 compared to less than zero
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
Cc: Zeal Robot <zealci@zte.com.cn>, jing yangyang <jing.yangyang@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Fix coccicheck warning:
./kernel/debug/kdb/kdb_support.c:575:3-10:
WARNING:Unsigned expression compared with zero  p_state < 0

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 kernel/debug/kdb/kdb_support.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index c605b17..fb30801 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -560,7 +560,7 @@ unsigned long kdb_task_state_string(const char *s)
  */
 char kdb_task_state_char (const struct task_struct *p)
 {
-	unsigned int p_state;
+	int p_state;
 	unsigned long tmp;
 	char state;
 	int cpu;
-- 
1.8.3.1




_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
