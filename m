Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843549FC81
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 28 Jan 2022 16:10:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nDStj-0003w6-9K
	for lists+kgdb-bugreport@lfdr.de; Fri, 28 Jan 2022 15:10:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1nDSti-0003w0-3f
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jan 2022 15:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zxRA/z+rIvvKpPSi5vpIRUkcRSZ3WwPALJ5ojRw+TVY=; b=K+XcgjgG27wFTr0gtFgUCDh1cK
 L3kvCUDrD38iiw+QS2FTw1X9pcAyORnfKOO5mgyIQGbrABFAji2A6RsuxapUTaf3EZCUO8JxwLPiG
 cNuVR04QVoP4VsCGv7CFxaR0SQAQg2/8OKCXbuRTHngslXDIUzY9a+6W5CX6YVbCRFtI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zxRA/z+rIvvKpPSi5vpIRUkcRSZ3WwPALJ5ojRw+TVY=; b=Y
 qKe+Rqlf+Yi2lP5hA1k6pusXBTBqX6TFq8L5fjFKURNWrBTmx2jgBZn9KLkJt7VWpzTfSUtkyIKbK
 UbczPQwmUeFnf7xlXM8X9tVj+SdFaJVgvZaiS6Kfy9w8Ip6Kh3rU33cm8/8D69i2ntQgk0fq5r/rI
 gtKJR7hSfMnLcKlc=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nDStd-000sLp-FU
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jan 2022 15:10:44 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so4834394wmb.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 28 Jan 2022 07:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxRA/z+rIvvKpPSi5vpIRUkcRSZ3WwPALJ5ojRw+TVY=;
 b=ogmYuHfaxqr6MuzBEAMi0rmjhc+yaBO7xXzb+RVf0cwWkP+ECWpCrfFjtL7dSdjLWV
 6QY8TS5p05WOZp/EEBTELv+3UraSzdJkORT0eXsSAHu4i/9Vyx4u8UjW1JyTnOM9VPKH
 1QjCl6AG3vL4s0RSqY6/GEH5/AgD9EnSaNVyyN//AQMLkvM1zaJv68OY+oNJ2xHQsnXV
 ZZIG86nT+YFLPP9FVDvfYjiSxSWkUnCHKL3l9VYj6yobltnA6lfv8MoorkfaFzkoVCwC
 tmyrl6HHa2fXa56IqZj4lxFrsWow4cJDfJx6cL65g4zzMFD8pr7R091aa+wUPiJZJz2V
 s/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zxRA/z+rIvvKpPSi5vpIRUkcRSZ3WwPALJ5ojRw+TVY=;
 b=lKO3xEie1NNq2uvCuji0sTgyr6o1/1f8rJZqO1oha0kc/yNy9cYje+SDuxYiLJiqGr
 3y/bgNipZGBfYS7xDtFTDPMXT5V/vLdjfwREHmdjbQI0ogAPV82U5677ue4ijSHRZAhS
 p2Jn4bOlBR+rlQaY/RrFiEny27nIZwF406lw+3IODI5f1IghQc4AT3s12HNwZGm07+wp
 InxY8byO1AvEeudUrC5N05VOhcYMk6SxGBZVegSpI4CqpkL9URF8Oewmk7Kyx0qb4d4C
 FyXOuL+d93chiCgAPipCNg01OzD/0BisKpt70CErVS0qxUs/ppm1v5uapFG8scqfB71J
 8XTg==
X-Gm-Message-State: AOAM531EKGHggeLd6wfNP7Sq0p6HVvEVAJ9rW4lO+r5yUh/i83wnLvkj
 ZVXgWbB130UFXcSIq5vQbIRNkxOvJBSOHQ6s
X-Google-Smtp-Source: ABdhPJwJifrlbLKVorSrG7JKpeTMTKUOqCLid0O4FsYzEbpJ4fA22S//Eks9XJ2hd9adjsSsaP1ppA==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr7732674wme.32.1643380864973; 
 Fri, 28 Jan 2022 06:41:04 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id j4sm5511130wrq.81.2022.01.28.06.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:41:04 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri, 28 Jan 2022 14:40:55 +0000
Message-Id: <20220128144055.207267-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Currently kdb_putarea_size() uses copy_from_kernel_nofault()
 to write *to* arbitrary kernel memory. This is obviously wrong and means
 the memory modify ('mm') command is a serious risk to debugger sta [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.42 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nDStd-000sLp-FU
Subject: [Kgdb-bugreport] [PATCH] kdb: Fix the putarea helper function
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
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kdb_putarea_size() uses copy_from_kernel_nofault() to write *to*
arbitrary kernel memory. This is obviously wrong and means the memory
modify ('mm') command is a serious risk to debugger stability: if we poke
to a bad address we'll double-fault and lose our debug session.

Fix this the (very) obvious way.

Note that there are two Fixes: tags because the API was renamed and this
patch will only trivially backport as far as the rename (and this is
probably enough). Nevertheless Christoph's rename did not introduce this
problem so I wanted to record that!

Fixes: fe557319aa06 ("maccess: rename probe_kernel_{read,write} to copy_{from,to}_kernel_nofault")
Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_support.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_support.c b/kernel/debug/kdb/kdb_support.c
index df2bface866ef..85cb51c4a17e6 100644
--- a/kernel/debug/kdb/kdb_support.c
+++ b/kernel/debug/kdb/kdb_support.c
@@ -291,7 +291,7 @@ int kdb_getarea_size(void *res, unsigned long addr, size_t size)
  */
 int kdb_putarea_size(unsigned long addr, void *res, size_t size)
 {
-	int ret = copy_from_kernel_nofault((char *)addr, (char *)res, size);
+	int ret = copy_to_kernel_nofault((char *)addr, (char *)res, size);
 	if (ret) {
 		if (!KDB_STATE(SUPPRESS)) {
 			kdb_func_printf("Bad address 0x%lx\n", addr);

base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
--
2.34.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
