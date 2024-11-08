Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F54D9C188B
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 09:57:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9Knk-0007nJ-SK
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 08:57:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1t9Knj-0007nD-RL
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 08:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vUkgaqwyt5Dlc7iDZVCwHIHNWekO6hntBT7gAU7XDeo=; b=ZSDWCuJ+ADfhE4pXdGx/XPX+Ea
 bCNcAtgxYuIxvnGG24CFjJf4YSS+B3I3YvPVSf3NCAO1h7Z0wkbrEI4qoQkqIoUeN619ACVPfS1nK
 iSCi4YNbtpInp55HNCdrm0Pdbk3Eo0VkRkJ6ZMMjmen8RSxxH1iA5n2A6NXeV1TgKdwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vUkgaqwyt5Dlc7iDZVCwHIHNWekO6hntBT7gAU7XDeo=; b=DL47xzmfyLZn4JG1bbPBUqu+tR
 T2KMT/NNPl6AkABTzPad4lw540PIksvf4+tmEFqCjCnoNh/zOJ3H5DPWpa6JAlARA/txn9QEShaur
 QIfmINMtPV2yZhnrN9+QSSeST25XZjSjg2zT+7qfZ/1sOOqJk+nmEhu3aW9Qs+eVVz5M=;
Received: from mail-ej1-f42.google.com ([209.85.218.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9Knj-0001Lb-6T for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 08:57:07 +0000
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so549147166b.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 00:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731056216; x=1731661016; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vUkgaqwyt5Dlc7iDZVCwHIHNWekO6hntBT7gAU7XDeo=;
 b=A7olbpwbqxNfMIgOUue4sQ3bptazzO3CFPAGnCXgbhzttnAIfWNdLHgSXxkQNv1JVp
 lhumA9aNU2zIobuxGd6k+3nZ/vFOctTTQq6lzsYKrzztx0UdqXjR4Crw7isDhrknZb57
 hnVGXikjHxB0r+Agcg9Oi3esiOJNavgMCyvr0ttwXLqZxzzIh7OgIbq2SILOgkAQ+yVm
 +wlVePC7kt+gi6pjf2cGnrhUd1AiJC7sPqNn/eTpuFycU5xnjVEwhJsAfuYNa14XKOCx
 Ej9LPCwCmvDYV3YLyGpQJPC2/k4ohO4JOB/Lp1j5ocvPzc/BZB7kgJy+n5RHPZF9S+EY
 GvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731056216; x=1731661016;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUkgaqwyt5Dlc7iDZVCwHIHNWekO6hntBT7gAU7XDeo=;
 b=uvyTQGnIGgpJpbMrxfOgyL4qIR/imOcr/OgmGVQEfqB8t2eswx3ThbP0GTpkaUA6/y
 z1TMxhiqgyv3dZbmu2/3QGknhHbwiAPCsoUnFNIhxqrdnREu+y9L2oqclTVfq6U6Hlkm
 703dwSuG2qiZzqJf17/PEcZFgLhFqgMJsynQ1PKCf3HChHaoFNO/6lqk0YDdxGKi+p+i
 rw4v/0l9r0rOyMQXQ6aaQnxgqMlQCE9YvhdudKdGNK233N9g+2ZXPLZNSdupQD85WEts
 aM/vmJmIVlgLzEsvJW0dL7o8GLBoiWWld8oeVSeA29cBmcQsMCcQaxSshX8vVYfLlcXF
 Hg0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4bm47T3FOQ2yQ5IvWRHUxABHmUZht5TS5ePobKmjMZRz3LKcgf6seRANr1z1iux4EHR+lu424oDG3n6wwCw==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxwVQVVaeZG0OhDozsMA5C6TBp340pa5AiH8pgdHkAYTU2iAAj8
 sHWaDqd/cvM8URGoqV2wfGoXD0arEt+/KMP1KSsBbWWT6S8jauGf1Yp1iScZXW/ha9/XAyH5HJE
 gszS5+g==
X-Google-Smtp-Source: AGHT+IEsoJ3YYVkQUti7IVhr3Z0+dq+6Xl3WZ+t4JLD73b47E793gKcg9Qge20p3M1HTDRIVWOPK6A==
X-Received: by 2002:a05:600c:8716:b0:431:7c25:8600 with SMTP id
 5b1f17b1804b1-432b684f31cmr21029305e9.2.1731054695706; 
 Fri, 08 Nov 2024 00:31:35 -0800 (PST)
Received: from aspen.lan ([154.14.63.34]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ad0sm3876370f8f.100.2024.11.08.00.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 00:31:34 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 08 Nov 2024 08:30:44 +0000
MIME-Version: 1.0
Message-Id: <20241108-new-maintainer-address-2-v1-1-47c9d71aac11@linaro.org>
References: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
In-Reply-To: <20241108-new-maintainer-address-2-v1-0-47c9d71aac11@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=714;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=fd79AVP0NEtKFNsBkKcFdlWuoNK8n9iFc6De80oNWbo=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBnLcxJf2uFCuowNCWEnRWy2nCSehvg0Xwgx/nW9
 BdgbE2FM42JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZy3MSQAKCRB84yVdOfeI
 ockoD/0YN1BMEfZrSdBx9g+VGHKLAC/CE6SHaG24UkJMt7C95zghZSCaEiC1Ry6vxYBl0s3bL/e
 K7pkCn+qCOnR2EaETk5R88qB6cTezKUVUSJn0dbAQcJfAE7sOYE3pocEJPPplr/4g7tDlbNxZRb
 yPxs4ZYM3cZu2IBHNfmpUNZnr8Iav7nH6t6XPreAVYZYUCWdEHbN3RC6elzP6IA6K7Z70WaKftq
 L2ieguRMwpVuBJsqPSXaBinsxiyfuxQrusV3teOy6iNrGAcAJjA0T2SY3XgLNCGm+5fpTTT6clm
 4AJOF55j5WGRxR9xtJpc+23RE/VEV4AAlEEryLcfmGksA/MlqK+M5kIAhPdhTr5KzQxT7z5Uj/q
 QqnPNwVgIpjkHrAyj/YzHWP4rvgPEQkwbewq3YRAUlzkjOiqfJfeqwTgQv3GXXrz1yQfl9M0/d7
 ri1h2/oGGwm3cihv93r2Sl2fCBdOgQVpC7SxIqdb8rQIZtJbfCVBB408vtRunWpz5jJzuY8OwEZ
 oGGGsfuUE+q2jW+Pc7lCtYNXRQHxN/pk9T+2R4ZkwMM9BHwYUMtqFvp+8E7PznL/gN9obZsRnIu
 x4diqAib4mo+gumVXtHGTiViKJyTCdWqnbAH0xBEIsnPumjXj8S6IBU7QlCN5FUmLSveuNiIq+7
 6n/tsDwvxxfRgrA==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Going forward,
 I'll be using my kernel.org address for upstream
 work. Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org> ---
 MAINTAINERS
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) diff --git a/MAINTAINERS
 b/MAINTAINERS index
 a274079502426887da55d55b83b9a17e74ec6b13..5396fd1b15aee1eb2a234ba8963c57571d532a91
 100644 --- a/MAINTAINERS +++ b/MAINTAINERS @@ -3790,7 +3790,7 @@ F: driv
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.42 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t9Knj-0001Lb-6T
Subject: [Kgdb-bugreport] [PATCH 1/2] MAINTAINERS: Use Daniel Thompson's
 korg address for backlight work
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net,
 Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Going forward, I'll be using my kernel.org address for upstream work.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a274079502426887da55d55b83b9a17e74ec6b13..5396fd1b15aee1eb2a234ba8963c57571d532a91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3790,7 +3790,7 @@ F:	drivers/net/wireless/broadcom/b43legacy/
 
 BACKLIGHT CLASS/SUBSYSTEM
 M:	Lee Jones <lee@kernel.org>
-M:	Daniel Thompson <daniel.thompson@linaro.org>
+M:	Daniel Thompson <danielt@kernel.org>
 M:	Jingoo Han <jingoohan1@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained

-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
