Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0290D7EF
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 17:59:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJbFM-0006sJ-9Y
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 15:59:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sJbFL-0006s5-BF
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 15:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KW5CYpn36l//7aM9dysfyiIEFCEnSC7/zTj92FzcYsw=; b=KTeURvpz0+b95LkHxq9YXgxvQw
 Srzx+ypPDz/aOAM1Ckm0BHiM7Y8b7zZy/UhqMKwsHiK337XIeOUY5JqlZUxKiWyGJBgGVSYESjLcI
 p+BIo3IwicD1aWui2g7++O0CIoYqbn8Ht1CNF3v/WEkhesMGa0/xPCLj8kMjekYSF84k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KW5CYpn36l//7aM9dysfyiIEFCEnSC7/zTj92FzcYsw=; b=fiC3WJQzWcyeH+fm4npR/uqmLU
 w9KRAL/Yp4v9Jr2+DjxRO/CbIhFLMV30MHKD7agEYyVf+ier5yBmEeInJBtIPyBAA+1eNP5v24ZRQ
 8rouOKbE/su0++Aus9ou20auOoDi5XRiuGLQ1yhantguiuGxFHfb20e/90AtIYlQ5FNA=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJbFL-0001Ld-Lk for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 15:59:47 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-421d32fda86so58860035e9.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 18 Jun 2024 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718726380; x=1719331180; darn=lists.sourceforge.net;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KW5CYpn36l//7aM9dysfyiIEFCEnSC7/zTj92FzcYsw=;
 b=oYg2bC8G0DAh2GmgawImNhVFlp7HunhoDMVXf+boSGjw32DJ18M17V2EGm0hH0Yhyg
 j873hMCJcASOqC7UOAFKGAAhwpdXrv4Ie4R4PjcaEidElen8DxSQnQmbjjhCexoTIdfJ
 PmNS0+7T0wh4lNWLH5Gar2k9nwhlTsXtN22SdNH4hDQW5M/aFwsf8BiAI0kCmsOSw9I/
 qi7yZ6kTQoHL3Ci/7a/K+nK3up5YeITBGX+BwJ/nShBB2gCdGR0/r6SrEdfpBl/dPaqq
 +L6a5Ta4SU/4TJDBXGe+IXh5SfwUj6mZK7RgnwZYJq0oFkmpyQlcDVjFx/A+lij0ByBE
 R9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718726380; x=1719331180;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KW5CYpn36l//7aM9dysfyiIEFCEnSC7/zTj92FzcYsw=;
 b=p/M8fWk1FgqQHJHSUabpzDN4jk3QhnpHYiAygzYaC+lx6Tw/UEh8LiBFBy/ZR3aGED
 KostycJvubYOzbNbx1VZYpaJ/iolVHSe82opH/UIScNyTaXJhuT1yg4ffvzNIARQT4Ct
 dS2QXO4IvehwGCqT3ijoxlxk7wFtCyIMnrQs5Uq4UmoXWAyvK2644K0816tcZTULotY/
 Kep2uID9sURpHq7Fozrh8QIaz1UGU2ZjU4WPowzh2Z9N89Pb2GBfVLEWKfxR/7xBRKWs
 c/dj3nHHo96uao0DsPcCaQB1sQ8oX3VtklMY99v257AeWDKW7zt5Fxqg39MZjv3IwaO6
 3RpA==
X-Gm-Message-State: AOJu0YzRpzGqnvBquxSAd5SBko9/E73Cqj/xdl0jA8v76xTiDci9OIhY
 jAymVe0VUHkjeWf7qEo+bwEmaXF404bWztvAdHyzn10SeAMcMFiDmQ7kOn2sN+Y=
X-Google-Smtp-Source: AGHT+IEOulskKK0DQifFRFKsJWs4iBdG02SkiZn2is5YgIwx6kR6gYve5+eWcIIhl+AbQIyMYcD69A==
X-Received: by 2002:a05:600c:474d:b0:422:178b:bedd with SMTP id
 5b1f17b1804b1-4230481a0bdmr116566685e9.1.1718726380384; 
 Tue, 18 Jun 2024 08:59:40 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e9590sm228819345e9.23.2024.06.18.08.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 08:59:39 -0700 (PDT)
Date: Tue, 18 Jun 2024 16:59:38 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20240618155938.GG11330@aspen.lan>
References: <20240618003546.4144638-1-dianders@chromium.org>
 <20240617173426.13.I572fb3cf62fae1e728dd154081101ae264dc3670@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617173426.13.I572fb3cf62fae1e728dd154081101ae264dc3670@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 17, 2024 at 05:34:47PM -0700, Douglas Anderson
 wrote: > Add commands that are like the other "md" commands but that allow
 you > to read memory that's in the IO space. > > Signed-off-by: Do [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
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
 [209.85.128.42 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.128.42 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sJbFL-0001Ld-Lk
Subject: Re: [Kgdb-bugreport] [PATCH 13/13] kdb: Add mdi,
 mdiW / mdiWcN commands to show iomapped memory
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
 Thorsten Blum <thorsten.blum@toblux.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jun 17, 2024 at 05:34:47PM -0700, Douglas Anderson wrote:
> Add commands that are like the other "md" commands but that allow you
> to read memory that's in the IO space.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Sorry to be the bearer of bad news but...


> ---
> <snip>
> +/*
> + * kdb_getioword
> + * Inputs:
> + *	word	Pointer to the word to receive the result.
> + *	addr	Address of the area to copy.
> + *	size	Size of the area.
> + * Returns:
> + *	0 for success, < 0 for error.
> + */
> +int kdb_getioword(unsigned long *word, unsigned long addr, size_t size)
> +{
> +	void __iomem *mapped = ioremap(addr, size);

ioremap() is a might_sleep() function. It's unsafe to call it from the
debug trap handler.

I'm afraid I don't know a safe alternative either. Machinary such as
kmap_atomic() needs a page and iomem won't have one.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
