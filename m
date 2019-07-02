Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EEA5CD12
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Jul 2019 11:58:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hiFYG-0004V3-92
	for lists+kgdb-bugreport@lfdr.de; Tue, 02 Jul 2019 09:58:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1hiFYE-0004Uu-BK
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jul 2019 09:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a2k1iaFL22UQeCW7P8EdQa9YlwZKftNrx5So7kK5VS4=; b=mzaO/tYNTPNLK3/V3xOqUsQ/wM
 m2XKUaNTWVv3E2Uy5wldzNa24+GU8un2Pf6vmTrYRV/tfFwLMIh7lFVGm2eILci2sQsI8HwQMSF/A
 b6o5v39iid7cbWtUBtbzFxhv0jSWER/E8HipIP5bctsj3XswLCP4072EVEV4SpJJh09E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a2k1iaFL22UQeCW7P8EdQa9YlwZKftNrx5So7kK5VS4=; b=Ah8lE64539c3aPxhP63N5+puu9
 dA+AlNwIX64QRAJ9F6c04wlaWNIyUh18PA0iwZl7lqPh4+zAQk4YePZV44BJBVXyIoEJbkKb1bkCB
 JmQl0UmTFbCtp+Y9kHdAUrmKUQXcvYcUZWyEsuIl2pROcvSrXwtgBh4hgut1QywEryi8=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hiFYK-004fK4-FO
 for kgdb-bugreport@lists.sourceforge.net; Tue, 02 Jul 2019 09:58:23 +0000
Received: by mail-wm1-f52.google.com with SMTP id w9so177719wmd.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Jul 2019 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=a2k1iaFL22UQeCW7P8EdQa9YlwZKftNrx5So7kK5VS4=;
 b=DnSw1olK6wIjK8tb5god4zKT22kOka5YK0JokmXF3bisVc8EgeHG2tbEV24AFxURYH
 6+aDWkjADfU0QQgOHfUkanMm1LOvmyka2RJLXP5im8Y9WzvfEp8ofiPzcHTm4TUfwJmU
 zJeOTRy9chD/YyOsJ9yBP9grKkBKl51/djiRMv9DF7enL9jNCQ5AE+gKwk000gDnWLq8
 xbbuTI7rZgh2EWgZAOZqTlNFMqj/Q7ha10nLXt3PReSfeph5gSTkVNgiccxGXGD0zArB
 L0CthCJw0nf5inPUsBLMStFAFc4l4wPQYthxqn6Uu1bLek9J7w4tAd9vPPN3MMgp+38A
 Syhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a2k1iaFL22UQeCW7P8EdQa9YlwZKftNrx5So7kK5VS4=;
 b=eTBY9Mj9kPYXOlHZ5vloB/JuSdRF4HuEUKJssslu0ZQ7MfmzJlnbIloSbymN5iTWye
 Ql7SElovwadmGBjf1u0Sf9tZrswZBu7i+c+sCr9XrgNo0gKD7ObFFXILlEvotZMWfKr4
 Oxj4TIZ/YUndMUNpHTFc3ylT4UrCtAbbaNFcnVDteibpje/o4H/8d9+ESmtYPBfZTYt7
 vtPeLBgwIX/K3G71DKyVnWM0vOsmkBOpd92N6cV2KRkZF7XV+t0tfnA+d7/gxFoWVb7c
 YcYnzIpMblIT1J1brjl88XDcyTRqjM82nEbZi5lMdZv/Fo5MkXOstABoamPsazndkvcy
 12Iw==
X-Gm-Message-State: APjAAAVxavKJqd6DVfhskDeVemYG8c15kLxIHroGvU7HnDsFOIaAI5JZ
 UHG6b4cmxl9Cc1pUsmt6U9ZO+ZtOLAkF4Q==
X-Google-Smtp-Source: APXvYqzvNzrQjX3Kbcxp8AlZJA4oh1zW3Yson+CC1zmGQBddbiCMQAQBuqfz+5wYspJhKVBjXQPbcA==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr2873839wmj.41.1562059687739;
 Tue, 02 Jul 2019 02:28:07 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id x20sm27846280wrg.52.2019.07.02.02.28.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 02:28:07 -0700 (PDT)
Date: Tue, 2 Jul 2019 10:28:05 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@google.com>
Message-ID: <20190702092805.bsaoe4eymufrvbz3@holly.lan>
References: <CAD=FV=W5oYiNRQEz4wg-8swR=sq6txWS28HryBkxhCkUXsnNjg@mail.gmail.com>
 <391f6bc3-71fb-0330-693d-841e4a15de9b@windriver.com>
 <CAD=FV=V4iKq-dTYDQgd6bqMpgehSVr=CfOfAs7Y+EdGzt8hwow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V4iKq-dTYDQgd6bqMpgehSVr=CfOfAs7Y+EdGzt8hwow@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.52 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: windriver.com]
 -0.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hiFYK-004fK4-FO
Subject: Re: [Kgdb-bugreport] Entering kdb/kgdb at panic time before CPUs
 are killed?
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
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Sat, Jun 29, 2019 at 08:23:51AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 28, 2019 at 8:17 PM Jason Wessel <jason.wessel@windriver.com> wrote:
> >
> > On 6/28/19 4:17 PM, Doug Anderson wrote:
> > > I was trying to debug a crash using kdb / kgdb today and ran into a
> > > problem I've seen before: being unable to get kdb / kgdb to debug one
> > > of important tasks on the system.  Specifically I was unable to use
> > > kdb to point to the CPU running the task and there was no shadow CPU
> > > in kgdb.  Running "ps" in kdb showed:
> > >
> > > 0xecc9bd80      111        2  1    0   R  0xecc9c488  kworker/0:1H
> > >    Error: no saved data for this cpu
> > >
> > > I decided to dig a little bit more this time and found that the
> > > problem appears to be that "panic" stops all CPUs before calling the
> > > panic notifier and then kdb / kgdb shows the CPU as dead.
> > >
> > > I wondered if anyone has given any thought to this problem before.
> > > Obviously a "fix" is to add a special case for kdb / kgdb in the
> > > panic() function before the CPUs die, but presumably that will be met
> > > with resistance.  I'm curious if anyone else has good ideas.
> > >
> > >
> > > -Doug
> >
> >
> > You could set a breakpoint at panic(), instead of waiting for the notifier.
> 
> Yup, I've got that as a workaround.  I was wondering more about if
> anyone had brilliant ideas about a solution that might be able to land
> upstream.  I guess maybe the best bet is to just try sending up a
> patch to add a special case to panic() and see what falls out.  ;-)

Probably, yes.

There's not a lot of love for notifiers these days so there would be
some grounds for optimism here!


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
