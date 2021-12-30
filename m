Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F44D481E9A
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 30 Dec 2021 18:24:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1n2zAU-0002ag-0D
	for lists+kgdb-bugreport@lfdr.de; Thu, 30 Dec 2021 17:24:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lukas.bulwahn@gmail.com>) id 1n2zAT-0002aa-8Z
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Dec 2021 17:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6vTt0sPTxRfRnwBDC4e+K/XdNIJukWXPcDujgrHoT4o=; b=VoZV2P2jBlUuzvLQghHAUd7+ll
 VVSHvCIIuExusi4wIJHrWzvZlHWtzjfw1RdYOP/YzaJkkHy2qKxGZ+XNqEga60C/9Uy0++4K7ZCJD
 sLwsQ1+9tCZilo0SJ9Vi9bPUQDWhHzC3aesPF132yh+0Jb/lHKusuYyT0LGMvoyOGqac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6vTt0sPTxRfRnwBDC4e+K/XdNIJukWXPcDujgrHoT4o=; b=CUTiTPnye491ns68YU08A6gj8U
 QfhNYPYHqx4AbOCFMS6zYl2juoAhXzkYNYu4mjZ3q2L6O2plbHJLGaZgQtj94b0ZQgZU9GOOQRTqI
 VUCTEgPVz7oDRAYE7gKjg+So7JSsznPcg+zxnu1JwcQNZwGZoORhU+A+oTSHaFNpPnSY=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1n2zAS-0001Ur-KG
 for kgdb-bugreport@lists.sourceforge.net; Thu, 30 Dec 2021 17:24:46 +0000
Received: by mail-wm1-f51.google.com with SMTP id c66so16007016wma.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 30 Dec 2021 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=6vTt0sPTxRfRnwBDC4e+K/XdNIJukWXPcDujgrHoT4o=;
 b=eJDrVz1NU+ONBzKG4ThrQEtMofLMh5ZhLIay3cQ7wx+ox56pzk0/XLMFosO8hlT45A
 etxIuzwRZRiId08xrIb0g/0w60BkBjfQH/9HkEHX+8pC2rAr6pIoOvLDqttuL//8ivpn
 D/XYvWNbru27I+iMpKpTlfNpls7zQKzLQ4eU5iNnhrZQFQ4t69jh9Hu8eL9o7VOw7yKK
 C7vU4p7Lt5pCd++qOp7XNGTp8wIrF9uQLkaJc2xc0Fdoy6yv0vCfDp4UulRMfNj02P+I
 iq6nI2HbBTeIofBGNt5MBVbkqZeNCsonfdDT3czbVImvKVYTCH5M5r1oYZsxAJADX+zP
 2Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6vTt0sPTxRfRnwBDC4e+K/XdNIJukWXPcDujgrHoT4o=;
 b=WXTJFPfB0/TppS1phE/Ul8iNrRFdi/CUZWEwSY8um9Tk4miV9G5a0dFevWESxIs0MJ
 dTRwbM9dfiu6nvBg3Ook3tM6th8rYaxdrqb/rgBSb9+n7qIgvm9KenI0jOgafsYI41R0
 qe2lr39Ghn1OF8W6watFYPafp0kK9kAzgrrOezfWDP4LaJ36Oj0XWf/m6zpPQ81GxmzN
 LRytaSAbqMKpuKSZ2genDQ4isuTk30Tu2J91k10Nq7iB0l40WMbL20YCv5U9nxdzCzXZ
 5VnR/VyM4C6liInXZsU6y8+AMS04YQaZJt+9p/UpRSqNcB9fOkgIgeT5SnXFJIg3h9Te
 RNdQ==
X-Gm-Message-State: AOAM533AgjnAIhtOwECsCl1wqbVaffXR1p5RzDJm3AmohBZx1U97z/XL
 YsCxgwVZaiFWKCFTKX2Dl1g=
X-Google-Smtp-Source: ABdhPJzaRsPj9c7kb9qvOWtmeBfPFyfJGIUOuJPs+l8QumnmnvBhQj/v/qhgVjBQz0iibeJndx2YDw==
X-Received: by 2002:a05:600c:348a:: with SMTP id
 a10mr26647064wmq.165.1640885078101; 
 Thu, 30 Dec 2021 09:24:38 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2657:9600:789b:54e9:fc28:95aa])
 by smtp.gmail.com with ESMTPSA id n1sm25951857wri.46.2021.12.30.09.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 09:24:37 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Date: Thu, 30 Dec 2021 18:24:23 +0100
Message-Id: <20211230172423.30430-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Most readers are probably going to figure out that the config
 is actually all upper-case letters, as all Kconfig symbols are this way.
 Properly capitalizing makes the script ./scripts/checkkconfigsymbols.py happy, 
 which otherwise would report this as a reference to a non-existing Kconfig
 symbol. Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [lukas.bulwahn[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n2zAS-0001Ur-KG
Subject: [Kgdb-bugreport] [PATCH] Documentation: kgdb: properly capitalize
 the MAGIC_SYSRQ config
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Most readers are probably going to figure out that the config is actually
all upper-case letters, as all Kconfig symbols are this way.

Properly capitalizing makes the script ./scripts/checkkconfigsymbols.py
happy, which otherwise would report this as a reference to a non-existing
Kconfig symbol.

So, use the right capitalization for the MAGIC_SYSRQ config in the kgdb
documentation.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 Documentation/dev-tools/kgdb.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index 43456244651a..3e3f7bca937d 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -402,7 +402,7 @@ This is a quick example of how to use kdb.
 2. Enter the kernel debugger manually or by waiting for an oops or
    fault. There are several ways you can enter the kernel debugger
    manually; all involve using the :kbd:`SysRq-G`, which means you must have
-   enabled ``CONFIG_MAGIC_SysRq=y`` in your kernel config.
+   enabled ``CONFIG_MAGIC_SYSRQ=y`` in your kernel config.
 
    -  When logged in as root or with a super user session you can run::
 
@@ -461,7 +461,7 @@ This is a quick example of how to use kdb with a keyboard.
 2. Enter the kernel debugger manually or by waiting for an oops or
    fault. There are several ways you can enter the kernel debugger
    manually; all involve using the :kbd:`SysRq-G`, which means you must have
-   enabled ``CONFIG_MAGIC_SysRq=y`` in your kernel config.
+   enabled ``CONFIG_MAGIC_SYSRQ=y`` in your kernel config.
 
    -  When logged in as root or with a super user session you can run::
 
-- 
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
