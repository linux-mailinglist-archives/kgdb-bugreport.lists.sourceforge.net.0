Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30F90C0E6
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:04:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNGn-0008Py-A9
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:04:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNGm-0008Ps-It
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=omgt9hawKdl/cfJMYFE11rv/XXi1ULnu+83s0osHk00=; b=ecsWJKwt7kj1VBgHwOgySdxkcX
 4Kdeai14YLaK1cY57pERosl4l8QF8EfGH1Ehwk0z0ZZ+NUDwZx4Be27ABZS1L6Xj/9BXNysbH3QUt
 NBFQQXHByGJFsxboxFKa+ZccZBW3ldIaIc0y/WMtS8yUktq/XiQDeUt0WF3Qkk9+ERDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=omgt9hawKdl/cfJMYFE11rv/XXi1ULnu+83s0osHk00=; b=WL/0srL8y7OqKSl9g0+DZ5MbpX
 +OKa9tXj0SaeQq1oYvLqEdCypHnEx47UFGYKbnnRckNED+DKs5Wx7sjewsooH/Q9zV32LEBvKayV7
 +uQKwCuIXUeNGvOVpSFGKiEZm4oi3WW4n7mGGahBs/5RFIzJpwGMfdT4zsODiPL5FNqU=;
Received: from mail-yw1-f177.google.com ([209.85.128.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNGm-00067I-4A for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:04:19 +0000
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6326f1647f6so33016547b3.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672648; x=1719277448;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=omgt9hawKdl/cfJMYFE11rv/XXi1ULnu+83s0osHk00=;
 b=fNx2uDsPo6h4aehwNUI+G/AOjOj7nSxZNISq2W6oee4cpYnun1fOJtkOWB1VrhS/fh
 iD/RBy4hJri6bydo1Oc7VGfbkupTWsuw+K6EExVY1b0u6RJfK7ezvzV8vOwkHH1bR0/l
 f1ZFIeMr3Rh831R7b8n7nsQ68ZOaCqfqiGZ1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672648; x=1719277448;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=omgt9hawKdl/cfJMYFE11rv/XXi1ULnu+83s0osHk00=;
 b=U5zeDiUeMFVO93eGfzGsM/WR6SaGP2wXxRJ4Lz8yHZ8pGVtbPq6lcEowBeul0/TUdb
 tBcfnDJRKzIhZQJJn8iTuJTWmgwTi4kM6KNvpN41x6JaJqeIdx46UJDMG2I4ZJsQrB+Z
 cyXa+6ElJCyHAuglu8idapyXKnmTsK27c0ObxbKGnCC1P6pURQ1/YXT1RNvjP++2jU4d
 KHpEQujAvIgjRYgQE/2Z1ttHwi1XoQsGUajGlBsKl36kg9N526AxPRbQ9SLJSG/WbWUZ
 +bcDOS6Xe8eYTWu5X9GtKtwwR5Utsau+xBTWSdPxMp1UeUxKpIYunXlcx4rQT5Q4BXUB
 C6Pw==
X-Gm-Message-State: AOJu0YwykYLZXIW+Nd5fIXz2Lh8vidxfeFfkRYXwuh8LosaSX9a3rJxb
 ORdiXmvI7SKgPjE4x0aA23brrHR1VcZru17kAvpdLkVsz63YqiKe5THoJL8HlhITVYtnbU/VYPU
 =
X-Google-Smtp-Source: AGHT+IHtbC25s0aTUY1ZqOaNeu7VCFF+xc9eyM0e3dUxN0EAX7KLndR1scK8IXp/tiR+XWvQvp1LNw==
X-Received: by 2002:a05:6a20:841d:b0:1b5:d00e:98d7 with SMTP id
 adf61e73a8af0-1bae7ff15bamr12235079637.24.1718670967267; 
 Mon, 17 Jun 2024 17:36:07 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:35 -0700
Message-ID: <20240617173426.1.I0535f656e94cc475de6b04652aef4f9e9fb45f49@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The "minlen" field should allow us to abbreviate the "md"
 command as just "m". However, the kdb_md() function does a lot of checking
 of argv[0] and the logic there simply doesn't handle if argv[0] is [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.177 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.177 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.177 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.128.177 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNGm-00067I-4A
Subject: [Kgdb-bugreport] [PATCH 01/13] kdb: Get rid of "minlen" for the
 "md" command
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Thorsten Blum <thorsten.blum@toblux.com>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The "minlen" field should allow us to abbreviate the "md" command as
just "m". However, the kdb_md() function does a lot of checking of
argv[0] and the logic there simply doesn't handle if argv[0] is just
"m". While this could be fixed, "m" isn't really unique (it could be
the prefix for "mm" also) and it's only saving one letter. Remove the
setting of "minlen" to 1 for "md".

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
While digging into this, I found that "minlen" doesn't seem to mean
what's documented in the structure (AKA "Minimum legal # cmd chars
required"). If it worked as documented then you could abbreviate
"summary" with "summ", "summa", and "summar". In fact due to the
parameters passed to strncmp() only "summ" works as an
abbreviation. Fixing that could happen in a future patch if someone
were so inclined, but they'd have to decide whether to change the
behavior of kdb or whether to change the comment and keep the
behavior.

 kernel/debug/kdb/kdb_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 664bae55f2c9..cbeb203785b4 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2679,7 +2679,6 @@ static kdbtab_t maintab[] = {
 		.func = kdb_md,
 		.usage = "<vaddr>",
 		.help = "Display Memory Contents, also mdWcN, e.g. md8c1",
-		.minlen = 1,
 		.flags = KDB_ENABLE_MEM_READ | KDB_REPEAT_NO_ARGS,
 	},
 	{	.name = "mdr",
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
