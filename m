Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE149FC97
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 28 Jan 2022 16:16:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nDSzK-0001qv-K6
	for lists+kgdb-bugreport@lfdr.de; Fri, 28 Jan 2022 15:16:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daniel.thompson@linaro.org>) id 1nDSzI-0001qc-4Z
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jan 2022 15:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0MbAYZn48s/2sw8+6sJEGK9DVzD/LP2yU/tzes0Wew=; b=Xgfm5I19bwa3e4DJJsk1soggTG
 LDNtXujxPNIQCFYHblAFExTMIpAWze+e9hwDO/3r4p8QB2D8YhlxKlk1fAeDQlrMRH9n+76DvIpZJ
 c72OVW21MN1Ob31L4kEhXb+Oo8YY+UizS4wYGU0SqG0yatJ1SG0doCmzf33BAC/Pg6gQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c0MbAYZn48s/2sw8+6sJEGK9DVzD/LP2yU/tzes0Wew=; b=VMETwbIw4h90dA6pGZ6gXzQO7o
 d59wkqX1etOet+TjDA1nGxhjMPXUtKpcTnP9Nl2zy1BWYztwFDlWDebgMwd1O2teFsm2DLJgLhvls
 zusFSYvz18sIoPGdwHq8TvcbuSCwv1NbyfFEZ6RDLvJUta9FaxshvALEVUop/vQkLlMo=;
Received: from mail-ej1-f45.google.com ([209.85.218.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nDSzB-0005LX-Gf
 for kgdb-bugreport@lists.sourceforge.net; Fri, 28 Jan 2022 15:16:29 +0000
Received: by mail-ej1-f45.google.com with SMTP id s5so17095049ejx.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 28 Jan 2022 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c0MbAYZn48s/2sw8+6sJEGK9DVzD/LP2yU/tzes0Wew=;
 b=KnoYpCROJNJ4KeVjiMHVRjI3Nw6MBdLiVMYBKyWi5SjTGkUNhmLXnrLxkxBTE/uvzm
 1i7z3jyz9HYmoZNAG5Loy00qH2mtg+iFqBgPPlltZlvuAUpVQzHJC/Zh5YvuO8bbiuKV
 EhY0GkfgFO0pVCtVfHeoBwIMjXpF7AfmFwBBlSPZrfauweTohE5pmPCqYrkC4s7Xusfz
 4HPmI5qzz1+q+sdmUh4Ity1hlHsWh5wpsKT4x8GRkQTfDY1KyAL6lGRKpMiXEM/O84+/
 bEb7k6+NG5FdGoGanjw1rOia/TgJAtC6p47O0pODeUAm6OEJWTT+h5i60wvVX+nLYbKo
 twmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c0MbAYZn48s/2sw8+6sJEGK9DVzD/LP2yU/tzes0Wew=;
 b=spFm3mjeQyTiY7pZR41PkKcg9DKeNsA01Ay3cBJcGWKrnx6gVAePwNzpCR59VrxGOz
 MkWIW1zZ7LsgJz270DvVGw5ZwNME9XBWuQ0MK+YjQIinfnEm80E//SOA0Q6X3thqQ1VP
 AdVnYFZWuUJPIu6IHj61hQYB8Jx+GtNNk3xdyQ9GEwPYB8K3l0gHpkoh3M0bdyOxmxV5
 zML+BE1vjhRBcuK5IuQL4mdL79uwyg02vSixJ8manqIXoQwRxrl9RDiHT6TeO2xMKkCV
 u1kfFcP5DClY3JbXRjbHO+5u0jgYHb3QGg87wJAUl+jGDQqwQFV8k0qiCI2dQJWcHGAj
 r9dg==
X-Gm-Message-State: AOAM5317WHV6KE71kDBpnTwhAOVoYupE1CBYw5avasJy+pzbtpLzHVoN
 87DznHmupdWXOmtEwJI6bdlFLM82DOzQ1wm3
X-Google-Smtp-Source: ABdhPJwcwaW5k4PCVMl0xIx5mubfMQwAXKgrPRB+Y2ibDaLBwjoVmYeQufxi/ZaCrtP5AiArmXZMSw==
X-Received: by 2002:adf:d1ed:: with SMTP id g13mr7395000wrd.477.1643378989779; 
 Fri, 28 Jan 2022 06:09:49 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id w22sm4811774wra.59.2022.01.28.06.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:09:49 -0800 (PST)
Date: Fri, 28 Jan 2022 14:09:47 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <20220128140947.n2xea77txqohfbfj@maple.lan>
References: <cover.1643282353.git.christophe.leroy@csgroup.eu>
 <af8519537d2a5c36b71a2f48ba9b81c07c93a5c4.1643282353.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af8519537d2a5c36b71a2f48ba9b81c07c93a5c4.1643282353.git.christophe.leroy@csgroup.eu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 27, 2022 at 11:28:09AM +0000, Christophe Leroy
 wrote: > Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC to allow architectures
 > to request having modules data in vmalloc area instead of mod [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nDSzB-0005LX-Gf
Subject: Re: [Kgdb-bugreport] [PATCH v2 4/5] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Jan 27, 2022 at 11:28:09AM +0000, Christophe Leroy wrote:
> Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC to allow architectures
> to request having modules data in vmalloc area instead of module area.
> 
> This is required on powerpc book3s/32 in order to set data non
> executable, because it is not possible to set executability on page
> basis, this is done per 256 Mbytes segments. The module area has exec
> right, vmalloc area has noexec.
> 
> This can also be useful on other powerpc/32 in order to maximize the
> chance of code being close enough to kernel core to avoid branch
> trampolines.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>

Thanks for diligence in making sure kdb is up to date!

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
