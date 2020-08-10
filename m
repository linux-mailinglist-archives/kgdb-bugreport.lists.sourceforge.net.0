Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83312241270
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 10 Aug 2020 23:33:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1k5FPg-0005pl-Ai
	for lists+kgdb-bugreport@lfdr.de; Mon, 10 Aug 2020 21:33:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1k5FPe-0005pY-7i
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 Aug 2020 21:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hXASfmqoUl3o8zN6MXHewh7vS0xl4tHelH9X4EiAPTg=; b=dYMdmsYOboMp/0uS69Dc/9u6zp
 2gc6diTIXkmF3cXY/j4oQQZSapDXs7J1ZtrAvUocOVdsiT1/PzRiSppdWQq+Ebea+VhlT2T4OHVTq
 C8TMLVmlHDI9gXNseAoTYNyYLiLbfxMw9urDCpqHFgMwYFXehYL7vKJYYt/KzZjv8vrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hXASfmqoUl3o8zN6MXHewh7vS0xl4tHelH9X4EiAPTg=; b=k3DXojSD0IiM48b2b1ZIpn2JYf
 RmV80t/LNN9JD38zf0cbZdgLJNOzteduH3ZhBpIjf9T4I2j5oQlYLHAaUZNSTFVucIo5rxnKkkLe4
 RCL3heqkF2tCy/lvof2LbFecLu9WJywZ+t+Zv5VNLKIYXU0yFhHG0Ety/ZxQEMRE/+nE=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5FPa-006Dmf-KW
 for kgdb-bugreport@lists.sourceforge.net; Mon, 10 Aug 2020 21:32:58 +0000
Received: by mail-pj1-f67.google.com with SMTP id mt12so752846pjb.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 10 Aug 2020 14:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hXASfmqoUl3o8zN6MXHewh7vS0xl4tHelH9X4EiAPTg=;
 b=iPtviNy9RShsJFpYsrUv4+ItQVmKuSBZAs+NqagKy930sVZjRWUTkUxZacbU9KMJ9x
 CldemxPziILP/Xm4LSWsQAELyezydtv5sifKft2/LSVyc4/58JoPG6k5BIxVVvNHjwp4
 uWlD8l3v+F7WMtJqUFLtCaENMe7W0y16GGvzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hXASfmqoUl3o8zN6MXHewh7vS0xl4tHelH9X4EiAPTg=;
 b=Ixj2Eh6Dpb1x3dWr7r2wWTNgofhyfcAdeKmEBw47cI1Vlza4tNuV+FhWj9sPXNbQzc
 ao47KWpp6S+RjSVTiyvApk9dhfbpGkH7K9GvU0zI2wOqXpcCoCJdfR2lljrK3XFtFE8J
 C1pk98AeUIiUQRaIIwec5yHTfbUZvbhsHJXc4mv6z0maDpcX5K+cS0vxQ1vh1vNu1mLI
 HX27OWprC3jTF29fYkKWJqFTjIQbySO/noxbuTnkhzrDFHauJyzC6siuzoLpbx7XvXwx
 lURwIe5wOw8Yk5Cw+DXjjGQyGZznZxDGZOg9aULGp3Woi0ZAl4YhEMn+r+GPHs5dqkOx
 41jg==
X-Gm-Message-State: AOAM532MowdS4zUeNaAqFJKEpuUFreyEi5cCYtsngRGGCSJuhRygbbPb
 h7SOWA9YGznBHiK4dZ2nuGTGq3TAN5A=
X-Google-Smtp-Source: ABdhPJyGtAA1Ky0C6Oh+uX6aohRnUh1FOaQRV2rKSgTCn109u7ca1F4CJ+4knrgUz5mKGYtCdhAMiQ==
X-Received: by 2002:ac5:cb6e:: with SMTP id l14mr22111768vkn.72.1597094784978; 
 Mon, 10 Aug 2020 14:26:24 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49])
 by smtp.gmail.com with ESMTPSA id a82sm5656189vke.39.2020.08.10.14.26.23
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 14:26:24 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id r7so4963578vsq.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 10 Aug 2020 14:26:23 -0700 (PDT)
X-Received: by 2002:a67:2c4f:: with SMTP id s76mr20074899vss.213.1597094783404; 
 Mon, 10 Aug 2020 14:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
 <adaef6bf-7887-feea-fedf-d3bc5566bb9d@codeaurora.org>
In-Reply-To: <adaef6bf-7887-feea-fedf-d3bc5566bb9d@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Aug 2020 14:26:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8tNpmkSrEjXgKPKsBOZfjt8aVQe47gzi5FvPqdOQN+A@mail.gmail.com>
Message-ID: <CAD=FV=X8tNpmkSrEjXgKPKsBOZfjt8aVQe47gzi5FvPqdOQN+A@mail.gmail.com>
To: Akash Asthana <akashast@codeaurora.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1k5FPa-006Dmf-KW
Subject: Re: [Kgdb-bugreport] [PATCH] serial: qcom_geni_serial: Fix recent
 kdb hang
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
 Mukesh Savaliya <msavaliy@codeaurora.org>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Mon, Aug 10, 2020 at 5:32 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Doug,
>
> On 8/7/2020 10:49 AM, Douglas Anderson wrote:
> > The commit e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work
> > even if UART isn't console") worked pretty well and I've been doing a
> > lot of debugging with it.  However, recently I typed "dmesg" in kdb
> > and then held the space key down to scroll through the pagination.  My
> > device hung.  This was repeatable and I found that it was introduced
> > with the aforementioned commit.
> >
> > It turns out that there are some strange boundary cases in geni where
> > in some weird situations it will signal RX_LAST but then will put 0 in
> > RX_LAST_BYTE.  This means that the entire last FIFO entry is valid.
>
> IMO that means we received a word in RX_FIFO and it is the last word
> hence RX_LAST bit is set.

What you say would make logical sense, but it's not how I have
observed geni to work.  See below.


> RX_LAST_BYTE is 0 means none of the bytes are valid in the last word.

This would imply that qcom_geni_serial_handle_rx() is also broken
though, wouldn't it?  Specifically imagine that WORD_CNT is 1 and
RX_LAST is set and RX_LAST_BYTE_VALID is true.  Here's the logic from
that function:

  total_bytes = BYTES_PER_FIFO_WORD * (word_cnt - 1);
  if (last_word_partial && last_word_byte_cnt)
    total_bytes += last_word_byte_cnt;
  else
    total_bytes += BYTES_PER_FIFO_WORD;
  port->handle_rx(uport, total_bytes, drop);

As you can see that logic will set "total_bytes" to 4 in the case I'm
talking about.


> In such scenario we should just read RX_FIFO buffer (to empty it),
> discard the word and return NO_POLL_CHAR. Something like below.
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------
>
>                  else
>                          private_data->poll_cached_bytes_cnt = 4;
>
>                  private_data->poll_cached_bytes =
>                          readl(uport->membase + SE_GENI_RX_FIFOn);
>          }
>
> +        if (!private_data->poll_cached_bytes_cnt)
> +              return NO_POLL_CHAR;
>          private_data->poll_cached_bytes_cnt--;
>          ret = private_data->poll_cached_bytes & 0xff;
> -------------------------------------------------------------------------------------------------------------------------------------------------------------
>
> Please let me know whether above code helps.

Your code will avoid the hang.  Yes.  ...but it will drop bytes.  I
devised a quick-n-dirty test.  Here's a test of your code:

https://crrev.com/c/2346886

...and here's a test of my code:

https://crrev.com/c/2346884

I had to keep a buffer around since it's hard to debug the serial
driver.  In both cases I put "DOUG" into the buffer when I detect this
case.  If my theory about how geni worked was wrong then we should
expect to see some garbage in the buffer right after the DOUG, right?
...but my code gets the alphabet in nice sequence.  Your code drops 4
bytes.


NOTE: while poking around with the above two test patches I found it
was pretty easy to get geni to drop bytes / hit overflow cases and
also to insert bogus 0 bytes in the stream (I believe these are
related).  I was able to reproduce this:
* With ${SUBJECT} patch in place.
* With your proposed patch.
* With the recent "geni" patches reverted (in other words back to 1
byte per FIFO entry).

It's not terribly surprising that we're overflowing since I believe
kgdb isn't too keen to read characters at the same time it's writing.
That doesn't explain the weird 0-bytes that geni seemed to be
inserting, but at least it would explain the overflows.  However, even
after I fixed this I _still_ was getting problems.  Specifically geni
seemed to be hiding bytes from me until it was too late.  I put
logging in and would see this:

1 word in FIFO - wxyz
1 word in FIFO (last set, last FIFO has 1 byte) - \n
Check again, still 0 bytes in FIFO
Suddenly 16 bytes are in FIFO and S_RX_FIFO_WR_ERR_EN is set.

I spent a whole bunch of time poking at this and couldn't find any
sort of workaround.  Presumably geni is taking some time between me
reading the last word out of the FIFO from the "previous" packet and
then transitioning to the new packet.  I found a lot of references to
this process in the hardware register description (see GENI_CFG_REG69,
for instance), but I couldn't manage to make the kick to happen any
faster.  Presumably this isn't a problem for things like Bluetooth
since flow control saves them.  ...and I guess this isn't a problem in
practice because we usually _send_ a lot of data to the host for
console/kgdb and it's only the host => DUT path that has problems.


> I am not sure about what all scenario can leads to this behavior from
> hardware, I will try to get an answer from hardware team.
>
> Any error bit was set for SE_GENI_S_IRQ_STATUS & SE_GENI_M_IRQ_STATUS
> registers?

As per above I can see overflows in my test case and geni seems to be
behaving pretty badly.  If you have ideas on how to fix this I'd love
it.  However, it still seems like my patch is right because (at least
in the cases I tested) it avoids dropping bytes in some cases.  It
also matches how qcom_geni_serial_handle_rx() works and if that was
broken we'd have noticed by now.


> I guess the hang was seen because *poll_cached_bytes_cnt* is unsigned
> int and it's value was 0, when it's decremented by 1 it's value become
> '4294967295' (very large) and dummy RX (0x00) would happen that
>
> many times before reading any actual RX transfers/bytes.

Right.  That would be why it was hanging.


-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
