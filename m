Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A37293236DD
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Feb 2021 06:29:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lEmk7-0006Hy-As
	for lists+kgdb-bugreport@lfdr.de; Wed, 24 Feb 2021 05:29:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1lEmk6-0006Hq-8w
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 05:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/ihSCYjkGq0mVDgKW7XRfTj3HFK99zD03o5XQ3n2So=; b=NqRAXpS9wPHKc5ZTVa2Tgjl5ML
 VQO0gz9rSDUOn8yIRy6VzqCmUn529OB3QzKrLFlgnchAeEBaSFlSyhx0oyo4GiKSSBzo7ByvX5+4L
 pA6pFj5Sv6t/MxZttWr2UOZSLH3qECCR9mBm5TtkgBl3xUM0uH51iWz9wIfYIo0nL9Vc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g/ihSCYjkGq0mVDgKW7XRfTj3HFK99zD03o5XQ3n2So=; b=M0zCjbd6PAWWXSFp9IDCnnILwT
 gXdKTGiljbrTgxme3e4Ojss8hrrr2BSMbReSOp50y3jpprPr0wa45nW8meWsJZYc1UGAAtf7CulLG
 AvdDPb1FM68gaZOvEUz2idHvIqdllmIQvr18qSO7hY+fyzx7wMqHwz48rujnX2wdFtQE=;
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lEmjz-0000gV-9M
 for kgdb-bugreport@lists.sourceforge.net; Wed, 24 Feb 2021 05:29:46 +0000
Received: by mail-lj1-f178.google.com with SMTP id c8so963983ljd.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 23 Feb 2021 21:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g/ihSCYjkGq0mVDgKW7XRfTj3HFK99zD03o5XQ3n2So=;
 b=OVVAlme8EN5RSBhZYiTwJnY7D3RqoRKvhT8/weafREU78rdsK2RV2qvpeU0De8lemE
 n3dyapfBvveZpqbutJnF5uA/el7Z0hs4Yarj4gR9am0EbYqgqLG6/i5c3iWFjXPPHn08
 FbBe0KJKGXr3yMDoIRk4lXbnDsZc7oI4Mmcbgu5ZCaqFVmQSvHCWCsGseOKisFTYeog5
 L/Q7ibaiyK0Cpojx87l8lqqlEuV+ux77D2Qrx/WkqKxADFX1QT8kIXzbNgt345u5zlL8
 JhtXlUnLZtW+0UJk2o9LGuqIURvbpxdbB2I+EFJzaDpIyYMRJSQloJPlOL3Y3iEidBdi
 bLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/ihSCYjkGq0mVDgKW7XRfTj3HFK99zD03o5XQ3n2So=;
 b=gW+SI828YaijCyzkHR9gZatS9W+mGfq61xPMpd0GomVOIsjZPN/xG07bdOUmS1PdOk
 JdUuOI3RHdC79kq7OwvhW7oNCdLiI+9W3EkYZwguppBuuNI4kiAjAjyykxuUf0rhAaUJ
 TalJkRlwejz9+tylLjgC3FBvQsRDifWqT40fgw7Hu292KrBpATvlvjcFdfpgJXb5jQZh
 DiFyEUMJOlo85fJUCbEkuiUcR9wOzksAambbyH6mIMtBgn+pgDZPraGb0gGYuAPaNOnl
 EQa7vIr2+ezk/ODHdsStOv3Uy2Cv2Turm+XQAgn6CNh/agW12TPtKXGsInU0tPfVyRev
 IYMQ==
X-Gm-Message-State: AOAM531btOYPDUst1hGTMorCKEEg2vvrplPyAgcH5ydAiyR8B513aq4D
 UKXK72rRRo9pit+/m8gKirS/H+cDbAavX1O/nwfAow==
X-Google-Smtp-Source: ABdhPJwZ879rp2aYmE038GsVn/7cREy2wSJR6ciTugHnAFa77EKK8b8teOcBV8CIfbXReKEHdsDpA/F7DDULF8QdaKs=
X-Received: by 2002:a2e:99cb:: with SMTP id l11mr9838399ljj.343.1614144572582; 
 Tue, 23 Feb 2021 21:29:32 -0800 (PST)
MIME-Version: 1.0
References: <1613721694-16418-1-git-send-email-sumit.garg@linaro.org>
 <CAD=FV=X1hsFf08J5JNifzFGw=1ikmXj2mp6K=KMOAzCYDWKZUw@mail.gmail.com>
 <CAFA6WYO0PkbpXUJp9jayb71LsydpnHfLFyc21bHotC1dLJ7Dhg@mail.gmail.com>
 <20210223125447.7penkj42hd6ito4i@maple.lan>
In-Reply-To: <20210223125447.7penkj42hd6ito4i@maple.lan>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 24 Feb 2021 10:59:20 +0530
Message-ID: <CAFA6WYO9TRyavbTgXMZkHi1YoffrnV8+HxCg-WA=Qf2=-Bcw5Q@mail.gmail.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.178 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEmjz-0000gV-9M
Subject: Re: [Kgdb-bugreport] [PATCH] kernel: debug: Handle breakpoints in
 kernel .init.text section
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
Cc: Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>, qy15sije@cip.cs.fau.de,
 Jason Wessel <jason.wessel@windriver.com>, stefan.saecherl@fau.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, 23 Feb 2021 at 18:24, Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Feb 23, 2021 at 02:33:50PM +0530, Sumit Garg wrote:
> > Thanks Doug for your comments.
> >
> > On Tue, 23 Feb 2021 at 05:28, Doug Anderson <dianders@chromium.org> wrote:
> > > > To be clear there is still a very small window between call to
> > > > free_initmem() and system_state = SYSTEM_RUNNING which can lead to
> > > > removal of freed .init.text section breakpoints but I think we can live
> > > > with that.
> > >
> > > I know kdb / kgdb tries to keep out of the way of the rest of the
> > > system and so there's a bias to just try to infer the state of the
> > > rest of the system, but this feels like a halfway solution when really
> > > a cleaner solution really wouldn't intrude much on the main kernel.
> > > It seems like it's at least worth asking if we can just add a call
> > > like kgdb_drop_init_breakpoints() into main.c.  Then we don't have to
> > > try to guess the state...
>
> Just for the record, +1. This would be a better approach.
>
>
> > Sounds reasonable, will post RFC for this. I think we should call such
> > function as kgdb_free_init_mem() in similar way as:
> > - kprobe_free_init_mem()
> > - ftrace_free_init_mem()
>
> As is matching the names...
>
>
> > @@ -378,8 +382,13 @@ int dbg_deactivate_sw_breakpoints(void)
> >         int i;
> >
> >         for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
> > -               if (kgdb_break[i].state != BP_ACTIVE)
> > +               if (kgdb_break[i].state < BP_ACTIVE_INIT)
> > +                       continue;
> > +               if (system_state >= SYSTEM_RUNNING &&
> > +                   kgdb_break[i].state == BP_ACTIVE_INIT) {
> > +                       kgdb_break[i].state = BP_UNDEFINED;
> >                         continue;
> > +               }
> >                 error = kgdb_arch_remove_breakpoint(&kgdb_break[i]);
> >                 if (error) {
> >                         pr_info("BP remove failed: %lx\n",
> >
> > >
> > > > +                       kgdb_break[i].state = BP_ACTIVE;
> > > > +               else
> > > > +                       kgdb_break[i].state = BP_ACTIVE_INIT;
> > >
> > > I don't really see what the "BP_ACTIVE_INIT" state gets you.  Why not
> > > just leave it as "BP_ACTIVE" and put all the logic fully in
> > > dbg_deactivate_sw_breakpoints()?
> >
> > Please see my response above.
> >
> > [which was]
> > > "BP_ACTIVE_INIT" state is added specifically to handle this scenario
> > > as to keep track of breakpoints that actually belong to the .init.text
> > > section. And we should be able to again set breakpoints after free
> > > since below change in this patch would mark them as "BP_UNDEFINED":
>
> This answer does not say whether the BP_ACTIVE_INIT state needs to be
> per-breakpoint state or whether we can infer it from the global state.
>
> Changing the state of breakpoints in .init is a one-shot activity
> whether it is triggered explicitly (e.g. kgdb_free_init_mem) or implicitly
> (run the first time dbg_deactivate_sw_breakpoints is called with the system
> state >= running).
>
> As Doug has suggested it is quite possible to unify all the logic to
> handle .init within a single function by running that function when the
> state changes globally.
>

Ah, I see. Thanks for further clarification. Will get rid of
BP_ACTIVE_INIT state.

-Sumit

>
> Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
