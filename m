Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 625AC8AD1F9
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Apr 2024 18:38:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rywg1-0003th-Re
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 22 Apr 2024 16:37:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rywg0-0003tQ-BE
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W/RJrrrs8RwvpYrHG7SbHwPY/r0CKqLeGFzxu6oxqWA=; b=C1S0rPN7BlzZVc0GuDGzpqLuKj
 +XTc6Le8RqBy9k+cRRsgbVWEcHM84f6vJ+TaP7IHkGfdd2++ai73lkb87ri3uVf3R5ldimgzUgD66
 qahW+HdyM3rghkDthgM/GCg4ocGQbKHyf9edQWWsQFvr1FlnhNyZk9jPpFCGq0FMS+T4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W/RJrrrs8RwvpYrHG7SbHwPY/r0CKqLeGFzxu6oxqWA=; b=L
 vD2oPJ5cwcW47bZNTBkJJ3XFf2Htk35iLiacFyd2vdhgkObFaw1L+uLuFHDLUq3V3B9xZzzRpDOtH
 kz807sA9JOolTDLNeCICg4RYXd+8rNEk3tEs57NV6gaKOe7FQVzYdKQMIBcRGA59iJ6bcTfOIn3uc
 FhIe6RK7B7ZZKWwk=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rywfz-000115-Ry for kgdb-bugreport@lists.sourceforge.net;
 Mon, 22 Apr 2024 16:37:57 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41aa2f6ff00so1543345e9.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Apr 2024 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713803870; x=1714408670; darn=lists.sourceforge.net;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W/RJrrrs8RwvpYrHG7SbHwPY/r0CKqLeGFzxu6oxqWA=;
 b=JOBzW3NJhJh1QCNUCNSXDXKlgt8OUyr7aSlg/STd/wii8XkwiIC6SVcHbu2qof7WK5
 jZwhqxrHomglS5zWXsW6jynOMy/eXs7KYiOZ1sXWSwIjJC3TjrOtSiU70uUekPoFXpKM
 1DGgQtRMUcL5yCVUn/tjgpc1N0nLDZqJL2KUO0rUrQqH1750DtXbLDU9u/eOWtRE/4er
 bGOsgydqT8SfSGp+IabZsFVJF5P/UiCvT3advxMOqamdNIV9hs1b6DmSnML8sSOEFv7N
 7OYjXTDLK6eNvX2sabZ8RoE8ckF18/W2hKwbPLKSYiFjkPibnQbaczdjDUkk3fi2zQ1d
 lFcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713803870; x=1714408670;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/RJrrrs8RwvpYrHG7SbHwPY/r0CKqLeGFzxu6oxqWA=;
 b=b19qRuQ3kGefuv6vRFffQBTlBmIZQnGHRMnCwGOClqiOzOfeE8e3LnL5s8fDlkgZFU
 qYA1KxI1fUyszqVBW6hKZVGgNFavG+Bjmr0EmWrdNnUGny4y5lrDslYjoa/T6P7V5CPD
 1OP0tRBnoX5uV6XaCAfpXPf/vMvqGi0s/LOv2kOiY8tycNvWPX6+yatNbP2b1xtq5gaY
 zCOyg07xstcife3Z2CKUA1+dRx+SlyEobp0pvsflcB5pEAwfz7V96zxoTxiSExJdQEQE
 7gDHKwb7QGQXolevp11Wt94iu0QTJekOe9MOHhzV2APUwt+DUOdQqt2bZaJTCPjW1oUB
 maFg==
X-Gm-Message-State: AOJu0YxAv+WI7O2mHN4kWBpEmhLpsnI99AMkmva/HWXF3mjeto0+uUQY
 TCDkz6ctkHP7G82y7eBaoCn8p7tFURHVbhRafJQrjM4Tzj/6jmVUUR08vGSzaeE=
X-Google-Smtp-Source: AGHT+IEq1dPmWSDiW/s+JYEDdjB58eHF/R/VUvio1ax8A9B8QWPR1f0qHTZyqiH56s6nclUVAWVSJg==
X-Received: by 2002:a05:600c:4689:b0:418:f308:7fa2 with SMTP id
 p9-20020a05600c468900b00418f3087fa2mr9531927wmo.14.1713803869838; 
 Mon, 22 Apr 2024 09:37:49 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jp13-20020a05600c558d00b0041a9a6a2bebsm433343wmb.1.2024.04.22.09.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 09:37:49 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 22 Apr 2024 17:35:53 +0100
Message-Id: <20240422-kgdb_read_refactor-v2-0-ed51f7d145fe@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOmRJmYC/22N0QrCMAxFf2Xk2Upbtik++R8ypG26LiittFKU0
 X83DnzzJXBuck9WKD6TL3DqVsi+UqEUGfSuA7eYGLwgZAYtdS97NYhbQHvN3iCP2bhnykJ7o3F
 2akBrgYsP3tBrk14m5oUKn723H1V9059u/KerSkhh1dFplEoeRjzfKZqc9ikHmFprHxZbklS1A
 AAA
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=H6lY9kh62C4YQstjcqSOklbN1ZNSivp/MHHRCWngx/g=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmJpHtkKsfkSXNmY9hGFqe83qhrZ53UoPZO663u
 6hQPnNvMfWJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZiaR7QAKCRB84yVdOfeI
 oeekEACbufg6Gh/VvIIcYb0alGNjOAr7Mt/Xh2T+vBP1rKQ59CIlF6jekwGOWqZrLQWxvngMN7r
 +1H7M9HRBfuW8EHdOtLkncBL+Zc9sO9XlAVbp0tEZA93WzyFrqZuFUqZVGcVP+RKn76blnYgCLE
 gkJpCWKRBW+N8amQNP6rmLhZjjVpTuv/0QpPKbkNXbxhUZBrFnrsH+8FkSpx8xwmt6MyTqjKZVJ
 KUynxaIMBXMyjMv81FgnTojX2NAB8NynwrsxCnhfc/LX5KzKIjCDijYP2wfWpT37VBE4rpiI0rZ
 qrDgjhRPg0DeHPiKdtjIEOgbD+n5HlWU/iKzNFWpytkKyfFES/3O2Vx2RkkwgXQlUOcBlUJ3HkC
 gUF217AgffkBRamyjOqPYZszjG4BUibaJTbNmeNK3Oz8p4sSI8y3bW+mgg/t0d/bvSt94f3VUQ/
 R/7k40vyL2vrEMSks/kE9e3jUSMWtKe/yWKUueWEi9ILZkSYTrPZhO5H5PdMG0EsJ/Fp914tDgf
 oGRPWvoUXinJrvLaMgbFYVoGoig80vjilbwmvbYlq/qypUMCUFOnreglL3HSexrsHxykbrEDM82
 3JzFHDOlReG7Tcn/GMLAzhQ+o19Akf1JEgaGExm6F6Ce5lH8TLcBpmcbTaQSXpdH25RMZ6FLB52
 3Kf8+wJ5FwwDsaw==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Inspired by a patch from [Justin][1] I took a closer look
 at kdb_read(). Despite Justin's patch being a (correct) one-line manipulation
 it was a tough patch to review because the surrounding code was hard to read
 and it looked like there were unfixed problems. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rywfz-000115-Ry
Subject: [Kgdb-bugreport] [PATCH v2 0/7] kdb: Refactor and fix bugs in
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Inspired by a patch from [Justin][1] I took a closer look at kdb_read().

Despite Justin's patch being a (correct) one-line manipulation it was a
tough patch to review because the surrounding code was hard to read and
it looked like there were unfixed problems.

This series isn't enough to make kdb_read() beautiful but it does make
it shorter, easier to reason about and fixes two buffer overflows and a
screen redraw problem!

[1]: https://lore.kernel.org/all/20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com/

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
Changes in v2:
- No code changes!
- I belatedly realized that one of the cleanups actually fixed a buffer
  overflow so there are changes to Cc: (to add stable@...) and to one
  of the patch descriptions.
- Link to v1: https://lore.kernel.org/r/20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org

---
Daniel Thompson (7):
      kdb: Fix buffer overflow during tab-complete
      kdb: Use format-strings rather than '\0' injection in kdb_read()
      kdb: Fix console handling when editing and tab-completing commands
      kdb: Merge identical case statements in kdb_read()
      kdb: Use format-specifiers rather than memset() for padding in kdb_read()
      kdb: Replace double memcpy() with memmove() in kdb_read()
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
