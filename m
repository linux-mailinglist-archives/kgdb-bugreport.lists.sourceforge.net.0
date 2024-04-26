Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA38B3DEC
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Apr 2024 19:24:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1s0PJV-0001Gm-8V
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 26 Apr 2024 17:24:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1s0PJT-0001Ga-M5
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 Apr 2024 17:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u3GKYPgMw6Lvr3eDC6BYSdtSYACljMb8A9MuoJMLK5g=; b=adDfOav1D4Cs/j0Dd8zZqGuqpq
 ISodmyKA5TvlozdPUEnBHNWpXI89QogPQv46/z+bM+Ur5ZMsfK/2vSwUUYmXZrBTUhhopg4Jb99S9
 L4cetwIgkoroUn5DPwMcw8vM19t60kD9W+zs2QnMVnL8H/6bPmCzqd8n3R1FznLdNIjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u3GKYPgMw6Lvr3eDC6BYSdtSYACljMb8A9MuoJMLK5g=; b=DMVcMQdxPuc+mqXs/6BnqQ54gD
 yao4b966LYO5JNEz9PPlpjQ6cDWH/zKLkJD+rfonuGQqeP8MOeWTPkzv79HZEHtpZL1m2M7M7oMD+
 tmzUPslvjGLxF3tEBpZ9UWBfhkZZhfF6zaItvKiwdgc/Vu1udnU0TdW2uhR1irW6GfYU=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0PJR-0002ka-Vr for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 Apr 2024 17:24:43 +0000
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so30822091fa.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Apr 2024 10:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714152276; x=1714757076; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3GKYPgMw6Lvr3eDC6BYSdtSYACljMb8A9MuoJMLK5g=;
 b=L9XsMeZ8RqX2HfOPvBwV6xQeup4yf6MIQgQUW0h5+sNKk7NQE4kNAqGR85oWekhCP7
 IBQYPeVFYrQIpGixgcP1xdhDc1+e8eoBYV4rDQuW2FrYzxJ96M/4MVxpz3cZTAoULy0W
 +WqevNTP5PhEnvpzglew4aPEdMtZdUomZpUxpTg/44IMeaD6EVQZn/RBDkhQb+KlpU+K
 LpptMp3mQzyboxnaWOEiT1QH4W0B7VrFt+AcOeBUeHaEvkKSGFvamp7ZLE764bd6CsoH
 rai9xBR/3QxuIfmfGEzmsjlr+NRL940fBBMaFHHMN4PK8lK+X44F8TnJhVJXOlm+Foxg
 J93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152276; x=1714757076;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3GKYPgMw6Lvr3eDC6BYSdtSYACljMb8A9MuoJMLK5g=;
 b=QJmSBcI6lnUfuy642xuGCM2f8OQKdXxJeSmt1paK+CP30MfBCnUL4goRyl89szvJM2
 tjT0+aXT5YWR4u39GKOn9boE9ct0b48YdZi0Z5NatcYB2++0oosydTTfXguwcvkQ9VG9
 JChqNqZ7ugh0QeWXrs6kfLwKf/vMRHrQWCS4LzYNKGCCQegz3XSwNcRVqnHRZ7tc4mNh
 gZqKvhVFnds6bAmIMGKhznIkQRzhZsketaiHfwlgtDmuw+c9vnwJ7z6FsKW+9vzNcSi/
 4z2TvHbaYzrcDj7wupewR9iZruZe/cii8jvNdrgp6nW/2vk4E9rsZ/VjlRF/3wqCnoie
 LPUw==
X-Gm-Message-State: AOJu0YzmGS/+ZR7t0zTEAjZCk9R4CXR9XVOjJRsglcL0MlAux7aQtLnW
 4zr6ndTu2NA+tvCTk4W8OBpt0jsQQ20iAEQS14iGevhgrJmoiYqIAHxfZ9LyHw8=
X-Google-Smtp-Source: AGHT+IGnmjsT9stCfMQVjm140H2VH/lZoA+XnC59AYuSbNO1QesGaoD/Op7V0EaA98IKFqmgM1P/0w==
X-Received: by 2002:a05:651c:1716:b0:2d8:8232:8c6d with SMTP id
 be22-20020a05651c171600b002d882328c6dmr282437ljb.52.1714152275687; 
 Fri, 26 Apr 2024 10:24:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z2-20020adff742000000b00343ca138924sm22893737wrp.39.2024.04.26.10.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:24:35 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
Message-Id: <171415227516.138568.15976914533950726973.b4-ty@linaro.org>
Date: Fri, 26 Apr 2024 18:24:35 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 24 Apr 2024 15:03:33 +0100, Daniel Thompson wrote:
 > Inspired by a patch from [Justin][1] I took a closer look at kdb_read().
 > > Despite Justin's patch being a (correct) one-line manipulation [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.174 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.174 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1s0PJR-0002ka-Vr
Subject: Re: [Kgdb-bugreport] [PATCH v3 0/7] kdb: Refactor and fix bugs in
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


On Wed, 24 Apr 2024 15:03:33 +0100, Daniel Thompson wrote:
> Inspired by a patch from [Justin][1] I took a closer look at kdb_read().
> 
> Despite Justin's patch being a (correct) one-line manipulation it was a
> tough patch to review because the surrounding code was hard to read and
> it looked like there were unfixed problems.
> 
> This series isn't enough to make kdb_read() beautiful but it does make
> it shorter, easier to reason about and fixes two buffer overflows and a
> screen redraw problem!
> 
> [...]

Applied, thanks!

[1/7] kdb: Fix buffer overflow during tab-complete
      commit: e9730744bf3af04cda23799029342aa3cddbc454
[2/7] kdb: Use format-strings rather than '\0' injection in kdb_read()
      commit: 09b35989421dfd5573f0b4683c7700a7483c71f9
[3/7] kdb: Fix console handling when editing and tab-completing commands
      commit: db2f9c7dc29114f531df4a425d0867d01e1f1e28
[4/7] kdb: Merge identical case statements in kdb_read()
      commit: 6244917f377bf64719551b58592a02a0336a7439
[5/7] kdb: Use format-specifiers rather than memset() for padding in kdb_read()
      commit: c9b51ddb66b1d96e4d364c088da0f1dfb004c574
[6/7] kdb: Replace double memcpy() with memmove() in kdb_read()
      commit: 80bd73c154e3063c4f9293163daf3262335f9f86
[7/7] kdb: Simplify management of tmpbuffer in kdb_read()
      commit: 64d504cfcd514743aaed3a5b79c060f0143149e9

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
