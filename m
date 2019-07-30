Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C297A589
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 30 Jul 2019 12:05:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsP0x-0005DS-64
	for lists+kgdb-bugreport@lfdr.de; Tue, 30 Jul 2019 10:05:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hsP0v-0005Cv-Jn
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 10:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OKHPgt351A2QI/YnAoBew430R/eEud4lktf6EqpjGpg=; b=gjXB0gtMLQ45Ef3wRmheM+vihi
 smyX6+Zom9/osWakDGVHyZ1OpqbX11jqrsWGpsUufftg1nUS6dokJyixWDhgdfqTRIsRfOz3zjE8a
 8tF/Nhwuj5b5PCsBjlVm4icGfaq1Ithtz9fLMWsCWX04f3u7hltHmi8pMZzHqaiXV3YU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OKHPgt351A2QI/YnAoBew430R/eEud4lktf6EqpjGpg=; b=QyE5a5uEC5FGUGAudBVvdENNJL
 IQaRpsbXfgQG9VdVlSAozWaUHFDkbTlCyxa3aTJfPHlU4yJrN0L5lqIxMyzXo+ED0WcRvStCPiKmF
 MVZ6TpJscx9R3uX7fFD/2S6vgjJrZg02XXAputWyhK3eEd4L5T2Ck/YSHc8XfsroFVUc=;
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsP0q-004eTo-Bu
 for kgdb-bugreport@lists.sourceforge.net; Tue, 30 Jul 2019 10:05:49 +0000
Received: by mail-wm1-f67.google.com with SMTP id u25so45711902wmc.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 30 Jul 2019 03:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OKHPgt351A2QI/YnAoBew430R/eEud4lktf6EqpjGpg=;
 b=RqBfxw97A4nmG8mtwYF0ixTRO1L2KitydpEs0s7A9mThwfv3W3lssL9LdVrwBCNSTL
 6aTa3QikOhqtxE8YBtXu8RFvVtc0749oRJnZzvfR2Jf1aXTQ1KGUb60z4+d7aqpxpuFt
 Yimlk5DPLJT8+c3Gvq8/wpNlwQDJoT4InUI8dySJ+VfY9eE2glqRn98uvt9rstvIlgkb
 ujoyIDTr3IF+RcBEuw60GT1gGg+/z6IFD/bcphdQG9oFzRNxt7d2bV96UeLvKqZPqa1G
 57xWhKorvU+Mz7lw8uXpGHPgX4epyPFoX+aBQbvdKc287NFLi0I40AcA5VkoBBcGPrrB
 cI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OKHPgt351A2QI/YnAoBew430R/eEud4lktf6EqpjGpg=;
 b=iwCIzwNME6BHtFbUCfb8xrwThakv256tQN6hvQArE4vwzX5jMAHj8Yxky4AO5odZm7
 5liVZD3yqmUBrZWu4KHG1ZWapFKFH3jDFG0ecCZtg8Fguq2T7TWG1MFPLZE95oUN+rEU
 dipWSG55ku3/Q4xNIp2NxEVHET/bOGJNrVHwxbp47ozqfQt/dEMkouN+kas2bR37zFUj
 Yoa4TIVUAltBV4BVt3i0Lu24jelZuo3Dyc6CLby2WUZQlfOKh9dsNZj/UXAUmegpSABb
 PPNRsXI+PeKGNrnyxjqcr38N1aTNTOVPqiryt9Ay/6U9m4s5UlkHEGc4d1MCAUpwvWeF
 jXTg==
X-Gm-Message-State: APjAAAVYyIKOc5V9Hn9tjGsNCGMieVyvysqX+A6qYkJgMRfu/WusWSWf
 3iBJQ+LnFPCoC9UwkpgkEHzzUA==
X-Google-Smtp-Source: APXvYqzMcRBOGS9JyQwlv9X1JATjMYuUOHXer2CbHw/UNsXtIbzYshroVuyxhY0awf3K6l7Q+DIEDA==
X-Received: by 2002:a1c:1f4e:: with SMTP id
 f75mr101927560wmf.137.1564481137788; 
 Tue, 30 Jul 2019 03:05:37 -0700 (PDT)
Received: from holly.lan (cpc152527-shef18-2-0-cust115.17-1.cable.virginm.net.
 [77.99.252.116])
 by smtp.gmail.com with ESMTPSA id s12sm59321417wmh.34.2019.07.30.03.05.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 03:05:37 -0700 (PDT)
Date: Tue, 30 Jul 2019 11:05:35 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20190730100535.iv7blrsktbenjfwv@holly.lan>
References: <20190729151359.9334-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729151359.9334-1-hslester96@gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hsP0q-004eTo-Bu
Subject: Re: [Kgdb-bugreport] [PATCH 02/12] kdb: Replace strncmp with
 str_has_prefix
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jul 29, 2019 at 11:13:59PM +0800, Chuhong Yuan wrote:
> strncmp(str, const, len) is error-prone.
> We had better use newly introduced
> str_has_prefix() instead of it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  kernel/debug/kdb/kdb_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 9ecfa37c7fbf..4567fe998c30 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -830,7 +830,7 @@ static void parse_grep(const char *str)
>  	cp++;
>  	while (isspace(*cp))
>  		cp++;
> -	if (strncmp(cp, "grep ", 5)) {
> +	if (!str_has_prefix(cp, "grep ")) {
>  		kdb_printf("invalid 'pipe', see grephelp\n");
>  		return;
>  	}
> -- 
> 2.20.1
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
