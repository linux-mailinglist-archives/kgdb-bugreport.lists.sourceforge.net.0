Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A137C71A
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 31 Jul 2019 17:44:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1hsqmd-0000Jq-Kr
	for lists+kgdb-bugreport@lfdr.de; Wed, 31 Jul 2019 15:44:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1hsqmc-0000Jj-Li
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 15:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsX4XfgYHIx0Ks8iO8OgXUq5IkTUq6aae68f1+yjlQI=; b=INl9xZRvx+C/ufIXH4owcws+fp
 yqlJs7k+RLN9/+JbEGTZn+HtKUQSSJXeDT+Qx6VI0VYJeX00ofRHBTys0Km/5nxDnDSUXD2qODC1T
 q56NBiyIhvc+Gkjn1368AK6Sbu/xe3xfe1bGjZkb8qSDceSdLZwdYbOkuTFeOpMFDTU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsX4XfgYHIx0Ks8iO8OgXUq5IkTUq6aae68f1+yjlQI=; b=Cwl6qLUF8VC2z4aUibt8zmjAG1
 YZRRUptPkLDNA5sL2OnLU7ZCbRjS/fMmRq5QpVu3nh3V1g//VKnDGCe7RnTz17kH6q7UCM64i+73V
 xpEWLxNoVFhUpWzhHHvNV0Wmo4NRfYWsCBjTFFeasEm8EAmv+OqOE7BbjIZwABtazRk4=;
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hsqma-005Oi2-Vd
 for kgdb-bugreport@lists.sourceforge.net; Wed, 31 Jul 2019 15:44:54 +0000
Received: by mail-io1-f66.google.com with SMTP id k20so137258513ios.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 31 Jul 2019 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qsX4XfgYHIx0Ks8iO8OgXUq5IkTUq6aae68f1+yjlQI=;
 b=WxvIw2iyPVeIC/iNqk7I2SIHISdvuL90JO15ijRYglvi7BlFkdCQcF6FpMSHtw9dht
 Jz34vclpuQCNmGLOzlSWm4/DhBnIeTDcgJeajGCyhjsTsICrv14fQI1J7LZ4+vJ0qeyr
 araBDazAnWOXtK000jiQtp6ObIomOwJ8NRqJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qsX4XfgYHIx0Ks8iO8OgXUq5IkTUq6aae68f1+yjlQI=;
 b=tIsaSdpxmMhIeChUkFcKbO6rhA/Ha3TjKD6i34vsZTujtbwtEikz31Luh50QPjdssQ
 9L/o3rKxIyzgA2WpgynEMoy+zRA0P6y4y0foidmDe9ZZ+B0n2BBgySW9d0+pHlbnWpp5
 9hUCafxRohjwOntK4YhhmmNNRVtnDWNODSHQ8KMAtbk5oD0yJ1NpzRxMJy8GqTFNe7kN
 MApTk3ILDA8Ht2Udcx33iblPid48CkfMdb6IQkJOe6aUsU7oIulq6j9jcV5eJvzogVxY
 V+20P8NdWB2qspI6eK9WtMVwjMQb4v6AmXCpmDgcXqo7dFnTPv/NZjzvbTPNs4HpqyYG
 LObg==
X-Gm-Message-State: APjAAAUi+N6273VWcV9uyVNkaUdLixmD3DAR5iMI+VdjOsI7DEGfDcVY
 vtfbzB3YqKByCBqTcK5dzgPKiSNk6WQ=
X-Google-Smtp-Source: APXvYqyz+4qWzPRDpQwZcnvkCYQG8NMg7r7qJ5YTp/GnVqbpSDyJeAbYlf34eQdIkLqNKcnFmLJGrQ==
X-Received: by 2002:a5e:924d:: with SMTP id z13mr26506704iop.247.1564587886981; 
 Wed, 31 Jul 2019 08:44:46 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id m4sm58342235iok.68.2019.07.31.08.44.46
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:44:46 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id f4so137312879ioh.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 31 Jul 2019 08:44:46 -0700 (PDT)
X-Received: by 2002:a5d:885a:: with SMTP id t26mr4018292ios.218.1564587885757; 
 Wed, 31 Jul 2019 08:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190730234052.148744-1-dianders@chromium.org>
 <34bbd6b5-2e37-159a-b75b-36a6be11c506@siemens.com>
In-Reply-To: <34bbd6b5-2e37-159a-b75b-36a6be11c506@siemens.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 Jul 2019 08:44:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uqa79UyFFj6zrr_B=rrwfmJAFLLatf8wQ73V70U-frvA@mail.gmail.com>
Message-ID: <CAD=FV=Uqa79UyFFj6zrr_B=rrwfmJAFLLatf8wQ73V70U-frvA@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.66 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hsqma-005Oi2-Vd
Subject: Re: [Kgdb-bugreport] [PATCH] scripts/gdb: Handle split debug
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, Kieran Bingham <kbingham@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Wed, Jul 31, 2019 at 7:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 31.07.19 01:40, Douglas Anderson wrote:
> > Some systems (like Chrome OS) may use "split debug" for kernel
> > modules.  That means that the debug symbols are in a different file
> > than the main elf file.  Let's handle that by also searching for debug
> > symbols that end in ".ko.debug".
>
> Is this split-up depending on additional kernel patches, is this already
> possible with mainline, or is this purely a packaging topic? Wondering because
> of testability in case it's downstream-only.

It is a packaging topic.  You can take a normal elf file and split the
debug out of it using objcopy.  Try "man objcopy" and then take a look
at the "--only-keep-debug" option.  It'll give you a whole recipe for
doing splitdebug.  The suffix used for the debug symbols is arbitrary.
If people have other another suffix besides ".ko.debug" then we could
presumably support that too...

For portage (which is the packaging system used by Chrome OS) split
debug is supported by default (and the suffix is .ko.debug).  ...and
so in Chrome OS we always get the installed elf files stripped and
then the symbols stashed away.

At the moment we don't actually use the normal portage magic to do
this for the kernel though since it affects our ability to get good
stack dumps in the kernel.  We instead pass a script as "strip" [1].


[1] https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/refs/heads/master/eclass/cros-kernel/strip_splitdebug


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
