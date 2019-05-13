Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ECF1B167
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 13 May 2019 09:44:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hQ5do-0002bA-9m
	for lists+kgdb-bugreport@lfdr.de; Mon, 13 May 2019 07:44:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hQ5dn-0002ax-57
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 May 2019 07:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GbstJVyW1AtQn0uCOokyeICMnnihu2g5VNt0MV0fVRw=; b=eN6UPxdrPL+upq06IGHzB2SmtG
 kr+XfgskPDtqmBLgpJ8XvTv14EbXp4fS3pNfontl0rTJ44Q4N45Kr6ASA5oT3T32EH07wK1XXjQdJ
 bcpLtJwrF7pfzVK87ccjWi1MhI8eoxDvvEWdq8gPxc3AskshAG3k8OByYafIT2yWDc4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GbstJVyW1AtQn0uCOokyeICMnnihu2g5VNt0MV0fVRw=; b=L1xLeHh98uhK7ww33eZJdNxJH7
 HE7/WTNwDRe8jFEgcb7osQtwJH0I8onzyrzEtDasGP4t++Bie5Fcbx6LO1l+7oRHp/10IyYnvfr0q
 ZKsH97p+TUvC63kQCfsm7UF9JYDP42ddLNDDqFMa1cHQGfcGXr90rIImuY8DDU+3wcnA=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hQ5dl-001mP2-5C
 for kgdb-bugreport@lists.sourceforge.net; Mon, 13 May 2019 07:44:55 +0000
Received: by mail-wr1-f68.google.com with SMTP id f8so4355483wrt.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 13 May 2019 00:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GbstJVyW1AtQn0uCOokyeICMnnihu2g5VNt0MV0fVRw=;
 b=NsdcE677iiLa6/IG0QmYfUg1mJqtJgcJIBPmrYoGXf7HmCEJJIm0yONFrNG9JD73jM
 7+dFIEL9HKpTCmVMlx7GoRq7P2BSklJhQ6v2MN+kVtpjc5sK+sBmnoiI61faAD3LOFpK
 xm3JpbHXFaMd1B5lP9KyEtk7HO2ZghB061Oh7U3TIy7btqR295rwud6g3jAxJxnhwov1
 nIqRnSqQF6YtMRZ1lUUm0Y6CJd1V80mJW1oeBc8KeNoUUQqGrEfO3dgnvir5pa3zrFzW
 Spe9k2wBvyQhswd3H8VwU8YEDGW8bBtB6dHfeErWVrRKBnc4LF5a9XyXkSly9b13zOmq
 jdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GbstJVyW1AtQn0uCOokyeICMnnihu2g5VNt0MV0fVRw=;
 b=cW+j9NxEfEEtJ2Rfb/KYkgNbkbfBbzHBqi4bfqVlihR0GpolSw96tDuaFYlC7gnACK
 u6IbfqKW37+6D/fbUOo+5e5AizYIaQg8/UWOuXpY1JDJ3/X2U9BNmn3u5o/OdTroSiJw
 ILltFEZMi4pE/Y+F0Uhryt88NPdBVYuR4f2zLkM0PE7JNmohobMSTDrmKD5G+p2fbieY
 Hqo5UBl9Zr5oqfvrYoJY1uBSdqsJq4KwFsTTwvLtuWji3r/VrA/bXki6S6B2KW/6HKav
 L90NWQIFx6rn7YKoq0YcDSt2mUQBmJBNNGi0YTdnZ2ML0Pcr3oX7vbL9gETxPqLvtl7Y
 Ua1g==
X-Gm-Message-State: APjAAAX9i3/BwOcxwfKYfo4HuzeddujvIJTtaOPcE/3aWu3flPrSM7Gy
 6UcqODBcfY9MkM8MIFyezJKAEd9aOqzgCg==
X-Google-Smtp-Source: APXvYqy26b5mNoq9PPPNs08FcGKst+gUyWf/A1XghrrIho6WmjLmmKyzPwn2tDVdt9/FuWw0mNY/aw==
X-Received: by 2002:adf:f841:: with SMTP id d1mr9758107wrq.62.1557733486527;
 Mon, 13 May 2019 00:44:46 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id g2sm3521885wru.37.2019.05.13.00.44.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 00:44:45 -0700 (PDT)
Date: Mon, 13 May 2019 08:44:44 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wenlin Kang <wenlin.kang@windriver.com>
Message-ID: <20190513074444.eftse5jimrl4xtc7@holly.lan>
References: <1557280359-202637-1-git-send-email-wenlin.kang@windriver.com>
 <20190508081640.tvtnazr4tf5jijh7@holly.lan>
 <ac8af42c-e69d-6fd0-1d76-73a37e8a672c@windriver.com>
 <20190512090003.de52davu55rrg7kn@wychelm.lan>
 <0c5121f7-645c-3651-cccc-2ae836d415b6@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c5121f7-645c-3651-cccc-2ae836d415b6@windriver.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hQ5dl-001mP2-5C
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix bound check compiler warning
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
Cc: prarit@redhat.com, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, May 13, 2019 at 11:39:47AM +0800, Wenlin Kang wrote:
> On 5/12/19 5:00 PM, Daniel Thompson wrote:
> > On Thu, May 09, 2019 at 10:56:03AM +0800, Wenlin Kang wrote:
> > > On 5/8/19 4:16 PM, Daniel Thompson wrote:
> > > > On Wed, May 08, 2019 at 09:52:39AM +0800, Wenlin Kang wrote:
> > > > > The strncpy() function may leave the destination string buffer
> > > > > unterminated, better use strlcpy() instead.
> > > > > 
> > > > > This fixes the following warning with gcc 8.2:
> > > > > 
> > > > > kernel/debug/kdb/kdb_io.c: In function 'kdb_getstr':
> > > > > kernel/debug/kdb/kdb_io.c:449:3: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
> > > > >      strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> > > > >      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > 
> > > > > Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> > > > > ---
> > > > >    kernel/debug/kdb/kdb_io.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
> > > > > index 6a4b414..7fd4513 100644
> > > > > --- a/kernel/debug/kdb/kdb_io.c
> > > > > +++ b/kernel/debug/kdb/kdb_io.c
> > > > > @@ -446,7 +446,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
> > > > >    char *kdb_getstr(char *buffer, size_t bufsize, const char *prompt)
> > > > >    {
> > > > >    	if (prompt && kdb_prompt_str != prompt)
> > > > > -		strncpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> > > > > +		strlcpy(kdb_prompt_str, prompt, CMD_BUFLEN);
> > > > Shouldn't that be strscpy?
> > > 
> > > Hi Daniel
> > > 
> > > I thought about strscpy, but I think strlcpy is better, because it only copy
> > > the real number of characters if src string less than that size.
> > Sorry, I'm confused by this. What behavior does strscpy() have that you
> > consider undesirable in this case?
> 
> 
> Hi Daniel
> 
> I checked strscpy() again, and think either is fine to me, if you think
> strscpy() is better, I can change it to this, and send v2, thanks for your
> review.

I think strscpy() is better.


Daniel.

> 
> 
> > 
> > Daniel.
> > 
> 
> -- 
> Thanks,
> Wenlin Kang
> 


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
