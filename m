Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A11DA81B
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 17 Oct 2019 11:14:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iL1rN-0000YF-7y
	for lists+kgdb-bugreport@lfdr.de; Thu, 17 Oct 2019 09:14:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iL1rL-0000Y0-8n
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 09:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjPrzn+rbWZoq833/48Q3sh6NkFGlqikUBvXOdOFU/s=; b=CVF9OW41Uf++ipnG6hhuSjlD04
 iH9xDt1ZwdYN8+/P1lRLxHtr5gJB7qG15+D18uRnsf8vmwPlrWuFE32+xjCGbXHr6hvhegQ06ocqW
 9xlzNo42vMmcdWeC6djeJUe/8Y7i7WsvAvZfoCZd3tbHt5xb3rfgbekaTmg6iDxJvK0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjPrzn+rbWZoq833/48Q3sh6NkFGlqikUBvXOdOFU/s=; b=bwhn3sHw/qCha/bpQ5WqqMXCfn
 6j5qHAQoGO30lFyBhA1MKkCjg18xi8XFY1hQ87MPlYqfGFndyN+KxO7Ev1ra6RdfFOig6yAtCJ2Mh
 llCyCZz4KXCb+HzGllKs+22z/34hb36LzwXtUq9hIb28kAe7vo179eM6hNdNuYU6+Oh0=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iL1rH-00CEPd-IO
 for kgdb-bugreport@lists.sourceforge.net; Thu, 17 Oct 2019 09:14:15 +0000
Received: by mail-wr1-f68.google.com with SMTP id p14so1445715wro.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 17 Oct 2019 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yjPrzn+rbWZoq833/48Q3sh6NkFGlqikUBvXOdOFU/s=;
 b=Z6Fv2XHs9QqD1rEXGmmmX5ahLogdFvvhJUz819zJs4r/BRLqCmdm8SQo5nB6ibNvZB
 hIfwYYzuHIMa/R7+rkUIwXH0R1SFKuo2lEcaJvuY+K4yh99avYMWJ/BNrwAXmN7PoXWX
 2UQPRQ7lbnOJC91Mk/qLFouiz5RPnwfDU+ZfMUP+Wu1hruOpe1fT8QaX6y9o7GXTon0m
 QVP6FhUSk246HsgRiZLFWXLWzYrd8MMf9JDCLbry3hHbo9ZoDUm0b5JxA1QwVUAd2aby
 cqwjlbNhOgComrC9zLQlZgEhpflhdfKT5I9+2uXyCKnXbI8UTXC8cklwD0/Lm+paE0vA
 g3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yjPrzn+rbWZoq833/48Q3sh6NkFGlqikUBvXOdOFU/s=;
 b=JNOMpXYYjCacnMZCDNYzLc2OEaII4MlCi/JvsI6X7fMxi/rTp/hqLrFTXymJlmI24m
 ebtODjC4dcINPsz7TkPyjp2jPh75op63vSqhZOLdTYOyDHuuS1Kz7SvEcz2UMyHTS+ua
 xtgls2bVw2gtIjBvVvFW2Vio4I2vE7fvWe6KUFHD1gUtBJneXIxJWeR6ogF6Ht7kuqqU
 9zB1P3OlJGmHsZzyPAkvH5w+Nyz9RMaat80cc/E7NH4sIcKF5o0lQp+EgS9GtEWdV+zE
 R2+QmTebX9/0x7Ys6Y/wLadNJWcrC2FYKU5N1+5tzEcmi66tjQ4cBchL0sGBiWupvxOY
 pUMQ==
X-Gm-Message-State: APjAAAVrcGFCRDdFdVS2ntCJA4rcmWZs/e7++Y8oStKmxMZV/FbuOqux
 rufv+EkxuhRt42HmCw/7JVLr2A==
X-Google-Smtp-Source: APXvYqwFWce7Be9T4GJkKCnueWMNcy7EoB2ARFDRRGv/8mvX86gjO0m9yadrrwRA1AWNiJEVduv51g==
X-Received: by 2002:adf:dbd2:: with SMTP id e18mr2052978wrj.268.1571303644897; 
 Thu, 17 Oct 2019 02:14:04 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q66sm1867902wme.39.2019.10.17.02.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 02:14:03 -0700 (PDT)
Date: Thu, 17 Oct 2019 10:14:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20191017091401.76sqpcymegxur4kq@holly.lan>
References: <20191014154626.351-1-daniel.thompson@linaro.org>
 <20191014154626.351-4-daniel.thompson@linaro.org>
 <CAD=FV=W44zXesz8b8Z05_k7JjPW8D9z8fGT3GiGFSmSLw85zMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=W44zXesz8b8Z05_k7JjPW8D9z8fGT3GiGFSmSLw85zMQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iL1rH-00CEPd-IO
Subject: Re: [Kgdb-bugreport] [PATCH v3 3/5] kdb: Remove special case logic
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

On Wed, Oct 16, 2019 at 09:10:22PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Oct 14, 2019 at 8:46 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > @@ -91,12 +92,17 @@ kdb_bt1(struct task_struct *p, unsigned long mask,
> >         kdb_ps1(p);
> >         kdb_show_stack(p, NULL);
> >         if (btaprompt) {
> > -               kdb_getstr(buffer, sizeof(buffer),
> > -                          "Enter <q> to end, <cr> to continue:");
> > -               if (buffer[0] == 'q') {
> > -                       kdb_printf("\n");
> > +               kdb_printf("Enter <q> to end, <cr> or <space> to continue:");
> > +               ch = kdb_getchar();
> > +               while (!strchr("\r\n q", ch))
> > +                       ch = kdb_getchar();
> 
> nit: above 3 lines would be better with "do while", AKA:
> 
> do {
>   ch = kdb_getchar();
> } while (!strchr("\r\n q", ch));

Doh! Too much python...
> 
> 
> > @@ -50,14 +50,14 @@ static int kgdb_transition_check(char *buffer)
> >  }
> >
> >  /*
> > - * kdb_read_handle_escape
> > + * kdb_handle_escape
> 
> Optional nit: while you're touching this comment, you could make it
> kerneldoc complaint.
> 
> 
> > @@ -152,7 +158,7 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
> >                                 return '\e';
> >
> >                         *ped++ = key;
> > -                       key = kdb_read_handle_escape(escape_data,
> > +                       key = kdb_handle_escape(escape_data,
> >                                                      ped - escape_data);
> 
> nit: indentation no longer lines up for the "ped - escape_data" line.
> 
> Nothing here is terribly important, thus:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks. I'll pick the nits (although I might leave v4 out for review
for a relatively short time before applying it ;-) ).


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
