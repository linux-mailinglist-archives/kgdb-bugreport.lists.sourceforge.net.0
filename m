Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 327209C2077
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Nov 2024 16:31:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t9Qxd-0003Sc-0c
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 08 Nov 2024 15:31:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1t9Qxc-0003SW-17
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 15:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LguMVM4sVGeBIk+UXhhvzkbgqAyeZTN09fcokG5c3Ts=; b=aXsbfzhhgaHa1vHD9nUi35k6cz
 XMVb0MgddXKN3pPvRQjfxfMAijAYk/vr/TMyKiwtHI/0ZyaO5H72hHjyXwPVu9bBgdfKgZTH8YJuC
 JKfUlPTF5r00Ue/e94gg7WmZBvH5inlKDNluKgIX/Pz1ooAWg+gem4mHoiZZOeshO35A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LguMVM4sVGeBIk+UXhhvzkbgqAyeZTN09fcokG5c3Ts=; b=gC2OqemtSYM9RzIyob2IGQSzCD
 jKkLthPwpjboHa1cfDfN/HqX0S05mIg5jxa7VyxtmD/F6sQeRGA3EY1/QAGfL22yOO1q15ejEyUV+
 49hv7kT0sZhOj33x+fA+xz0dQEgiAgllrAfd4GtqaK5uHndVJI6VsoSvhCq47hfvp258=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9Qxb-0000qb-BE for kgdb-bugreport@lists.sourceforge.net;
 Fri, 08 Nov 2024 15:31:43 +0000
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso2838991e87.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 07:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1731079896; x=1731684696;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LguMVM4sVGeBIk+UXhhvzkbgqAyeZTN09fcokG5c3Ts=;
 b=SQzE5GqF3qzqC3IosOTRDl0zbdcCwXePF7gH2uJRc30cR8v083VI8GVTIc1LBzLbSy
 oUUgzCD0JHF6OPhZkBdohOmsw+kLGbeKtc4ZrKyAycmM5xjvXK/8KaGKCpnKP0JwbC0q
 iMswYzpLdH43AcG69mGNZRvHSMjhQs9pVkZJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731079896; x=1731684696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LguMVM4sVGeBIk+UXhhvzkbgqAyeZTN09fcokG5c3Ts=;
 b=tgaH+BolHaGw7+PoZ9gWHYeyLWA1ENT9tfWuSM7n2+NUtLGZAdemz3O9qBiL5yfCSJ
 X5OdOov35nXjefYXBSK/JH89UGWJ9Hq6mG33halGP8rC51NvEFV5upc351m9x2YVgYmc
 4UGVcHLGZtWNbxSfFh6uZ8Bd41kZ6JMLCLCdIXsyJ+tHxNr9/RGii861g+GEvyptllXe
 Jbc4Y2ojnvYp7wSoQ0/KG7NxOSEt0miokAmyQUeWB+rT/3gjvP/jvlFkJ8wgUCW+WuHB
 wawLvx1v849ml7DXWTvqeu6za7DrQ//t8gX0jy3KPftHAB+/g+SVtkMqVvGCvF+jVtp+
 N+Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBPnwTG9V/d/5XtnDXJyGfHsF180HauB7VL3Sz1TDg1WgYNjxHM5GNEFFcuIw1BnqtNKEVT/uqUNEewq4HAQ==@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz/yOFuJ5gf2atdugUgFxfOTfuLhadwFokWc3hSR6YP72z8Etxc
 SC7vOQrfhBQ0iU579muz0W8W/2JAm21wgGO1SsmxiKyYC4oQ1XfNQDXiaCuKw0W3XXoJRhyqb/B
 dCg==
X-Google-Smtp-Source: AGHT+IHdcu4pahJsnQOPxJj7qO8V3QGRGte2IZ/Pdo7VyenTfBcwjHS1EEQ7IIkboAybVc1tCmlR6A==
X-Received: by 2002:a05:6512:238c:b0:52f:d0f0:e37e with SMTP id
 2adb3069b0e04-53d862e4fc4mr1938162e87.42.1731079895454; 
 Fri, 08 Nov 2024 07:31:35 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d82678474sm662395e87.42.2024.11.08.07.31.34
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 07:31:34 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso2611803e87.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Nov 2024 07:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWH98AKWPqOlNOBKdGuPE3f/lxXMv70L25V1CWgZQwIvwhsthnZFF49sx7cJKl5zXUBT88o/7u273Lb0peA3Q==@lists.sourceforge.net
X-Received: by 2002:a2e:a813:0:b0:2fe:fec7:8adf with SMTP id
 38308e7fff4ca-2ff2029fed5mr18554131fa.38.1731079893927; Fri, 08 Nov 2024
 07:31:33 -0800 (PST)
MIME-Version: 1.0
References: <Zy093jVKPs9gSVx2@telecaster>
 <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
 <Zy1lyACVnZK4xwuW@telecaster>
In-Reply-To: <Zy1lyACVnZK4xwuW@telecaster>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Nov 2024 07:31:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
Message-ID: <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
To: Omar Sandoval <osandov@osandov.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, On Thu, Nov 7, 2024 at 5:13 PM Omar Sandoval <osandov@osandov.com>
    wrote: > > On Thu, Nov 07, 2024 at 05:08:58PM -0800, Doug Anderson wrote:
    > > Hi, > > > > On Thu, Nov 7, 2024 at 2:23 PM Omar San [...] 
 
 Content analysis details:   (-0.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.53 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9Qxb-0000qb-BE
Subject: Re: [Kgdb-bugreport] kgdb replacing newline with CRLF in custom
 query response
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
 kgdb-bugreport@lists.sourceforge.net,
 Stephen Brennan <stephen.s.brennan@oracle.com>, Amal Raj T <amalrajt@meta.com>,
 linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBUaHUsIE5vdiA3LCAyMDI0IGF0IDU6MTPigK9QTSBPbWFyIFNhbmRvdmFsIDxvc2Fu
ZG92QG9zYW5kb3YuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDA3LCAyMDI0IGF0IDA1OjA4
OjU4UE0gLTA4MDAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiBUaHUs
IE5vdiA3LCAyMDI0IGF0IDI6MjPigK9QTSBPbWFyIFNhbmRvdmFsIDxvc2FuZG92QG9zYW5kb3Yu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgZXZlcnlvbmUsCj4gPiA+Cj4gPiA+IEFtYWwgaXMg
d29ya2luZyBvbiBhZGRpbmcgYSBjdXN0b20gcXVlcnkgcGFja2V0IHRvIGtnZGIgZm9yIGdldHRp
bmcgdGhlCj4gPiA+IGtlcm5lbCdzIHZtY29yZWluZm8uIFRoZSByYXRpb25hbGUgYW5kIGRldGFp
bHMgYXJlIGF2YWlsYWJsZSBoZXJlOgo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vb3NhbmRvdi9k
cmduL3dpa2kvR0RCLVJlbW90ZS1Qcm90b2NvbC1wcm9wb3NhbDotbGludXgudm1jb3JlaW5mby1x
dWVyeS1wYWNrZXQKPiA+ID4KPiA+ID4gdm1jb3JlaW5mbyBpcyBhYm91dCAza0IsIHNvIHdlIHdl
cmUgaG9waW5nIHRvIGF2b2lkIGhleC1lbmNvZGluZyB0aGUKPiA+ID4gcmVzcG9uc2UgYW5kIGRv
dWJsaW5nIHRoZSB0aW1lIGl0IHRha2VzIHRvIHRyYW5zbWl0IG92ZXIgYSBzbG93IHNlcmlhbAo+
ID4gPiBjb25uZWN0aW9uLiBJbnN0ZWFkLCB3ZSB3ZXJlIGhvcGluZyB0byB1c2UgdGhlIGVzY2Fw
ZWQgYmluYXJ5IGZvcm1hdCwKPiA+ID4gd2hpY2ggZXNjYXBlcyB0aGUgY2hhcmFjdGVycyAjJH0q
IGFuZCBsZWF2ZXMgb3RoZXIgYnl0ZXMgdW50b3VjaGVkLgo+ID4gPgo+ID4gPiBXZSByYW4gaW50
byBhIHByb2JsZW0sIHRob3VnaDogdm1jb3JlaW5mbyBjb250YWlucyBuZXdsaW5lIGNoYXJhY3Rl
cnMsCj4gPiA+IHdoaWNoIHRoZSBzZXJpYWwgY29yZSByZXBsYWNlcyB3aXRoIENSTEY7IHNlZSBj
b21taXQgYzdkNDRhMDJhYzYwCj4gPiA+ICgic2VyaWFsX2NvcmU6IENvbW1vbmFsaXplIGNybGYg
d2hlbiB3b3JraW5nIHcvIGEgbm9uIG9wZW4gY29uc29sZQo+ID4gPiBwb3J0IikuCj4gPgo+ID4g
RldJVywgdGhlIHByb2JsZW0gcHJlZGF0ZXMgdGhhdCBjb21taXQsIGJ1dCB0aGF0IGNvbW1pdCBh
dCBsZWFzdCBtb3ZlZAo+ID4gaXQgdG8gYmUgc29tZXBsYWNlIGNvbW1vbi4gQmVmb3JlIHRoYXQg
c29tZSBzZXJpYWwgZHJpdmVycyB3ZXJlCj4gPiBoYXJkY29kaW5nIGl0Li4uIDstKQo+ID4KPiA+
Cj4gPiA+IFRoaXMgZWZmZWN0aXZlbHkgY29ycnVwdHMgdGhlIGRhdGEgYW5kIGNhdXNlcyBhIGNo
ZWNrc3VtCj4gPiA+IG1pc21hdGNoLgo+ID4gPgo+ID4gPiBXZSdkIGxvdmUgc29tZSBpbnB1dCBv
biBob3cgdG8gd29yayBhcm91bmQgdGhpcywgZXNwZWNpYWxseSBmcm9tIHRoZQo+ID4gPiBrZ2Ri
IG1haW50YWluZXJzLiBIZXJlIGFyZSBhIGZldyBvcHRpb25zLCBpbiBkZXNjZW5kaW5nIG9yZGVy
IG9mIG15Cj4gPiA+IHByZWZlcmVuY2U6Cj4gPiA+Cj4gPiA+IDEuIERpc2FibGUgdGhlIExGIC0+
IENSTEYgcmVwbGFjZW1lbnQgd2hpbGUgc2VuZGluZyBiaW5hcnkgZGF0YS4KPiA+ID4gMi4gRXNj
YXBlIHRoZSBuZXdsaW5lcyB1c2luZyBzb21lIG90aGVyIGN1c3RvbSBzY2hlbWUuCj4gPiA+IDMu
IEdpdmUgdXAgYW5kIGhleC1lbmNvZGUgdGhlIHJlc3BvbnNlLgo+ID4KPiA+IEkgaGF2ZW4ndCB0
cmllZCBwcm90b3R5cGluZyBpdCwgYnV0IHdoYXQgYWJvdXQgbW92aW5nIHRoZSBMUiAtPiBDUkxG
Cj4gPiBjb2RlIHRvIGtkYl9tc2dfd3JpdGUoKS4gSXQgd291bGQgYmUgcmVhbGx5IGVhc3kgdG8g
ZG8gdGhpcyBpbiB0aGUKPiA+IGNhc2Ugd2hlcmUgd2UncmUgZG9pbmcgImRiZ19pb19vcHMtPndy
aXRlX2NoYXIoKSIgc2luY2Ugd2UncmUgYWxyZWFkeQo+ID4gcHJvY2Vzc2luZyBjaGFyYWN0ZXIg
YXQgYSB0aW1lLiBJdCB3b3VsZCBiZSBoYXJkZXIgdG8gZG8gdGhpcyB3aGVuCj4gPiBhbHNvIHNl
bmRpbmcgdGhlIG91dHB1dCB0byB0aGUgdmFyaW91cyBjb25zb2xlLCBidXQgbWF5IG5vdCBfdG9v
Xwo+ID4gaGFyZD8gWW91IGNvdWxkIGxvb3Agc2VhcmNoaW5nIGZvciAiXG4iIGFuZCBzZW5kIGFs
bCB0aGUgY2hhcmFjdGVycwo+ID4gYmVmb3JlIHRoZSAiXG4iLCB0aGVuIHNlbmQgYSAiXHIiLCB0
aGVuIHNlbmQgdGhlICJcbiIgYW5kIGFsbCB0aGUKPiA+IGNoYXJhY3RlcnMgdXAgdG8gdGhlIG5l
eHQgIlxuIi4KPiA+Cj4gPiBJZiB5b3UgZGlkIHRoaXMgdGhlbiB5b3UnZCBsb3NlIHRoZSAiXG4i
IHRvICJcclxuIiBjb21iaW5hdGlvbiBpbiB0aGUKPiA+IGdkYiBzdHViLCBidXQgX3Byb2JhYmx5
XyB0aGF0IGRvZXNuJ3QgbWF0dGVyPwo+Cj4gVGhhdCBzb3VuZHMgcmVhc29uYWJsZS4gSSB3YXMg
Y29uY2VybmVkIHdoZXRoZXIgdGhpcyB3b3VsZCBhZmZlY3QKPiBhbnl0aGluZyBlbHNlIHVzaW5n
IHRoZSAtPnBvbGxfcHV0X2NoYXIoKSB0dHkgb3BlcmF0aW9uLCBidXQga2dkYiBzZWVtcwo+IHRv
IGJlIHRoZSBvbmx5IHVzZXIsIGRvZXMgdGhhdCBzb3VuZCByaWdodD8KClJpZ2h0LiBBcyBmYXIg
YXMgSSBjYW4gdGVsbCwga2dkYiBpcyB0aGUgb25seSB1c2VyIG9mIHBvbGxfcHV0X2NoYXIoKS4K
Ci1Eb3VnCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
S2dkYi1idWdyZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2Ri
LWJ1Z3JlcG9ydAo=
