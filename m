Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F97344FD5
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 22 Mar 2021 20:24:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lOQ9z-0002G7-M3
	for lists+kgdb-bugreport@lfdr.de; Mon, 22 Mar 2021 19:24:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lOQ9G-0002E2-D0
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 19:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DX81xpKR3NVOCyK3ejwbrnW+v8s68jGVqeWwVOT6Amo=; b=bqVHeF/IzlxWvqbZvTTYzWyy6S
 kUwFcr8DZLVOGZ8wAXJpasZjRfc3l+DId6Kf9LkQMyb/63T60MRryModFrAXdPEwIZXVcWVwgqNsr
 8P0Id8gEfFcHMbmUHFXT9U5v6Q2iZFYTsIRpRgyTIDSHLyE0O4ewILwRv/ukX4Ueem8E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DX81xpKR3NVOCyK3ejwbrnW+v8s68jGVqeWwVOT6Amo=; b=nFg0f+mcT9kjlg4DTJey4UgHw7
 IUXmyZCIu6mAFTD4OLty/xeiGxD1Nxv8sa7lDhH1rMQBdy2ZV5eWi/VsBJ/92wov3JnZU3CP7rOqf
 fdGwsXKbmX2otA5iR5nl1bo1WqdvJwU2+UZMoMSnKevT0RHageWDGDY4DQ+1O8qs9iRI=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lOQ93-000836-JY
 for kgdb-bugreport@lists.sourceforge.net; Mon, 22 Mar 2021 19:23:33 +0000
Received: by mail-ej1-f51.google.com with SMTP id w3so23165187ejc.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 22 Mar 2021 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DX81xpKR3NVOCyK3ejwbrnW+v8s68jGVqeWwVOT6Amo=;
 b=l5t0AGwxS1yfpVVoibj20aQMIcGvSdZuLwxDieUjzW4trn6U6txHei1HKNBTfVPI1c
 oun4GVakBxDjSEIu4y2qge3Vk9c87gY8aPGDOAUczeuKzfkMYIzA+BmW92PoCNXBhcbd
 AQOW95FYeEvnxCsb852kHor4PVhaKkpyuO2DiXwP/ZTLO3paU5KiYF/oOYvJbxzvWzX/
 qy+6M0sZ/EYk35nvCoGp93xP8hekRsRHGpzhS9XK5kMkduubPpeu8bbmyPwB0fNpe+ob
 fOT6ZVzwfyCImD9yQYXz1vqMy9OQO8WZy2Nb9N4QrsNNO3npl/7pnH6qhT1lPfDdRgEH
 d39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DX81xpKR3NVOCyK3ejwbrnW+v8s68jGVqeWwVOT6Amo=;
 b=k1tAK6Fd9JfqXsAE1m4mVGxohNGkjNIt7byJbuAavEXo0IKLXsUHVzKGxUPIWCvtb9
 aViRNb8a4pbJ+hWu2oaTOC7326WL/yG9wXDQuG8wLo4yWX9GyV6UUkvbOgWFHrRVcEVq
 gxV3F4QeSK8djkgmh4MIk2RqxAK/xQVDftzNpJloLZr5TdajJcEHHCnAvAymnZaxs+L8
 KyhvXSKJ2+B4ITMCW7nz5ZRP9LdEHIWrDbbek+D9TxquO5brS8UGARjQfizDE6N2uZoB
 SOR66t2D9QPaRff+AOlO+szaYZ603pb8+ANDNd3jqGVA7To7/14DPByMlBXK9sCiF6po
 CUPw==
X-Gm-Message-State: AOAM532rzROvBHZ3+d6f7p8x9y66ZVlEZq0wvLZmbDzxH2wdvJEf3HlJ
 bS4p2K/mzxlZvL7rylnfWhDA2w==
X-Google-Smtp-Source: ABdhPJyplTOh79M3+bB6N3SgTZlTu+XSpnp6lzlPNLrGB2iHs6PVOXKuYGyBm9zQpxMkTw5huPIf2A==
X-Received: by 2002:a17:906:2759:: with SMTP id
 a25mr1373890ejd.122.1616440995158; 
 Mon, 22 Mar 2021 12:23:15 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id u59sm12384865edc.73.2021.03.22.12.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 12:23:14 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:23:13 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20210322192313.fw46yficc7mfjinu@maple.lan>
References: <20210322164308.827846-1-arnd@kernel.org>
 <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WY6yxx+vkH+UU4VYei29xBftdnyRBE1OpEELmJ-kLfFg@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.218.51 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lOQ93-000836-JY
Subject: Re: [Kgdb-bugreport] [PATCH] kgdb: fix gcc-11 warning on indentation
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net, Ingo Molnar <mingo@elte.hu>,
 Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Mar 22, 2021 at 10:04:57AM -0700, Doug Anderson wrote:
> > +       if (verbose)                    \
> > +               printk(KERN_INFO a);    \
> > +} while (0)
> > +#define v2printk(a...) do {            \
> > +       if (verbose > 1)                \
> > +               printk(KERN_INFO a);    \
> > +       touch_nmi_watchdog();           \
> 
> This touch_nmi_watchdog() is pretty wonky. I guess maybe the
> assumption is that the "verbose level 2" prints are so chatty that the
> printing might prevent us from touching the NMI watchdog in the way
> that we normally do and thus we need an extra one here?
> 
> ...but, in that case, I think the old code was _wrong_ and that the
> intention was that the touch_nmi_watchdog() should only be if "verose
> > 1" as the indentation implied. There doesn't feel like a reason to
> touch the watchdog if we're not doing anything slow.

I'm not entirely sure I'd like to second guess the intent here. This
macro has been there since this file was introduced but several callers
have been added since then. We have to guess their intent too!

So, whilst I think you are probably right, v2printk() does appears in
places such as the single step test loop which makes it pretty
difficult to decide by inspection whether or not touching the watchdog
is useful.

It's something that could be further examined... but I'd be a little
reluctant to combine it directly with a whitespace change!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
