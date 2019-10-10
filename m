Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9822D26A7
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 10 Oct 2019 11:50:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iIV5U-0002DK-Gu
	for lists+kgdb-bugreport@lfdr.de; Thu, 10 Oct 2019 09:50:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iIV5T-0002DD-4E
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 09:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yNx+8n36uJ0WGHxBC9aaDo5XpCmOIJvnh/6Zg8N6jFk=; b=YLANBAhmdVWHR4o5AHdUApUpTJ
 MQgxj9BUURp5po/DaP1sgGXBwqe0uj/d9XJ1YcIYNIgPaRytr/NCUgcLRo4Gjslr/uC/MtFWvUsWV
 c3MVmEkHmfzeJeP77UdGPy5ODFXX5/wdMcpRkQ2uAWS6jTUQx/rClPNHFrcx8gSxfuVc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yNx+8n36uJ0WGHxBC9aaDo5XpCmOIJvnh/6Zg8N6jFk=; b=HnT/r6ZQkxVAooQg9TXI6yebxa
 o+KUvz8rbTezCWMH0IZ928mPO40be4mkRHSX8jFf3cPWTo8QUksxiUQnn4fC2GvoIFRnSXZ01oIeu
 uxUKjVbUdmmsGk13ctVZOinwHilqV0G9PCPmBUu566xqCkZGlSLAJrpNP796g0N9c6XY=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iIV5O-004smb-Jf
 for kgdb-bugreport@lists.sourceforge.net; Thu, 10 Oct 2019 09:50:23 +0000
Received: by mail-wm1-f66.google.com with SMTP id p7so6206527wmp.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 10 Oct 2019 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yNx+8n36uJ0WGHxBC9aaDo5XpCmOIJvnh/6Zg8N6jFk=;
 b=XnOJV7YI/chmZQMSTTcgcjcrpoZZh39oUa9LFBeXkUiykjjr5JEBgkK+KfCLOJG6O8
 6+NIc/vyXLmNqfB90MKN8p2Unok1c+fSiHgnwCyrXBJKeaQPqrFkhiy2P/mLshMb4fvb
 kB1pTofuj/RzTNiCrP5P+CFGWNF9hxdI1rBTBJP7STVGBnVmS1G7saGVLs5yod9EAWcS
 s7eZ+f9uqQ04q8bq3OcoV3Z9FvZ/0mp2Ibn69cbg0K9ejU+OuHVyhxeUwJhjfdA2m2K9
 WgkfJfrzns34UQNFKX1MMnVPj95NEovFrbRBNTgc3kzs4zUd37NIBrwK7WMsOH19ho8h
 xmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yNx+8n36uJ0WGHxBC9aaDo5XpCmOIJvnh/6Zg8N6jFk=;
 b=lUxL8npEUQddanT6r+pkZkfTl3UKHz9bEafZmV3noIBD6DAWSLoW3amBJUCvVs//i3
 mhXIg5GJ9UjJURnpJcv9nm9WVZlK1eJ6y9PpVj6k9o9jqiM5XllGaiRDA7Nq5nuACbAh
 frZ7G3cTpzPSQt89RcHZ2fXgyJoAOsqvXqba9u8zZK7MrFWXmS+pvnUMkMCeV9VT4WUK
 XU8MHY+RabKBFCcvlI9lzaDHHSM/9ueADK5B78vyb1YZN1fhYKwyjjuv61Rvvm8fDO7o
 QJIMcqZlwB9INhas09tnQd5inVUnr2wUvU8ww+83rWjcqUqlKo99tBSRmZIEotEJT3EN
 RqlA==
X-Gm-Message-State: APjAAAW4i1aLu3sVEi0rFxCMDRjm9sLzrWeEhjLQCEVshIi3XZ6jrMPU
 nDrilqNNZ9vko7ilw7sB3YR7gKPVAcuTWg==
X-Google-Smtp-Source: APXvYqzFLiv9I4jhmsqgSvPdg5cd8l8SX5O0wt8s2GhMRL49oWG4zEBcs3xLTe0L/Aic6+31c8mwog==
X-Received: by 2002:a1c:20d8:: with SMTP id g207mr6926175wmg.79.1570701011994; 
 Thu, 10 Oct 2019 02:50:11 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 207sm7788894wme.17.2019.10.10.02.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:50:11 -0700 (PDT)
Date: Thu, 10 Oct 2019 10:50:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20191010095009.25a5zvoykpmvtktq@holly.lan>
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-4-daniel.thompson@linaro.org>
 <CAD=FV=W9Tdh2hPekzgSYnCqoTX_ms1GY-FXgnxd-uEW0SWbyuw@mail.gmail.com>
 <20191009093049.tnz442bo54bzmzmz@holly.lan>
 <CAD=FV=UuLYPpkJBWbkWoJzv97A6jxRFa4QmmD-0chSrsuT_bPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UuLYPpkJBWbkWoJzv97A6jxRFa4QmmD-0chSrsuT_bPg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iIV5O-004smb-Jf
Subject: Re: [Kgdb-bugreport] [PATCH v2 3/5] kdb: Remove special case logic
 from kdb_read()
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
Cc: kgdb-bugreport@lists.sourceforge.net, Patch Tracking <patches@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Wed, Oct 09, 2019 at 10:28:36AM -0700, Doug Anderson wrote:
> On Wed, Oct 9, 2019 at 2:30 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> > > > @@ -741,7 +732,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> > > >
> > > >         /* check for having reached the LINES number of printed lines */
> > > >         if (kdb_nextline >= linecount) {
> > > > -               char buf1[16] = "";
> > > > +               char ch;
> > >
> > > The type of "ch" should be the same as returned by kdb_getchar()?
> > > Either "int" if you're keeping it "int" or "unsigned char"?
> >
> > Probably... although the assumption that kdb strings are char * is burnt
> > in a lot of places so there will still be further tidy up needed.
> 
> True.  It doesn't matter a whole lot so if you think it's easier to
> keep it as char that's OK too.

After looking at it from a number of angles I think we can have this
match the return type of kdb_getchar()... but the best way to achieve
this is to make kdb_getchar() return a unqualified char.

That ends up consistent across the sub-system and shouldn't do any
narrowing that wouldn't already have been happening inside kdb_read().


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
