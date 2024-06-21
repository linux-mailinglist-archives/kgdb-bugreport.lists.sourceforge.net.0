Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE82912A9A
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 17:48:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKgV5-0002oE-Nm
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 15:48:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sKgV4-0002o5-Da
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X7F4blc1FhU8dDIuyj3gflH2Q2a5MTAEysTa84PWYMM=; b=h4qBXkXC3tPjGUwtZBb0AidGRT
 mSndF9Bk6jGm7IYPLdkf9s/WU7h2y4iPWFcdzzb0sWZIVuVbRZhrEH60gC6s9QfpYAyVvmT6c5xGa
 DvzJcFYUSAIW+/x1PWltlbXohekXBi+hSQ6xpAP6UVbyts5Bum8CTr0c68ZMY2KB8bH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X7F4blc1FhU8dDIuyj3gflH2Q2a5MTAEysTa84PWYMM=; b=XorkXvsE0hPHwJqZAAaJZeZQED
 hUZvyTyodzCJA64kratgrt83cSYfU936YU09Tb0BBbYlS26E5EKeYErWmVfMp+GsPuZuTq+g0tij+
 PsoQRnFbpHYY4X8XcaQr1H4u1IAYxx+9bDKMf7Du3N9HX9CDhiIWnWl79tRfKvbfdCfw=;
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKgV4-0004J9-W5 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 15:48:30 +0000
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-362f62ae4c5so1280722f8f.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718984899; x=1719589699; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X7F4blc1FhU8dDIuyj3gflH2Q2a5MTAEysTa84PWYMM=;
 b=idNtZ/z6hJQpgCZloTSLO+UH5WnUn6ZBG45ViR4lPq5NSz4TdqTZOONLS1/ZiTosM5
 Dp43b4k/XREK94wOx7S6wdt/DStVHQczE4L2iqS+A9eUse3wStPG7nE6tKGLbz0mKr3o
 0nlhs/lDEu7+73P6ENUHJjSvfWWmL15J5yp6XslNWncqkJaSe85+sf8+0a9NTqY8Awqd
 d5KDJYUtzWDaSkE/FydMUjyfZSUuTQ56D1l7yqqaikjSSqnRXMl5jwlsRLE63sJdYw+v
 kD5Oav5eEhyhCLZlDyXggjb194GIBW7AfWWFp5pROAcGTujgtnp3QDL0GCo5hv2yT7Mz
 KEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718984899; x=1719589699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7F4blc1FhU8dDIuyj3gflH2Q2a5MTAEysTa84PWYMM=;
 b=MfOLX6I/ufEgPMeDKwyNjEwOUuDbICx0l6heBrtLUMXEMpJIcF6Q5dVfTtxsWAZHeW
 Nfctiv7Q2076ujx7uNoYCOaBgTiUrKEORU3uv42FPkC77vceJbrGT5rJ960Y8LjY9e1W
 9Fz5PnGGfXmg3+tTOG+fDRPl6yfdIdvslf9dDBFk0YfY71UPiJMqXJEtrdGGVz+kLiY0
 TIKNXU2xH0wMXkU88EAFG4X5zqAjGQBwELy1HB6qsbwQS1Ztdi3/eCV0U8Wl2yeQlcjF
 JCBjD9VkaOrdYRiDGVE77xUXNZXGHNiTM3bUyWeBp2DAZx326Q6ALWXXahL9VLC2jpDM
 BjMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH/n8/Om0xPcVUfDHfEOOMubkXnEowk86FNvaqzJMfDkQO2mEc5tXDP2Q7cafdGfB3LlteV5EXpsjgmGPF2Ys4rWcJANXVQ81+NLNGlXYSX3+NBMc=
X-Gm-Message-State: AOJu0Yy7vss1zDPZFGlZjcpLl6VSfFSsEaKSNzm7KHXuHXSfTSEZMGgi
 xpy+RasnwyGwzt+88rdAUmdP1TkVT1lYzHrEiCqCOv1ht78rGTimmXc74MJxg+s=
X-Google-Smtp-Source: AGHT+IGB8sAjigGmQp+XmeJz9+tnNgM+gOHHEgHPbkVOWfg/3iCmkMwZZc40y0wkMmuZC9rNkIxLvg==
X-Received: by 2002:a05:6000:114a:b0:366:8d90:84c3 with SMTP id
 ffacd0b85a97d-366de857ba8mr165926f8f.14.1718984898793; 
 Fri, 21 Jun 2024 08:48:18 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0be9fasm71314525e9.16.2024.06.21.08.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:48:18 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: jason.wessel@windriver.com, dianders@chromium.org,
 Zheng Zengkai <zhengzengkai@huawei.com>
Date: Fri, 21 Jun 2024 16:47:52 +0100
Message-ID: <171898481991.314245.674243020349240942.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620142132.157518-1-zhengzengkai@huawei.com>
References: <20240620142132.157518-1-zhengzengkai@huawei.com>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 20 Jun 2024 22:21:32 +0800, Zheng Zengkai wrote: >
 Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture") > removed
 the only definition of macro _TIF_MCA_INIT, so kdb_curr_task() > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.51 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.221.51 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.221.51 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.51 listed in wl.mailspike.net]
X-Headers-End: 1sKgV4-0004J9-W5
Subject: Re: [Kgdb-bugreport] [PATCH RESEND] kdb: Get rid of redundant
 kdb_curr_task()
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
Cc: pmladek@suse.com, Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 thorsten.blum@toblux.com, christophe.jaillet@wanadoo.fr,
 yuran.pereira@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


On Thu, 20 Jun 2024 22:21:32 +0800, Zheng Zengkai wrote:
> Commit cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
> removed the only definition of macro _TIF_MCA_INIT, so kdb_curr_task()
> is actually the same as curr_task() now and becomes redundant.
> 
> Let's remove the definition of kdb_curr_task() and replace remaining
> calls with curr_task().
> 
> [...]

Applied, thanks!

[1/1] kdb: Get rid of redundant kdb_curr_task()
      commit: 9bccbe7b20876a34c70b13430ea1b308fc8d5a7e

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
