Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8409B1309
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 26 Oct 2024 01:04:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t4TM6-00078k-32
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 25 Oct 2024 23:04:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t4TM4-00078b-Na
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Oct 2024 23:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N+pu9+IFniI0vxwrFMTIumDSK37smBdwK2XEoZEbtTA=; b=EUuWdZayvt7/X+qFYje8wcQZAS
 YCDt/rBQ8GNn41+rUWux76YvVblNSBiBND5tX1OyK4QlNW/A7lr7klO7NasxoG8Ps/KWNxqg1uwZR
 YZnsQMo3NxsykoLKfEJ9Iu7rkK8hHcYDUfMJcufxru4TJEl1NSpjaBdM6KJqTIf/QNbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N+pu9+IFniI0vxwrFMTIumDSK37smBdwK2XEoZEbtTA=; b=EMvrd/ngJH7xPVTlH+lPvp3b7b
 mKfK10fWdO+44kVcAKlMOX5g9WxOcjmze3TX4wzY8+pT6zABa+TM2koDOMjfEEoUXjVA9BHljpDF3
 B9kA0yv8gBzOEKF+XyGMzfptjonJ33VxnQ9gl2nmS7pH/ZPiU/af90DO2UyYO+Qg6G4w=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t4TM4-0002T9-N2 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 25 Oct 2024 23:04:29 +0000
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5cb74434bc5so3403958a12.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2024 16:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729897457; x=1730502257;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N+pu9+IFniI0vxwrFMTIumDSK37smBdwK2XEoZEbtTA=;
 b=EdMf00txUc6OCZXWSiUUcnyJm8nzTWzG2EpePHhCnNZM+xTqwQObpo0tCIRVMHc22q
 eynyhio9NSF3hkUoubGbkCWbwiYsactPZDSOH6NLSd5Y/teyHA5IXK8bmr7IHaE5f+72
 vGrOuQJ0lYB5T54MDg3xKnSVFdwXqii8Mipog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729897457; x=1730502257;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N+pu9+IFniI0vxwrFMTIumDSK37smBdwK2XEoZEbtTA=;
 b=QCXvPBQGe1bpm1RKUd0V1vZJ8ncFjun7x7+u/i6weYfCBBIKj5uf6s43MGhOlIgmrq
 2109En3PFZSEKkeAiAoCq4TaF7CmoucVoiWi8/X03+A1H7R3TB+EYH4E427xmCg3wfAP
 zkPbiRq+ERdWNK/kE10I6bJTgqegOujP6jAIJamNolwH9yhqpuCT2a7ms/NY3ymBn07C
 J7thCesc5d9aO52qyabeXcrYqsLrWsSIMYks5qXYn90xHml0RiLjwBS9NlGmph2r57CW
 dZosFMru5mDJa58VJgwu/PwVb0IezByobKc2yqUOs/B/jkPOadO7bxGQZL46MFbVFML8
 6F5A==
X-Gm-Message-State: AOJu0YzLcUqw7e5yoL1CCLHFXWxbTsvOIV1qOlumJzh1qFJX8SyR6ANe
 jHTtzVD68k2tght4dpm9SXi/uO9bHWRrmM//YSn69Tdu+Y0Ni9cAu3lH1OYF6fweqjqV9LvcGVh
 Dzw==
X-Google-Smtp-Source: AGHT+IE9PAC6qkU/qno9ptMvwb/RxdKrmDDdknOowIlpl0zAluhdcZc3JiIiVKbPrhlw6/wtVcDCrw==
X-Received: by 2002:a05:6512:1384:b0:536:a4e1:5fa2 with SMTP id
 2adb3069b0e04-53b348de8c1mr384127e87.26.1729895513467; 
 Fri, 25 Oct 2024 15:31:53 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a7efsm328543e87.56.2024.10.25.15.31.51
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 15:31:52 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb3110b964so21316741fa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2024 15:31:51 -0700 (PDT)
X-Received: by 2002:a2e:612:0:b0:2fa:d4ef:f222 with SMTP id
 38308e7fff4ca-2fcbe0a8fa2mr2908991fa.38.1729895511516; Fri, 25 Oct 2024
 15:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241021211724.GC835676@lichtman.org>
In-Reply-To: <20241021211724.GC835676@lichtman.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 15:31:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+sGVF91WFDpB9cdXboCnL1NX6nZ4z2qE_ctYqZ0sNkw@mail.gmail.com>
Message-ID: <CAD=FV=X+sGVF91WFDpB9cdXboCnL1NX6nZ4z2qE_ctYqZ0sNkw@mail.gmail.com>
To: Nir Lichtman <nir@lichtman.org>
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Mon, Oct 21, 2024 at 2:17 PM Nir Lichtman <nir@lichtman.org>
    wrote: > > The function simple_strtoul performs no error checking in scenarios
    > where the input value overflows the intended output v [...] 
 
 Content analysis details:   (-2.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.49 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4TM4-0002T9-N2
Subject: Re: [Kgdb-bugreport] [PATCH v2 2/2] trace: kdb: Replace
 simple_strtoul with kstrtoul in kdb_ftdump
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
Cc: daniel.thompson@linaro.org, kgdb-bugreport@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCAyOjE34oCvUE0gTmlyIExpY2h0bWFuIDxuaXJA
bGljaHRtYW4ub3JnPiB3cm90ZToKPgo+IFRoZSBmdW5jdGlvbiBzaW1wbGVfc3RydG91bCBwZXJm
b3JtcyBubyBlcnJvciBjaGVja2luZyBpbiBzY2VuYXJpb3MKPiB3aGVyZSB0aGUgaW5wdXQgdmFs
dWUgb3ZlcmZsb3dzIHRoZSBpbnRlbmRlZCBvdXRwdXQgdmFyaWFibGUuCj4gVGhpcyByZXN1bHRz
IGluIHRoaXMgZnVuY3Rpb24gc3VjY2Vzc2Z1bGx5IHJldHVybmluZywgZXZlbiB3aGVuIHRoZQo+
IG91dHB1dCBkb2VzIG5vdCBtYXRjaCB0aGUgaW5wdXQgc3RyaW5nIChha2EgdGhlIGZ1bmN0aW9u
IHJldHVybnMKPiBzdWNjZXNzZnVsbHkgZXZlbiB3aGVuIHRoZSByZXN1bHQgaXMgd3JvbmcpLgo+
Cj4gT3IgYXMgaXQgd2FzIG1lbnRpb25lZCBbMV0sICIuLi5zaW1wbGVfc3RydG9sKCksIHNpbXBs
ZV9zdHJ0b2xsKCksCj4gc2ltcGxlX3N0cnRvdWwoKSwgYW5kIHNpbXBsZV9zdHJ0b3VsbCgpIGZ1
bmN0aW9ucyBleHBsaWNpdGx5IGlnbm9yZQo+IG92ZXJmbG93cywgd2hpY2ggbWF5IGxlYWQgdG8g
dW5leHBlY3RlZCByZXN1bHRzIGluIGNhbGxlcnMuIgo+IEhlbmNlLCB0aGUgdXNlIG9mIHRob3Nl
IGZ1bmN0aW9ucyBpcyBkaXNjb3VyYWdlZC4KPgo+IFRoaXMgcGF0Y2ggcmVwbGFjZXMgYWxsIHVz
ZXMgb2YgdGhlIHNpbXBsZV9zdHJ0b3VsIHdpdGggdGhlIHNhZmVyCj4gYWx0ZXJuYXRpdmVzIGtz
dHJ0b2ludCBhbmQga3N0cnRvbC4KPgo+IFsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9o
dG1sL2xhdGVzdC9wcm9jZXNzL2RlcHJlY2F0ZWQuaHRtbCNzaW1wbGUtc3RydG9sLXNpbXBsZS1z
dHJ0b2xsLXNpbXBsZS1zdHJ0b3VsLXNpbXBsZS1zdHJ0b3VsbAo+Cj4gU2lnbmVkLW9mZi1ieTog
WXVyYW4gUGVyZWlyYSA8eXVyYW4ucGVyZWlyYUBob3RtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBOaXIgTGljaHRtYW4gPG5pckBsaWNodG1hbi5vcmc+CgpJIGhhdmUgdGhlIHNhbWUgY29tbWVu
dHMgYXMgcGF0Y2ggIzEgYWJvdXQgYXV0aG9yc2hpcCBhbmQgbm90aW5nIHdoYXQKeW91IGNoYW5n
ZWQuCgoKPiAtLS0KPiAga2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jIHwgMTUgKysrKysrLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jIGIva2VybmVsL3RyYWNlL3Ry
YWNlX2tkYi5jCj4gaW5kZXggNTk4NTdhMWVlNDRjLi5lYWRkYTZlMDU1MjYgMTAwNjQ0Cj4gLS0t
IGEva2VybmVsL3RyYWNlL3RyYWNlX2tkYi5jCj4gKysrIGIva2VybmVsL3RyYWNlL3RyYWNlX2tk
Yi5jCj4gQEAgLTk2LDIzICs5NiwyMCBAQCBzdGF0aWMgaW50IGtkYl9mdGR1bXAoaW50IGFyZ2Ms
IGNvbnN0IGNoYXIgKiphcmd2KQo+ICB7Cj4gICAgICAgICBpbnQgc2tpcF9lbnRyaWVzID0gMDsK
PiAgICAgICAgIGxvbmcgY3B1X2ZpbGU7Cj4gLSAgICAgICBjaGFyICpjcDsKPiArICAgICAgIGlu
dCBlcnI7Cj4gICAgICAgICBpbnQgY250Owo+ICAgICAgICAgaW50IGNwdTsKPgo+ICAgICAgICAg
aWYgKGFyZ2MgPiAyKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gS0RCX0FSR0NPVU5UOwo+Cj4g
LSAgICAgICBpZiAoYXJnYykgewo+IC0gICAgICAgICAgICAgICBza2lwX2VudHJpZXMgPSBzaW1w
bGVfc3RydG9sKGFyZ3ZbMV0sICZjcCwgMCk7Cj4gLSAgICAgICAgICAgICAgIGlmICgqY3ApCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgc2tpcF9lbnRyaWVzID0gMDsKPiAtICAgICAgIH0KPiAr
ICAgICAgIGlmIChhcmdjICYmIGtzdHJ0b2ludChhcmd2WzFdLCAwLCAmc2tpcF9lbnRyaWVzKSkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIEtEQl9CQURJTlQ7Cj4KPiAgICAgICAgIGlmIChhcmdj
ID09IDIpIHsKPiAtICAgICAgICAgICAgICAgY3B1X2ZpbGUgPSBzaW1wbGVfc3RydG9sKGFyZ3Zb
Ml0sICZjcCwgMCk7Cj4gLSAgICAgICAgICAgICAgIGlmICgqY3AgfHwgY3B1X2ZpbGUgPj0gTlJf
Q1BVUyB8fCBjcHVfZmlsZSA8IDAgfHwKPiAtICAgICAgICAgICAgICAgICAgICFjcHVfb25saW5l
KGNwdV9maWxlKSkKPiArICAgICAgICAgICAgICAgZXJyID0ga3N0cnRvbChhcmd2WzJdLCAwLCAm
Y3B1X2ZpbGUpOwo+ICsgICAgICAgICAgICAgICBpZiAoZXJyIHx8IGNwdV9maWxlID49IE5SX0NQ
VVMgfHwgY3B1X2ZpbGUgPCAwIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIWNwdV9vbmxp
bmUoY3B1X2ZpbGUpKQoKRldJVywgdGhpcyBpcyBzdGlsbCBjaGFuZ2luZyB0aGUgaW5kZW50YXRp
b24gb2YgdGhlIHNlY29uZCBsaW5lIGluIGEKd2F5IHRoYXQgbWFrZXMgaXQgd29yc2UgbGlzdCBs
aWtlIHYxIGRpZCBbMV0uIDotUCBUaGUgIiEiIGluICIhY3B1XyIKc2hvdWxkIGxpbmUgdXAgcmln
aHQgdW5kZXIgdGhlICJlIiBpbiAiZXJyIi4KClRoYXQncyBhIHByZXR0eSB0aW55IG5pdCwgc28g
SSdtIE9LIHdpdGg6CgpSZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPgoKV2hlbiBzZW5kaW5nIHYzIHlvdSdkIHdhbnQgdG8ga2VlcCBNYXNhbWkncyBB
Y2tlZC1ieSB0YWcgYW5kIG15ClJldmlld2VkLWJ5IHRhZy4gVGhleSBzaG91bGQgZ28ganVzdCBh
Ym92ZSB5b3VyIFNpZ25lZC1vZmYtYnkgdGFnLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1
Z3JlcG9ydEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8va2dkYi1idWdyZXBvcnQK
