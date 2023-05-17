Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E8D707160
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 17 May 2023 20:57:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pzMKd-0002jZ-MN
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 17 May 2023 18:57:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <keescook@chromium.org>) id 1pzMKc-0002jT-Ol
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 18:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3Foj4fb82zG/bYBqANgJwBXrXANMC6U7inLZ4E4KgMU=; b=YmlIkBjhycgGDU7DV4NgJjNh8n
 iMSltSesVpM7ZpnH+sG+ZLdwZJuEVs4IQswiQZ/wV+TOZyvBOM8R7U5ZNCuNNb6siGH0kbqH0Noei
 ow1xDnIpbjgrsLL7MIvLeYkpjUP0iEuTJGNupOgRwVvpnevo2YZimcU5qkfj2v+RzXmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3Foj4fb82zG/bYBqANgJwBXrXANMC6U7inLZ4E4KgMU=; b=ejoRSjDYByAONfjv5AnmkqLE/J
 mCEdG4yf6PukpMhAmlZL417zCHDsZHce6UoC1Mg1VldT/dnSuNw6O7HPd1/jk7hvce+DZqcxdmowD
 baY9A4B7jfclDKFPO+hrm4/oizq0eGP/Pfp/WIhW8JfoIR/3L69fteiIaldV5FSi3sbw=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pzMKZ-0005XY-Qd for kgdb-bugreport@lists.sourceforge.net;
 Wed, 17 May 2023 18:57:03 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ae52ce3250so10008175ad.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 17 May 2023 11:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684349814; x=1686941814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Foj4fb82zG/bYBqANgJwBXrXANMC6U7inLZ4E4KgMU=;
 b=iOCD/WrUpOU4uwvpO5V+3F7ZkEOjT/WN64f9NAzD2urz3GLD/JuJAxgTLQG97peGK7
 yrPCCtFIbru/XgaK6AtKEUimK5Nj6D8P9YzuE86qo3BHb4OV+EnApoBRT5vIHGe5s10x
 jQMChyAVwtfMncW91E4P9FRdE5wgUCR5A8oQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684349814; x=1686941814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Foj4fb82zG/bYBqANgJwBXrXANMC6U7inLZ4E4KgMU=;
 b=IWvUYVV5LiODmMjWghZP3MMgfeDPL9IRi5lM2qM9kqqSC3//6DRh2XA9rO5dxYPQ+9
 Zxffx2BfQ0LeBMekI2e/GO8QIXxWGKVFlEuu9H4NeL8cMX7UDaAbiN7l3nuq6AErHv65
 o/JSTLEa+PJRk0tBGW4XlrplIy7hgI5neV7BZRAdUhzadUetvXy4gX9ctcYbhRtVpGxy
 OxqkVpCoXAOn7OYiCQET6SeGOsxUOoZcaVTD+xZ5csVbF6D/YmOEw5aPjI/IAu9HF6Aq
 4LZnLae6QmkMirSvikOc3MmFGAIgKl1ZNvcdZuZMhdhcta49u0S8EmnNQ1b90IrrenvE
 NxPA==
X-Gm-Message-State: AC+VfDzhB29dFYgLSI4WDXcOZHd6tsIvQNALJbibtewhiPYw/YQ5ytfA
 xskt/r0ZTLFCU4Nk+vSLbZsRE1jpVNrfB3GFRAM=
X-Google-Smtp-Source: ACHHUZ5hnnyGUiD6IbLeQh5HdBRkD0JKc0SMUktLHpS79jIBd1u/IX3HLGticHMt5x2tcZ6gCjzMKA==
X-Received: by 2002:a17:902:ab89:b0:1ad:1c22:1b53 with SMTP id
 f9-20020a170902ab8900b001ad1c221b53mr24650997plr.40.1684349814193; 
 Wed, 17 May 2023 11:56:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 u17-20020a170903125100b001a64851087bsm8129700plh.272.2023.05.17.11.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 11:56:53 -0700 (PDT)
Date: Wed, 17 May 2023 11:56:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <202305171156.1D26B2025E@keescook>
References: <20230517125423.930967-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230517125423.930967-1-arnd@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 17, 2023 at 02:54:09PM +0200,
 Arnd Bergmann wrote:
 > From: Arnd Bergmann <arnd@arndb.de> > > kdb_send_sig() is defined in the
 signal code and called from kdb, > but the declaration is part [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzMKZ-0005XY-Qd
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: include header in signal handling
 code
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, May 17, 2023 at 02:54:09PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> kdb_send_sig() is defined in the signal code and called from kdb,
> but the declaration is part of the kdb internal code.
> Include this from signal.c as well to avoid the warning:
> 
> kernel/signal.c:4789:6: error: no previous prototype for 'kdb_send_sig' [-Werror=missing-prototypes]
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
