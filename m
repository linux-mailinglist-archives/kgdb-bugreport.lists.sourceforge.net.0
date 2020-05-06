Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF65C1C76C1
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  6 May 2020 18:43:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWN8P-0001AF-Oq
	for lists+kgdb-bugreport@lfdr.de; Wed, 06 May 2020 16:43:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jWN8P-00019r-5U
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 16:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oIeCC+0/EiI9sm7qFQDhCkikI6og9UeKJJkXjCNEh4=; b=nU9XPzhKUq/Ix7G5z05TtCvs3M
 3sTglHMFm+z9y0fXolVLPgGKY66R13YItBhgQM7DqE/tM7Z1fD03UzLr84ONTTPg1la/qbCgC3VMD
 3HT3zUzjfaRyAAuOrlg6+Bq9KPC2fUMNFKu1RJw7rV8RAGlng6/oqh5ZOa0vA1QGv4xM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0oIeCC+0/EiI9sm7qFQDhCkikI6og9UeKJJkXjCNEh4=; b=O
 uExkF7lZxh3Xr3YYH978CjMf+rFTxNWLwGxVs7PZB0irXHOLM1ebfZTzKiJe+bjt15O//4UiNxdTT
 Bs+0XYJFPwtp5xpq58nLDcgClMyE0qlKVosAcoYWXScCGPdQWYBOz89bFVZ7HMqERabfSHPdt2Mqn
 2IlDfiz0lt1ODEsc=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWN8I-00D7E6-52
 for kgdb-bugreport@lists.sourceforge.net; Wed, 06 May 2020 16:43:01 +0000
Received: by mail-wm1-f68.google.com with SMTP id 188so3304959wmc.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 06 May 2020 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0oIeCC+0/EiI9sm7qFQDhCkikI6og9UeKJJkXjCNEh4=;
 b=O/ilkMXARUeK2D3ICsAU4LxK79OJT0MBJTCLZkow0BNCeXP0XnQLIR/feAtb8UBZN+
 3wfBIP1Jk9Oy8l+t4VgxtRWpsgAGmez4XRquO5zOS9zprjlLf+Cq9NX1fsd9O1karj2l
 fvRRo8c8dIBVe7ZYolmUmk/lDRGT8AGC4qjoIr4HMn+PyiCzUyPkviui+9wHq+MXGg+3
 o4GoIUAmJ0bWO11IEL308Icc81nqK4l3czpdFYqYd5eeaCOuuVJsrmxlWNjcvXbekhM7
 qOQBxEgzEE7iawm0ZBkb0nsdrfTL0Hj/W+A0typua7DtMwCcaXeO3p1FOxPB+EIFOotF
 Y+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0oIeCC+0/EiI9sm7qFQDhCkikI6og9UeKJJkXjCNEh4=;
 b=A4iGIpejgOituAf9a2eRkbVNqbyyUsLhN4umKSQWZMJ6QpTxy7lVoogSm92SBmCqZt
 6cMKLmfKWx7Id0I/i7YlTghS4ZbJI4s8e8YwIF5613JwKRk7zAPVQWFlxAADkoID94dW
 fQ1zmDdXBnbYcLBePCmAArJ42QtI5h+I8HY2mYktAs7rRwFWgJJNY50cIjEiKvK2jRw5
 KhqmJ2bVfY2ZiKZ51p3DGvPrIyMYbMdztU8B1kuNR4IA91XGJjzObyheTIWS08P1ZKpY
 45m0n8JKS6YhZDdTP5/kxL3Qz+35BxzM35NtOUBjkVpeohm9cGDqVzH5uQ5IDWxt5XRr
 7aPA==
X-Gm-Message-State: AGi0PubFjXiV1m3yzOHNQ1D+NsdYFGwqVGl69MU6GV28vi/haSbTbT1w
 FZOWhIKquF5EQ7WXz31ekRt0WA==
X-Google-Smtp-Source: APiQypLmV4ose9t9DElkNYLgYcNAXiarZ1Br8nv0JcfOv4Av1Zc/Cvy3tfs67XWkiIIaMRomr4d+yw==
X-Received: by 2002:a05:600c:2f88:: with SMTP id
 t8mr5212647wmn.46.1588783367518; 
 Wed, 06 May 2020 09:42:47 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z132sm920713wmc.29.2020.05.06.09.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 09:42:46 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Wed,  6 May 2020 17:42:23 +0100
Message-Id: <20200506164223.2875760-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jWN8I-00D7E6-52
Subject: [Kgdb-bugreport] [PATCH] kgdb: Fix spurious true from
 in_dbg_master()
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
 Daniel Thompson <daniel.thompson@linaro.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently there is a small window where a badly timed migration could
cause in_dbg_master() to spuriously return true. Specifically if we
migrate to a new core after reading the processor id and the previous
core takes a breakpoint then we will evaluate true if we read
kgdb_active before we get the IPI to bring us to halt.

Fix this by checking irqs_disabled() first. Interrupts are always
disabled when we are executing the kgdb trap so this is an acceptable
prerequisite. This also allows us to replace raw_smp_processor_id()
with smp_processor_id() since the short circuit logic will prevent
warnings from PREEMPT_DEBUG.

Fixes: dcc7871128e9 ("kgdb: core changes to support kdb")
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 include/linux/kgdb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index b072aeb1fd78..4d6fe87fd38f 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -323,7 +323,7 @@ extern void gdbstub_exit(int status);
 extern int			kgdb_single_step;
 extern atomic_t			kgdb_active;
 #define in_dbg_master() \
-	(raw_smp_processor_id() == atomic_read(&kgdb_active))
+	(irqs_disabled() && (smp_processor_id() == atomic_read(&kgdb_active)))
 extern bool dbg_is_early;
 extern void __init dbg_late_init(void);
 extern void kgdb_panic(const char *msg);

base-commit: 6a8b55ed4056ea5559ebe4f6a4b247f627870d4c
--
2.25.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
