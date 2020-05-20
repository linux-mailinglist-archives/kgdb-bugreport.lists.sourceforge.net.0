Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C061DB8FF
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 20 May 2020 18:09:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jbRHF-0000BN-HA
	for lists+kgdb-bugreport@lfdr.de; Wed, 20 May 2020 16:09:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jbRHE-0000BA-8q
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 16:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b0xYWh+w/F4qTSH0QTclL7MS2e+5mKVzQgF0NwX1VdA=; b=FSwn05zEhTWwa3CBXwG1XNMZrP
 FJDzDXW4LGVB1pf+oL2x3aCLHaWbe7l46zdfQnXE/l2tbZeqVTQ57uOhB0FpkyC3wJp4PyxobKpPb
 spSewjB4wikB7b9I7evMISIN1wJPNxv4Dxg/H8h3AT8Dx3jdnp+Mo+uMNJpgchF6Nib0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b0xYWh+w/F4qTSH0QTclL7MS2e+5mKVzQgF0NwX1VdA=; b=UtsSQsqfl6ptrgfISWMZz7aApb
 UP2AexFC9WS5QTLqUxJw0j6C/FAzShl+PYeqpHs3StpSn9p96epZp5TRb2Ot9UmCo9tbgKydDSHsB
 xvcxTvd/1NadmOH446qMynuv3l4+FdCMC/ZRShdU4ebn1HHrg4YttC4Wj3yFmxhcJS10=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jbRHD-00GocH-5r
 for kgdb-bugreport@lists.sourceforge.net; Wed, 20 May 2020 16:09:04 +0000
Received: by mail-wr1-f68.google.com with SMTP id i15so3696029wrx.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 20 May 2020 09:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=b0xYWh+w/F4qTSH0QTclL7MS2e+5mKVzQgF0NwX1VdA=;
 b=xbrxSUuTV4VsNXGHpyNiBREQh4CjaWtB9BN3dY9RtRsbQ3q6Wc1c9zuirNc4ZD5/nT
 Na+uOjpDr1J/5SJkZVH7w3a/7jxWGFfeFYXRkQlbsJuSC+swTEBM7Mihk9eJ9vk8eE1F
 rmg5VkyVcsfs5z09UB0WfHUjghVCddAtVvIF73rqjLcOJB0vkmJ/hNqUIM5K9bHYtYB2
 Qk4fB9WSOL3xDfNiYR6N7lAnv/yv1Jpgq+z/7mRt5cEmMc9CjeaaX+kHeO8sPiXuI/BX
 XKbg13F2pI5vgTw1ZgCCUDSxyFh3ptYp3UEMYTYaVhykHgrjuTAfikxoac2kbplmLjth
 OYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b0xYWh+w/F4qTSH0QTclL7MS2e+5mKVzQgF0NwX1VdA=;
 b=qDTeV6yzYS5yCu0n+funoqTGRcG0+oIwsVt7blLAm/kGiyXknImUDzm4MhLjrzHvR8
 IGUmtwbZR0EmfCjToEui4QcnSXuWxmFvFgJsWEHbe19jCWuKtoa4YnFC/u/+3vz7Mmb8
 LNEXG/AeS0BpU6n0eZhWwKXGRes4twZqsxRuVDjobJ8Pacq1reLOE6D+jNqiLJ7kZmsp
 Kj3TQBRTUZ1wS1CJRlJ5KPyAVbK+lBAnxcmZdEEtZGVZODj12T8aPscXM8RkPFJT1iZ1
 aR3HFtk5/Y62UHK0U8SKuBVbANW+p5hZsQyq4G4OAZQ2I0PYUngKtdDhCGGAMmol9Ee2
 1axg==
X-Gm-Message-State: AOAM530Ur52+xwvnMF48Gztof9N15JqWaatuVBnx/rAaXJAFD4lLjRW2
 oRtpnRydIbU4+0oUBc6uGX08yQ==
X-Google-Smtp-Source: ABdhPJz93P3tc5SPc/AYro69bXA2d3D8ewi0B2Ij2Ds+zzrwsQ5omOgXlzrtQVfEBTM0udRUP66uEQ==
X-Received: by 2002:a5d:5751:: with SMTP id q17mr4842701wrw.106.1589990929733; 
 Wed, 20 May 2020 09:08:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id z11sm3297731wro.48.2020.05.20.09.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 09:08:49 -0700 (PDT)
Date: Wed, 20 May 2020 17:08:47 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200520160847.dpvut45zjd5msz6w@holly.lan>
References: <20200507161125.1.I2cce9ac66e141230c3644b8174b6c15d4e769232@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507161125.1.I2cce9ac66e141230c3644b8174b6c15d4e769232@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jbRHD-00GocH-5r
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Cleanup math with
 KDB_CMD_HISTORY_COUNT
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
Cc: kgdb-bugreport@lists.sourceforge.net, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, May 07, 2020 at 04:11:46PM -0700, Douglas Anderson wrote:
> From code inspection the math in handle_ctrl_cmd() looks super sketchy
> because it subjects -1 from cmdptr and then does a "%
> KDB_CMD_HISTORY_COUNT".  It turns out that this code works because
> "cmdptr" is unsigned and KDB_CMD_HISTORY_COUNT is a nice power of 2.
> Let's make this a little less sketchy.
> 
> This patch should be a no-op.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied, thanks!


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
