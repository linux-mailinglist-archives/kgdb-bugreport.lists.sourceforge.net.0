Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 452EB6C69CB
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 23 Mar 2023 14:45:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pfLFs-0006FC-21
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 23 Mar 2023 13:45:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <fmdefrancesco@gmail.com>) id 1pcQcy-000303-Mz
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 15 Mar 2023 12:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OmyRdtH3qiSO5QWPBLWz/8v2lIwyybKSmrlaokl//yI=; b=e7LPA1iMx45r0TjeYSmAyJCguA
 yxgwa5nno6Ao5VupkCQcc6B8WZsjyc591L/aBZTg6icZ72AGLWN8Kn13fyVeWtUkRq3yp6qj1XNzW
 IvYf4/oVVd2WuSUr2ik9qg8H2pHHto8mM/KnNUpvMgtU+HV8DZtseDcoe+Q7DsmQSk7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OmyRdtH3qiSO5QWPBLWz/8v2lIwyybKSmrlaokl//yI=; b=I
 QHpmDoOOc3edwoYlZB90nlafwCO3k0Px9Ge2DRQ1GpAduVg79uHmIICyBJblAAHdBf8xY87Y6g6Nk
 0PhN8tyKt87wX6jmC1YB4FGSD2Hh4aSj/36tiBwcrpKtsuH6kjH8uo9eukCnmqKIsLBWL1irlESnQ
 Ku540t0TURqH7uB8=;
Received: from mail-wm1-f54.google.com ([209.85.128.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pcQcu-0004Kp-RI for kgdb-bugreport@lists.sourceforge.net;
 Wed, 15 Mar 2023 12:53:12 +0000
Received: by mail-wm1-f54.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so1141243wmq.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 15 Mar 2023 05:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678884782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OmyRdtH3qiSO5QWPBLWz/8v2lIwyybKSmrlaokl//yI=;
 b=IKjEROzVMXRIH2jmXhG0/7c8b2IOHgUL6F+2j+hWDlKOJt/JE1CMxqsmVUaTSZ/ZII
 dKxHynYor0Co5ohMyb3jBPd3zTrvQxj0esnBH5bKxoki7lGTb2Pkw+/vx901t66bJvUM
 loxVftu+i7vhzZJi4xrspTeYOoe1S1Fms95gRioUAdgmxAhGxEFQQ3t2kw3Lox6vAFSR
 NL9aWBYFpdcq5c/DpZbhv6wECLhIiyxvF0A1juR88OjXaQAM2DEcGIudZwH3c1pLWPCj
 pTpj9gmfbneGj4wRu8aPNV6Kr5SIcTiI87VPALaqWD3/U818FxvX8qsZnfVBC/hs2hAE
 AeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678884782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OmyRdtH3qiSO5QWPBLWz/8v2lIwyybKSmrlaokl//yI=;
 b=XP8Jsv8z3DQRQBrmI1DpI0Elb1oaZkoEt8xX7QH6P3zOBXupJBMq+mcEyDBFnusL3L
 ewU9z5kNrV9+LCN+syFrPAyajvc8sfNZIAC0OMEI0QtNM/gagF+yUoHsIhIaDRp7mFH7
 Zp6Q2fr5IBX73DZs0TTNAy2ieo62Y65CE+dKt3RYeLenz/xBjP1aY2mlqx6ofXjnFZkq
 Z6eoZis46LZs2r26i9z8Qaf9XrK9NLGyG5okwzh+MrDhTQxeavGx9wQGsiuHHMSeWZ0K
 Mq80QjINPdAgLp1JNkxGcdSUQSYMs7jIZM6So1LNF2oBXbUHXp4LORpGlNBEqfSY+RQG
 si+Q==
X-Gm-Message-State: AO0yUKUj5a+TOsYvFXYvd6trVOFb1LspfKF5Jr0vmfhnlExFjwzSwAqC
 HKP/tF2Ylr/qwjk/b4R8pTk=
X-Google-Smtp-Source: AK7set99tKxZBFxqdMlw/6z3DNaJbvpo8WlRdBy5s/IULVxadkVRlZINUgSsb6joz/S+1AnBv0uW2g==
X-Received: by 2002:a05:600c:198f:b0:3ea:f6c4:5f26 with SMTP id
 t15-20020a05600c198f00b003eaf6c45f26mr17240294wmq.17.1678884782269; 
 Wed, 15 Mar 2023 05:53:02 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-35-102-94.retail.telecomitalia.it. [79.35.102.94])
 by smtp.gmail.com with ESMTPSA id
 k26-20020a7bc31a000000b003eb596cbc54sm1936761wmj.0.2023.03.15.05.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 05:53:01 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Chris Down <chris@chrisdown.name>,
 Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, live-patching@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev
Date: Wed, 15 Mar 2023 13:52:56 +0100
Message-Id: <20230315125256.22772-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use kunmap_local() to unmap pages locally mapped with
 kmap_local_page().
 kunmap_local() must be called on the kernel virtual address returned by
 kmap_local_page(), 
 differently from how we use kunmap() which instead expects the mapped page
 as its argument. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [fmdefrancesco[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pcQcu-0004Kp-RI
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:45:23 +0000
Subject: [Kgdb-bugreport] [PATCH] module/decompress: Never use kunmap() for
 local un-mappings
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
Cc: Ira Weiny <ira.weiny@intel.com>, Piotr Gorski <piotrgorski@cachyos.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Use kunmap_local() to unmap pages locally mapped with kmap_local_page().

kunmap_local() must be called on the kernel virtual address returned by
kmap_local_page(), differently from how we use kunmap() which instead
expects the mapped page as its argument.

In module_zstd_decompress() we currently map with kmap_local_page() and
unmap with kunmap(). This breaks the code and so it should be fixed.

Cc: Piotr Gorski <piotrgorski@cachyos.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: Ira Weiny <ira.weiny@intel.com>
Fixes: 169a58ad824d ("module/decompress: Support zstd in-kernel decompression")
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 kernel/module/decompress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module/decompress.c b/kernel/module/decompress.c
index bb79ac1a6d8f..7ddc87bee274 100644
--- a/kernel/module/decompress.c
+++ b/kernel/module/decompress.c
@@ -267,7 +267,7 @@ static ssize_t module_zstd_decompress(struct load_info *info,
 		zstd_dec.size = PAGE_SIZE;
 
 		ret = zstd_decompress_stream(dstream, &zstd_dec, &zstd_buf);
-		kunmap(page);
+		kunmap_local(zstd_dec.dst);
 		retval = zstd_get_error_code(ret);
 		if (retval)
 			break;
-- 
2.39.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
