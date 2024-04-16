Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBA08A68E1
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJj-0004q7-Rd
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJi-0004q1-Q2
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=73kbs5VJGtZKxtjSM37kUl+tdcgdJXHyl+eR81HvUto=; b=er7tChkCnia8w/kNj90IrsqV02
 0+1I9gydliGumgwxoAqEm+gsOLgYzFvovnWhfsyR8DQ/VaBHJxUEEUbU0weLVTV1VxIZwJ13FyYqZ
 Ka3lbypXNpypGIsLgv147iycUdAl3ZzIBMZF84tMTLsixLf20xpTVYj6P2oXA2M8T6BI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=73kbs5VJGtZKxtjSM37kUl+tdcgdJXHyl+eR81HvUto=; b=m
 r2YAyfXKLPBLY6IrlvvFKp4c94Dv+PnB9t69uodGBvAvAw1FUtWt49tz+xt6Qmj+r4qTng45zdIFn
 kLyFEV/TV5tlgTH/3gxd+3+6OXgazmfD8JAzV7uQes2F1wYZr+c4weo7o11SDiZvCdiunJhAvOx67
 c2NzetcWAYKxcFCM=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJg-0003Zu-US for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:35 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-343d2b20c4bso3200850f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264321; x=1713869121; darn=lists.sourceforge.net;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=73kbs5VJGtZKxtjSM37kUl+tdcgdJXHyl+eR81HvUto=;
 b=gagu3PuxmmWL8iB/ysxP7bO9hTyV6JWSa9gXOp/DDfcm8qeedd7/1Rv+W2V77qs++I
 aAeVO/aV3fMbty8RNGOQodH9Nx8s/1nFOeG1wbb3C8W3aKZohvkVbXYSmFE+j/kBoKw9
 RcaV4GDCdBc0bL7QSxEVfzMcjNM+zDbEJveK/5bVsZylpI+g0L16Rj1uKIl5VAsUvXtn
 7sNrHyOWNLz640Z9rfd2Y15BXmpzEFObto1yilIsxfnZKg85IMxoP8jbEuCwu9HwxUjl
 x/Pp7mLr2DzK2M+el4VSU7Gg+0s3YE36T2NKp8g8X5rfgLE3Y2oOXu8oGrcr9YpCO5L9
 F0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264321; x=1713869121;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73kbs5VJGtZKxtjSM37kUl+tdcgdJXHyl+eR81HvUto=;
 b=Y/Al7KkMBaZr35Nr8Z69DUXc2fmcSe0QTZEYJmy2j3KtHDbbLYdlMekqYdN9roxDYH
 E5kBaLiMgyAs8BNeQ4UY67g2d81pE5u0mOUuyX91blHczQpzblzZmVRjbcDEJ3P/Fv5r
 w2hUjiiw6HpPszO06XzzmKSLW6Ey41exq3Xfrz0QaFQz/LJtVs4LT4ztVkX7E/y9cjkj
 SCWuaro09C5hVSWgHb9kWoLgGg49xbCoxcrd7KZarwGEuphsQj3D7SOEfqUhI8mjeiy4
 8NcAcJBfvTI0SyLU+0sL1oSupkXgEXVWLhkc3L/5zI9qKYASgxQpvZSrZaB81j1pTksd
 H9+w==
X-Gm-Message-State: AOJu0YwtoHjdOBI+10r03wRTWYYxDrEMJQlAn2w3brlUeKLgmzjyWU6p
 6vB1NP3mTB6xX5/Rj14U9TT4mitgm89zxDvIj16utBe15QEpJaajWKG1EI24UpU=
X-Google-Smtp-Source: AGHT+IEus0QrFqsiwanPBFgmjAVGHYH7Qs5v7rzguwH+k374rvHQ1vLsxPb89GflAFcILrO0wlrBiA==
X-Received: by 2002:adf:f404:0:b0:347:eb55:8f5 with SMTP id
 g4-20020adff404000000b00347eb5508f5mr3633603wro.7.1713264321139; 
 Tue, 16 Apr 2024 03:45:21 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:20 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:17 +0100
Message-Id: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEVWHmYC/x2MUQqAIBAFrxL7nZCiP10lItTdagk0NCII797Sz
 8AwvPdCpcJUYexeKHRz5ZxEdN9B3H3aSDGKgxmMHax26tgwLIU8ClYfr1yUIW9wjdphCCDDUwo
 //+k0t/YBfZhk+WQAAAA=
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=4kQYUNc9mzRT+PHh7G/UYt0sG1PbuqHRv+Wn2eqN/AY=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlZMs0vwQ8tOuyT2arstjNqtfoUEl8ZHGNwwr
 tCDqzdIr+CJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WTAAKCRB84yVdOfeI
 oTcoEACAPJFW5SjQtzaP6yGRdaHprXnRsogRVkZu6Q7ty0kWbvGjFDMKiIzb6A0ttgGmwyCIgcZ
 8iwQbdZFWioLmhyLSU6TDlt5tMOvzkjELjhJ98xkyPu7EMJYuqVrAzev5fm4sRpOVq+M1mCUm3w
 Qa7xPTYGMd6V+P8dHNTiZmvm7qYOausPaN0+X8kbiqWSs0FuTWZXmyV00MY6FxpW+7PGoQFFMKN
 hdQ6ftQXESXkqWojUg/9oGwdryVBl9S3lK3NOwfr1qhI6SsGWNMOomc8ln3MYfzsoH8kWIBSHyT
 /1hoxSVDbI7cri7PtOXvorJ0zuXkZ+oLXZrec8EYPOfoJoMNdhfsuaAg95IYsdkxF+dQv1EkA4T
 ViJUgS5+aeVWX/53vhPs/jqIn/245moTmTSRNF+TrnKvGPXvXduk5uCNP1cVNGm0pJO9hAjz6ic
 Shsewo20iC9Fiza1yLwFlmDDZXQdXGGsr1zxHDGkFKkmwwBL8szle7ZbgFJ25uc/H7hBvJBaetk
 KQmZoIUdVmHgkb6O60FSIvSUrR4d0Gt+615z+rXhsGeEbBvflcfFbOLoHLABQwRJGJa7klj+pem
 2KF+WxmoryDpTDWZ3g2mLejv2ucfXE5Ovw4okZxKQ41cZnbCcSLrpRcYHuxxk/wOtKKUTSQyMLB
 NRHWG6fvJT/V07g==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Inspired by a patch from [Justin][1] I took a closer look
 at kdb_read(). Despite Justin's patch being a (correct) one-line manipulation
 it was a tough patch to review because the surrounding code was hard to read
 and it looked like there were unfixed problems. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.221.47 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rwgJg-0003Zu-US
Subject: [Kgdb-bugreport] [PATCH 0/7] kdb: Refactor and fix bugs in
 kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Inspired by a patch from [Justin][1] I took a closer look at kdb_read().

Despite Justin's patch being a (correct) one-line manipulation it was a
tough patch to review because the surrounding code was hard to read and
it looked like there were unfixed problems.

This series isn't enough to make kdb_read() beautiful but it does make
it shorter, easier to reason about and fixes a buffer overflow and a
screen redraw problem!

[1]: https://lore.kernel.org/all/20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com/

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Daniel Thompson (7):
      kdb: Fix buffer overflow during tab-complete
      kdb: Use format-strings rather than '\0' injection in kdb_read()
      kdb: Fix console handling when editing and tab-completing commands
      kdb: Replace double memcpy() with memmove() in kdb_read()
      kdb: Merge identical case statements in kdb_read()
      kdb: Use format-specifiers rather than memset() for padding in kdb_read()
      kdb: Simplify management of tmpbuffer in kdb_read()

 kernel/debug/kdb/kdb_io.c | 133 ++++++++++++++++++++--------------------------
 1 file changed, 58 insertions(+), 75 deletions(-)
---
base-commit: dccce9b8780618986962ba37c373668bcf426866
change-id: 20240415-kgdb_read_refactor-2ea2dfc15dbb

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
