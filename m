Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A5303927
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 26 Jan 2021 10:39:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l4Kop-0008NR-Ug
	for lists+kgdb-bugreport@lfdr.de; Tue, 26 Jan 2021 09:39:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lukas.bulwahn@gmail.com>) id 1l43B8-0000vX-Bk
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 14:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QKVPfv6NioAKXL2jIZ8ignJiUMCaI8h+exsQiu5IPPA=; b=Lby41HeUWo2vZR7YnJ7OZBR7YE
 iGjL6SfwyMgQFUbQynTkURvN3hRmhSJeuS8+w7oQoVoVvS0V6zWEuXGBGklxlNTbYEJHUKfjyYRci
 XzJp4I78eeNNxSFCOb27u4dJQNOLL1X2sA+EYV7sbO2T7IjLZ9LtBM5qMW7/gbC3KKRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QKVPfv6NioAKXL2jIZ8ignJiUMCaI8h+exsQiu5IPPA=; b=iu/wulvBtL2xdRtXRL75kS1IPU
 D5C4LPpNBehU+0uYI3W/7wIKbIuTiM5LiCstKCnbRs2njxG3cUgPmBBHzC5j3mhXhEVKO+UHaR2Le
 8755ePoD8nwAOA1ZI9L1GLxE3b+6xjlqqfMHC9AnV2AcnmlybimKS/CrG4jikjvx1ano=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l43Az-002rc1-L6
 for kgdb-bugreport@lists.sourceforge.net; Mon, 25 Jan 2021 14:49:18 +0000
Received: by mail-wm1-f51.google.com with SMTP id u14so4507583wml.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 25 Jan 2021 06:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=QKVPfv6NioAKXL2jIZ8ignJiUMCaI8h+exsQiu5IPPA=;
 b=E0JEArhPC9PVqQSnyWc+a/zbPCrY7aFgkE83tMzyQlsm43jR/vImtUY2iYWfm8Y2J6
 ncpXDMCTpG8UKHD0ttjoVG5ZH9IEDSpCqj1a1ZNsVGFx9aFepGwIRhpJVkoWKHP6NbOu
 uBNZfso9/uu8TGJdn9BmccBh5qnJfbkCM6OPwbqRTJp7G62dN/axrDg/WXcnbXVXpXCi
 jpEmF0bSSbb5B6BlE9x1k1Um3V1eKHc5oKvGV4FDBHJ5/dBPe3XKvUxU092Kgg3BTsnb
 Eh779Yo+ymlSdAzgk/h0gmrfLk+PEYmNQAbCJ9MQdS2ZCmwgOJiGKSBmm5O3J0XYypI0
 j86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=QKVPfv6NioAKXL2jIZ8ignJiUMCaI8h+exsQiu5IPPA=;
 b=IrhXDzFryaVS/ugZdU2pk/KUqS5UrbqpW2+mmlgrgHM5oBCnQ6gi9H2Kq6bW3+cbtQ
 UlG4exE8cJIv/XHAdTqd0UCKqSi0ux2ACJjE3+csBVXOZgKRy7mGkGnzfRXZ4dq4x04w
 P2AfDKz3Rt4n9kBYVPXKHyhOtyJRaG+EmNXtsEnCuheQNIWU1Lt/jbaWIbyIncs2OC7T
 GlbFaBHWL3+84s0YzQXQ15Vl8B6nlORccYKbBoISkL9dXj0KecqFNoaihpSNASLMpAw+
 xKHa/4jxiANkl+8PWgXBW/TA+nUnT8lyU2vqdGfiK5Jvvdw/zfqs1EGKkY6fusZQfsUJ
 92UQ==
X-Gm-Message-State: AOAM530HGG8ipaZUPi1xMaArkRO8ZcT7hahW8t6ZzID0EBATBr64lgL0
 DX3ZtzPxg9YYpahNf3U+OoQ=
X-Google-Smtp-Source: ABdhPJwUHv9gCSik0AJygB1hBoPoE+LvC1chT3BIWydPVTXlqmNYUqnk0AhMSJ3iwcEYds+RtH3bhA==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr473416wmg.172.1611586136014; 
 Mon, 25 Jan 2021 06:48:56 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d4b:4500:649e:f82b:bf2d:2571])
 by smtp.gmail.com with ESMTPSA id b132sm21454499wmh.21.2021.01.25.06.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:48:55 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Mon, 25 Jan 2021 15:48:47 +0100
Message-Id: <20210125144847.21896-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (lukas.bulwahn[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.51 listed in wl.mailspike.net]
X-Headers-End: 1l43Az-002rc1-L6
X-Mailman-Approved-At: Tue, 26 Jan 2021 09:39:25 +0000
Subject: [Kgdb-bugreport] [PATCH] kgdb: rectify kernel-doc for
 kgdb_unregister_io_module()
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The command 'find ./kernel/debug/ | xargs ./scripts/kernel-doc -none'
reported a typo in the kernel-doc of kgdb_unregister_io_module().

Rectify the kernel-doc, such that no issues remain for ./kernel/debug/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.11-rc5 and next-20210122

Jason, Daniel, please pick this minor typo fixup.

 kernel/debug/debug_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index af6e8b4fb359..7f22c1c0ffe8 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -1166,7 +1166,7 @@ int kgdb_register_io_module(struct kgdb_io *new_dbg_io_ops)
 EXPORT_SYMBOL_GPL(kgdb_register_io_module);
 
 /**
- *	kkgdb_unregister_io_module - unregister KGDB IO module
+ *	kgdb_unregister_io_module - unregister KGDB IO module
  *	@old_dbg_io_ops: the io ops vector
  *
  *	Unregister it with the KGDB core.
-- 
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
