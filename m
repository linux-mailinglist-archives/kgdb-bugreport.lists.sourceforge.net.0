Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 519348B3DEB
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Apr 2024 19:24:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1s0PJT-0004eI-Dw
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 26 Apr 2024 17:24:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1s0PJR-0004e5-MG
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 Apr 2024 17:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VQGS+2ImTjWNnHCheazuATbvqdIfWl3c0w7fDTpZPcw=; b=fYviyoRH+Nsq6I3fnW4UxPV4/V
 lt3lWdaFEqWVu24vh5vgtOC/oY398kemwvZueXKT1XaCVhN/JwP/fSBFGwhaW1sQ4RJDS/In6tmOm
 A/ctVHZdL3JWuTM/B6dGk/cZL9XJktUdTQ/eNC34kE2q6ePYA2cceS42S233/2WiHgqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VQGS+2ImTjWNnHCheazuATbvqdIfWl3c0w7fDTpZPcw=; b=boF6OeDQgMkglj77rBZNqIChYR
 km5Ds7ABxEsyrrpEWxXCnYTNA3SWyvBt1/ImKRiY41uXI9gDIX2PqT/mtSK1vtqn8EOrkJXGOioTk
 Dr9VRJXyr8Ms9MhZjP0sp498WZytflqrYCZ2PSkLkzHrPmtBZP3TCfxLXDvsljrpuaIk=;
Received: from mail-wr1-f53.google.com ([209.85.221.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0PJR-0002kZ-7q for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 Apr 2024 17:24:42 +0000
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-349545c3eb8so1523359f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Apr 2024 10:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714152275; x=1714757075; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQGS+2ImTjWNnHCheazuATbvqdIfWl3c0w7fDTpZPcw=;
 b=zt/uiKBlyUw1/BiPkoDgYrF2ngxaxC7ozxfNkgp1c5ZPtgUFO5QZr0yzX6DL615vHY
 6zF8EASSRKBGgOcbaOrez/sFlNt4UGmymb/L/mim8KV580Q9uEyI7ncqNY0W5/GE2+b/
 ecixzi7FZnO5wf+vwiKfwV4zp/NIT3s3AusiS83j41bvoAHxyivZm+5KGaIsFCIgTsvc
 EkT31Amq2w1HOlVkSv4SwoRqKknmeaUY8Tk6ze60c9JaqQRVw4DzxhmEhmBg7vhApyO4
 MBaSUtUtIGxt0r2nWRKm1SqzIrh+MirxVJkY0mcLUJf+Xkfqfc++uWqydUqL1Lt9uNix
 GLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152275; x=1714757075;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQGS+2ImTjWNnHCheazuATbvqdIfWl3c0w7fDTpZPcw=;
 b=jW3ekCBLWZjL1M7HMDmSsIOPqS5iPf3Qh4AimJX3zFJuXblhplvNj0JqSJEYuPeppT
 Z3e+oMSCoPd36csx2DxkrO04w4TwtPYOfj1mrV8Py4+FSD6Kn53aKEB03xhTor7hRxlH
 5JlpEqZ4Bah3mJBdHw0h6lB7zD7TY3nXJ8nHTuzaSdpXsnSbSsT9R1XkcEvpzqrCOMav
 u3ig9ngPYFeiQSmzECBe5iS+wPdl2WH/vFX4jcO723XtYRlYMZUSr7r/WSMi46+DJOTH
 vFaJYS0yR3hJTguBpvyD9JU98WVW5b89Zx/rZtjEqySJ1JlaF97iZffAPDwZLJ46LYRL
 1Czw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbyyrtHYI4bV4Ta67+a0+1mknTUemOTkrvq34BFC9BwCwiGKiSU5Pc77JUxWLxU6wRrTPFEkVLLnrWfLrVJ4k6FxfLLXIC/Wo7QbTyIieg6pIHRvQ=
X-Gm-Message-State: AOJu0YxQPcuB0BLrkodCt9J2GORQnN7mAC3Ed524HMMIiBLTTVvEZKf3
 3XIMvnCOHlrHyPZ5JDwitd1MApoQAcwY2YSnGcnZ8Ux+33+O//4YZBSwnyE65a4=
X-Google-Smtp-Source: AGHT+IGEmzyhWJuTwU4JvwYETn4/dggvlzPnepnpq9zXXd+fIASo1x9F2is8E8VscY0zJsyUCyK1sg==
X-Received: by 2002:adf:e4c9:0:b0:34a:ce8b:7b66 with SMTP id
 v9-20020adfe4c9000000b0034ace8b7b66mr2500715wrm.4.1714152275069; 
 Fri, 26 Apr 2024 10:24:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z2-20020adff742000000b00343ca138924sm22893737wrp.39.2024.04.26.10.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:24:34 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <20240328140015.388654-3-thorsten.blum@toblux.com>
References: <20240328140015.388654-3-thorsten.blum@toblux.com>
Message-Id: <171415227396.138568.14982776315029700963.b4-ty@linaro.org>
Date: Fri, 26 Apr 2024 18:24:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 28 Mar 2024 15:00:17 +0100, Thorsten Blum wrote: >
 Fixes the following Coccinelle/coccicheck warning reported by >
 string_choices.cocci:
 > > opportunity for str_plural(days) > > Applied, thanks! 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.221.53 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.53 listed in wl.mailspike.net]
X-Headers-End: 1s0PJR-0002kZ-7q
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Use str_plural() to fix
 Coccinelle warning
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
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


On Thu, 28 Mar 2024 15:00:17 +0100, Thorsten Blum wrote:
> Fixes the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
> 
> 	opportunity for str_plural(days)
> 
> 

Applied, thanks!

[1/1] kdb: Use str_plural() to fix Coccinelle warning
      commit: 5b6d8ef6f056d8130168746c5459d7a3fb494859

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
