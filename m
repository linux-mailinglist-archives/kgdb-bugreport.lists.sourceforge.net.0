Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A81D163F
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Oct 2019 19:29:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iIFlj-0002hC-Q8
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Oct 2019 17:28:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iIFli-0002h5-RR
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Oct 2019 17:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X6N0xkl4bTPUi6zGcRxZ0oIYFX/fveTjl+e6ocsFVkI=; b=il1pyawItM9sl4MQTxPPva3zvg
 PjTvdO52eOsUtJnISgFatumi4udZAXhFMPD+2w5LWpJNMPQgbRDAmiPaAHwFOPvnyhwDHTc0Z9Qnw
 UorcXuXRjXbKqEbJHf4KFcp+0qKGblT0juJtJ1xQOr7yweNwqMdHKFG3QHmwH/KqJDfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X6N0xkl4bTPUi6zGcRxZ0oIYFX/fveTjl+e6ocsFVkI=; b=B+OXyz+jzxbRHNKgTBGluXqBko
 C7nz/S6R3sT8cIz90b/Ihg2Hm5txWkrPKfUax4ebDa68BtwiM0/iALbTU/NvIk61t4mk/9A80WDBJ
 qfEKX8gvbupZbFllu1eFU4QTtN3aIKPaL5QiPch826h4IIe72UiMuCuphD5kCKYRUP+k=;
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iIFlf-00BZiE-Fd
 for kgdb-bugreport@lists.sourceforge.net; Wed, 09 Oct 2019 17:28:58 +0000
Received: by mail-io1-f68.google.com with SMTP id c6so6717199ioo.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Oct 2019 10:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X6N0xkl4bTPUi6zGcRxZ0oIYFX/fveTjl+e6ocsFVkI=;
 b=FW0PIz9QpEJNdQumuiaUalMyaj2SzMhIDhra6dX9NJb4a5Laxke+fDfxJBtD/etYOr
 w4jxzvQnZ27rB/wkJMbsqX6XfuqANFpnb7FoaCJegpZLlaXI+p5vU0X2V9REcsVm3F79
 NLP9UYGd300jIkFcrZZaDZLF+ymWhQ+VxPBlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X6N0xkl4bTPUi6zGcRxZ0oIYFX/fveTjl+e6ocsFVkI=;
 b=CpYPYR66HthQh2I8ZGyLEKYvcdK/l+lpk6DKmQ9jcGVdbcQgvYLQPjTNzZzP/U9C+H
 0VENRPr0q9dIzgbrQvimWAjYCxtDrWoq4vtGoYIKEED3Sz5shtdYSb8iIec6cNx2lDTP
 UXeI6VksrW+OgawZfI+7Y+mi8u8mNng/8Ccg0akJKaXIO9nTY80AV/idxng5W2RaFCwb
 r9namEpGrSXaFHYcD0hPWwbFK4zqx8FqmD5vyd9gCa+SbckOSGXyZjI1bdXyzV+g/HUF
 0SB+EgC/Z3+bKpLemG9DXAgkMU0WIYgZvu+IgcSoXA+LawztVw9P6Q5ATkPjZBSH+qge
 a56w==
X-Gm-Message-State: APjAAAVRTTY+sAeleoniXlzxb4Jkc/125B9XcRIgy2SNSKh2k52LLhTT
 hrROQgp+ZRNQIYye7OqD9xLtYsoDAPM=
X-Google-Smtp-Source: APXvYqyEfIxAA+xplhJmlJwduZ2Vsi6DjglLmOamWy9Z7FwavMmFD3BO60QRuzcAtPNaMva6JDbCwQ==
X-Received: by 2002:a05:6638:1f0:: with SMTP id
 t16mr4207542jaq.119.1570642129143; 
 Wed, 09 Oct 2019 10:28:49 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com.
 [209.85.166.53])
 by smtp.gmail.com with ESMTPSA id c11sm1373397ioi.67.2019.10.09.10.28.48
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2019 10:28:48 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id n26so6783219ioj.8
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 09 Oct 2019 10:28:48 -0700 (PDT)
X-Received: by 2002:a5d:9386:: with SMTP id c6mr4649645iol.269.1570642128135; 
 Wed, 09 Oct 2019 10:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191008132043.7966-1-daniel.thompson@linaro.org>
 <20191008132043.7966-4-daniel.thompson@linaro.org>
 <CAD=FV=W9Tdh2hPekzgSYnCqoTX_ms1GY-FXgnxd-uEW0SWbyuw@mail.gmail.com>
 <20191009093049.tnz442bo54bzmzmz@holly.lan>
In-Reply-To: <20191009093049.tnz442bo54bzmzmz@holly.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Oct 2019 10:28:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UuLYPpkJBWbkWoJzv97A6jxRFa4QmmD-0chSrsuT_bPg@mail.gmail.com>
Message-ID: <CAD=FV=UuLYPpkJBWbkWoJzv97A6jxRFa4QmmD-0chSrsuT_bPg@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iIFlf-00BZiE-Fd
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

Hi,

On Wed, Oct 9, 2019 at 2:30 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> > > @@ -183,17 +186,7 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
> > >   *     function.  It is not reentrant - it relies on the fact
> > >   *     that while kdb is running on only one "master debug" cpu.
> > >   * Remarks:
> > > - *
> > > - * The buffer size must be >= 2.  A buffer size of 2 means that the caller only
> > > - * wants a single key.
> >
> > By removing this you broke "BTAPROMPT".  So doing:
> >
> > set BTAPROMPT=1
> > bta
> >
> > It's now impossible to quit out.  Not that I've ever used BTAPROMPT,
> > but seems like we should either get rid of it or keep it working.
>
> Thanks. Just to check I got exactly what you meant I assume this could
> also have been phrased as "it looks like you forgot to convert the
> kdb_getstr() in kdb_bt1() over to use the new kdb_getchar() function"?

Right.  Sorry for wording it in a confusing way.  ;-)


> > > @@ -741,7 +732,7 @@ int vkdb_printf(enum kdb_msgsrc src, const char *fmt, va_list ap)
> > >
> > >         /* check for having reached the LINES number of printed lines */
> > >         if (kdb_nextline >= linecount) {
> > > -               char buf1[16] = "";
> > > +               char ch;
> >
> > The type of "ch" should be the same as returned by kdb_getchar()?
> > Either "int" if you're keeping it "int" or "unsigned char"?
>
> Probably... although the assumption that kdb strings are char * is burnt
> in a lot of places so there will still be further tidy up needed.

True.  It doesn't matter a whole lot so if you think it's easier to
keep it as char that's OK too.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
